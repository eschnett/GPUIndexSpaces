module GPUIndexSpaces

using OrderedCollections

################################################################################

function make_uint(i::Integer)
    @assert i ≥ 0
    i ≤ typemax(UInt8) && return UInt8(i)
    i ≤ typemax(UInt16) && return UInt16(i)
    i ≤ typemax(UInt32) && return UInt32(i)
    i ≤ typemax(UInt64) && return UInt64(i)
    @assert false
end

################################################################################

const SizeT = Int32              # Int32 (faster) or Int64 (for large arrays)

################################################################################

export Index
struct Index{Tag}
    bit::Int
end
function Base.isless(i1::Index{T1}, i2::Index{T2}) where {T1,T2}
    T1 < T2 && return true
    T1 > T2 && return false
    return i1.bit < i2.bit
end

export tag, bit
tag(::Index{Tag}) where {Tag} = Tag
bit(i::Index) = i.bit

Base.show(io::IO, i::Index) = print(io, tag(i), ".", bit(i))

export SIMD, Register, Thread, Warp, Block
const SIMD = Index{:SIMD}
const Register = Index{:Register}
const Thread = Index{:Thread}
const Warp = Index{:Warp}
const Block = Index{:Block}
# const Loop = Index{:Loop}

const max_thread_bits = 5
const max_warp_bits = 5
const max_block_bits = 6

export Memory
const Memory = Index{:Memory}

export Mapping
struct Mapping
    mapping::Dict{Index,Index}
    function Mapping(mapping::Dict)
        # Ensure mapping is injective
        @assert length(Set(values(mapping))) == length(mapping)
        return new(mapping)
    end
end
Base.copy(f::Mapping) = Mapping(copy(f.mapping))
Base.getindex(f::Mapping, i::Index) = f.mapping[i]
Base.setindex!(f::Mapping, value::Index, i::Index) = (f.mapping[i] = value)

Base.inv(f::Mapping) = Mapping(Dict(v => k for (k, v) in f.mapping))
Base.:(∘)(g::Mapping, f::Mapping) = Mapping(Dict(k => g[v] for (k, v) in f.mapping))

################################################################################

export Environment
const Variable = Pair{Symbol,Mapping}
const Environment = Dict{Symbol,Mapping}

################################################################################

################################################################################

const Code = Union{Expr,Number,Symbol}

# # See <https://discourse.julialang.org/t/code-generation-unnecessary-comment-lines-when-using-quote/398/2>
# filter_out_lineno(x) = x
# filter_out_lineno(::LineNumberNode) = nothing
# function filter_out_lineno(ex::Expr)
#     args = []
#     for arg in ex.args
#         arg′ = filter_out_lineno(arg)
#         arg′ ≢ nothing && push!(args, arg′)
#     end
#     return Expr(ex.head, args...)
# end

export AbstractStep, invars, outvars, code
abstract type AbstractStep end
description(::AbstractStep) = error("undefined")
invars(::AbstractStep) = error("undefined")
outvars(::AbstractStep) = error("undefined")
code(::AbstractStep) = error("undefined")

function Base.show(io::IO, step::AbstractStep)
    println(io, "# $(description(step))")
    println(io, "#     Inputs: $(join([var[1] for var in invars(step)], ", "))")
    for var in invars(step)
        println(io, "#         $(var[1]):")
        for (k, v) in sort!(OrderedDict(var[2].mapping))
            println(io, "#             $k => $v")
        end
    end
    println(io, "#     Outputs: $(join([var[1] for var in outvars(step)], ", "))")
    for var in outvars(step)
        println(io, "#         $(var[1]):")
        for (k, v) in sort!(OrderedDict(var[2].mapping))
            println(io, "#             $k => $v")
        end
    end
    return println(io, code(step))
end

export Step
struct Step <: AbstractStep
    description::String
    invars::Vector{Variable}
    outvars::Vector{Variable}
    code::Code
end
description(step::Step) = step.description
invars(step::Step) = step.invars
outvars(step::Step) = step.outvars
code(step::Step) = step.code

export Seq
struct Seq <: AbstractStep
    description::String
    invars::Vector{Variable}
    outvars::Vector{Variable}
    steps::Vector{AbstractStep}
    function Seq(steps::Vector{<:AbstractStep})
        description′ = "{ " * join(description.(steps), "; ") * " }"
        invars′ = Variable[]
        outvars′ = Variable[]
        all_invars = Environment()
        all_outvars = Environment()
        for step in steps
            this_step_insymbols = Set{Symbol}()
            for invar in invars(step)
                @assert invar[1] ∉ this_step_insymbols
                push!(this_step_insymbols, invar[1])
                if invar[1] ∈ keys(all_invars)
                    # Input already seen, ensure mapping matches
                    @assert invar[2] == all_invars[invar[1]]
                else
                    if invar[1] ∈ keys(all_outvars)
                        # Input is a previous output, ensure mapping matches
                        @assert invar[2] == all_outvars[invar[1]]
                    else
                        # New input
                        push!(invars′, invar)
                        all_invars[invar[1]] = invar[2]
                    end
                end
            end
            this_step_outsymbols = Set{Symbol}()
            for outvar in outvars(step)
                @assert outvar[1] ∉ this_step_outsymbols
                push!(this_step_outsymbols, outvar[1])
                if outvar[1] ∈ keys(all_invars)
                    # We don't allow overwriting inputs
                    @assert false
                else
                    if outvar[1] ∈ keys(all_outvars)
                        # Output already seen, ensure mapping matches
                        @assert outvar[2] == all_outvars[outvar[1]]
                    else
                        # New output
                        push!(outvars′, outvar)
                        all_outvars[outvar[1]] = outvar[2]
                    end
                end
            end
        end
        return new(description′, invars′, outvars′, steps)
    end
end
description(step::Seq) = step.description
invars(step::Seq) = step.invars
outvars(step::Seq) = step.outvars
code(step::Seq) = quote
    $(code.(step.steps)...)
end

Base.:|>(step1::AbstractStep, step2::AbstractStep) = Seq([step1, step2])

################################################################################

get_int8_0(x::Int32) = x % Int8
get_int8_1(x::Int32) = (x >>> 8) % Int8
get_int8_2(x::Int32) = (x >>> 16) % Int8
get_int8_3(x::Int32) = (x >>> 24) % Int8

function assemble_int8(x0::Int8, x1::Int8, x2::Int8, x3::Int8)
    return ((x0 % UInt8 % UInt32) | ((x1 % UInt8 % UInt32) << 8) | ((x2 % UInt8 % UInt32) << 16) | ((x3 % UInt8 % UInt32) << 32)) %
           Int32
end

get_int16_0(x::Int32) = x % Int16
get_int16_1(x::Int32) = (x >>> 16) % Int16

assemble_int16(x0::Int16, x1::Int16) = ((x0 % UInt16 % UInt32) | ((x1 % UInt16 % UInt32) << 16)) % Int32

export constant!
function constant!(env::Environment, lhs::Symbol, lhsmap::Mapping, value::Code)
    @assert lhs ∉ keys(env)
    env[lhs] = lhsmap

    registers = [v.bit for (k, v) in lhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in lhsmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        lhsname = Symbol(lhs, rname)
        if simd_bits == 0
            push!(stmts, quote
                      $lhsname = $value
                  end)
        elseif simd_bits == 1
            push!(stmts, quote
                      $lhsname = assemble_int16($value, $value)
                  end)
        elseif simd_bits == 2
            push!(stmts, quote
                      $lhsname = assemble_int8($value, $value, $value, $value)
                  end)
        else
            @assert false
        end
    end

    return Step("Set to constant", Variable[], Variable[lhs => lhsmap], quote
                    $(stmts...)
                end)
end

export assign!
function assign!(env::Environment, lhs::Symbol, rhs::Symbol)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    lhsmap = rhsmap
    env[lhs] = lhsmap

    registers = [v.bit for (k, v) in rhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1

    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        lhsname = Symbol(lhs, rname)
        push!(stmts, quote
                  $lhsname = $(Symbol(rhs, rname))
              end)
    end

    return Step("Assign to variable", Variable[rhs => rhsmap], Variable[lhs => lhsmap], quote
                    $(stmts...)
                end)
end

export apply!
function apply!(env::Environment, lhs::Symbol, rhs::Symbol, fun::Function)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    lhsmap = rhsmap
    env[lhs] = lhsmap

    registers = [v.bit for (k, v) in rhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in rhsmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        lhsname = Symbol(lhs, rname)
        if simd_bits == 0
            result = push!(stmts, quote
                               $lhsname = $(fun(Symbol(rhs, rname))::Code)
                           end)
        elseif simd_bits == 1
            push!(stmts, "const int16_t $name$(rname)_in0 = get_int16_0($var[1]$rname);")
            push!(stmts, "const int16_t $name$(rname)_in1 = get_int16_1($var[1]$rname);")
            funcall0 = fun("$name$(rname)_in0")
            funcall1 = fun("$name$(rname)_in1")
            push!(stmts, "const int16_t $name$(rname)_out0 = $funcall0;")
            push!(stmts, "const int16_t $name$(rname)_out1 = $funcall1;")
            push!(stmts, "const int $name$rname = assemble_int16($name$(rname)_out0, $name$(rname)_out1);")
        elseif simd_bits == 2
            push!(stmts, "const int8_t $name$(rname)_in0 = get_int8_0($var[1]$rname);")
            push!(stmts, "const int8_t $name$(rname)_in1 = get_int8_1($var[1]$rname);")
            push!(stmts, "const int8_t $name$(rname)_in2 = get_int8_2($var[1]$rname);")
            push!(stmts, "const int8_t $name$(rname)_in3 = get_int8_3($var[1]$rname);")
            funcall0 = fun("$name$(rname)_in0")
            funcall1 = fun("$name$(rname)_in1")
            funcall2 = fun("$name$(rname)_in2")
            funcall3 = fun("$name$(rname)_in3")
            push!(stmts, "const int8_t $name$(rname)_out0 = $funcall0;")
            push!(stmts, "const int8_t $name$(rname)_out1 = $funcall1;")
            push!(stmts, "const int8_t $name$(rname)_out2 = $funcall2;")
            push!(stmts, "const int8_t $name$(rname)_out3 = $funcall3;")
            push!(stmts,
                  "const int $name$rname = assemble_int8($name$(rname)_out0, $name$(rname)_out1, $name$(rname)_out2, $name$(rname)_out3);")
        elseif simd_bits == 3
            # TODO
            result = push!(stmts, quote
                               $lhsname = $(fun(Symbol(rhs, rname))::Code)
                           end)
        else
            @assert false
        end
    end

    return Step("Apply function", Variable[rhs => rhsmap], Variable[lhs => lhsmap], quote
                    $(stmts...)
                end)
end

################################################################################

const lomask4 = 0x0f0f0f0f
get_lo4(r0::UInt32, r1::UInt32) = (r0 & lomask4) | ((r1 << 0x04) & ~lomask4)
get_hi4(r0::UInt32, r1::UInt32) = ((r0 >> 0x04) & lomask4) | (r1 & ~lomask4)
get_lo4(r0::Int32, r1::Int32) = get_lo4(r0 % UInt32, r1 % UInt32) % Int32
get_hi4(r0::Int32, r1::Int32) = get_hi4(r0 % UInt32, r1 % UInt32) % Int32

# const lomask8 = 0x00ff00ff
# get_lo8(r0::UInt32, r1::UInt32) = (r0 & lomask8) | ((r1 << 0x08) & ~lomask8)
# get_hi8(r0::UInt32, r1::UInt32) = ((r0 >> 0x08) & lomask8) | (r1 & ~lomask8)
# get_lo8(r0::Int32, r1::Int32) = get_lo8(r0 % UInt32, r1 % UInt32) % Int32
# get_hi8(r0::Int32, r1::Int32) = get_hi8(r0 % UInt32, r1 % UInt32) % Int32
get_lo8(r0::Int32, r1::Int32) = CUDA.byte_perm(r0, r1, 0x6420)
get_hi8(r0::Int32, r1::Int32) = CUDA.byte_perm(r0, r1, 0x7531)

# const lomask16 = 0x0000ffff
# get_lo16(r0::UInt32, r1::UInt32) = (r0 & lomask16) | ((r1 << 0x10) & ~lomask16)
# get_hi16(r0::UInt32, r1::UInt32) = ((r0 >> 0x10) & lomask16) | (r1 & ~lomask16)
# get_lo16(r0::Int32, r1::Int32) = get_lo16(r0 % UInt32, r1 % UInt32) % Int32
# get_hi16(r0::Int32, r1::Int32) = get_hi16(r0 % UInt32, r1 % UInt32) % Int32
get_lo16(r0::Int32, r1::Int32) = CUDA.byte_perm(r0, r1, 0x5410)
get_hi16(r0::Int32, r1::Int32) = CUDA.byte_perm(r0, r1, 0x7632)

# TODO: ES: Each call is translated to 1 shift and 2 logical
# operations. I think 1 shift and 1 logical operation should suffice.
get_lo4u(r0::Code, r1::Code) = :(($r0 & $lomask4) | (($r1 << 0x04) & ~$lomask4))
get_hi4u(r0::Code, r1::Code) = :((($r0 >> 0x04) & $lomask4) | ($r1 & ~$lomask4))
get_lo4(r0::Code, r1::Code) = :($(get_lo4u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)
get_hi4(r0::Code, r1::Code) = :($(get_hi4u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)

# get_lo8u(r0::Code, r1::Code) = :(($r0 & $lomask8) | (($r1 << 0x08) & ~$lomask8))
# get_hi8u(r0::Code, r1::Code) = :((($r0 >> 0x08) & $lomask8) | ($r1 & ~$lomask8))
# get_lo8(r0::Code, r1::Code) = :($(get_lo8u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)
# get_hi8(r0::Code, r1::Code) = :($(get_hi8u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)
get_lo8(r0::Code, r1::Code) = :(CUDA.byte_perm($r0 % UInt32, $r1 % UInt32, 0x6420 % UInt32) % Int32)
get_hi8(r0::Code, r1::Code) = :(CUDA.byte_perm($r0 % UInt32, $r1 % UInt32, 0x7531 % UInt32) % Int32)

# get_lo16u(r0::Code, r1::Code) = :(($r0 & $lomask16) | (($r1 << 0x10) & ~$lomask16))
# get_hi16u(r0::Code, r1::Code) = :((($r0 >> 0x10) & $lomask16) | ($r1 & ~$lomask16))
# get_lo16(r0::Code, r1::Code) = :($(get_lo16u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)
# get_hi16(r0::Code, r1::Code) = :($(get_hi16u(:($r0 % UInt32), :($r1 % UInt32))) % Int32)
get_lo16(r0::Code, r1::Code) = :(CUDA.byte_perm($r0 % UInt32, $r1 % UInt32, 0x5410 % UInt32) % Int32)
get_hi16(r0::Code, r1::Code) = :(CUDA.byte_perm($r0 % UInt32, $r1 % UInt32, 0x7632 % UInt32) % Int32)

struct BitMap
    srcbit::Int
    dstbit::Int
    dist::Int
    BitMap(srcbit::Int, dstbit::Int) = new(srcbit, dstbit, dstbit - srcbit)
end
function movebits(code::Code, bitmap::Vector{BitMap}, code_mask::Integer=0)
    code_mask = UInt(code_mask)
    # Assert all sources are unique
    @assert length(Set(bm.srcbit for bm in bitmap)) == length(bitmap)
    distances = Set(bm.dist for bm in bitmap)
    exprs = Code[]
    for distance in sort!(collect(distances))
        expr = code
        bits = Int[bm.srcbit for bm in bitmap if bm.dist == distance]
        @assert !isempty(bits)
        mask = make_uint(sum(UInt(1) << bit for bit in bits))
        @assert mask ≠ 0
        if code_mask ≠ 0
            @assert mask | code_mask == code_mask
        end
        if expr isa Number
            expr = expr & mask
        else
            if mask ≠ code_mask
                expr = :($expr & $mask)
            end
        end
        if expr isa Number
            expr = expr << distance
        else
            if distance < 0
                expr = :($expr >>> $(make_uint(-distance)))
            elseif distance > 0
                expr = :($expr << $(make_uint(distance)))
            else
                # do nothing
            end
        end
        push!(exprs, expr)
    end
    # Optimize expression
    filter!(≠(0), exprs)
    # Convert constants to `Int` to produce more efficient PTX code,
    # where offsets can be included in the load/store instructions and
    # don't require explicit add instructions
    exprs = map(expr -> expr isa Integer ? Int(expr) : expr, exprs)
    if length(exprs) == 0
        expr = make_uint(0)
    elseif length(exprs) == 1
        expr = exprs[1]
    else
        expr = :(+($(exprs...)))
    end
    return expr::Code
end

export load!
function load!(env::Environment, lhs::Symbol, lhsmap::Mapping, mem::Symbol, memmap::Mapping)
    @assert lhs ∉ keys(env)
    env[lhs] = lhsmap

    blocks = [v.bit for (k, v) in lhsmap.mapping if v isa Block]
    block_bits = isempty(blocks) ? 0 : maximum(blocks) + 1
    warps = [v.bit for (k, v) in lhsmap.mapping if v isa Warp]
    warp_bits = isempty(warps) ? 0 : maximum(warps) + 1
    threads = [v.bit for (k, v) in lhsmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in lhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in lhsmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    mem_simds = [v.bit for (k, v) in memmap.mapping if v isa SIMD]
    mem_simd_bits = isempty(mem_simds) ? 0 : maximum(mem_simds) + 1
    @assert mem_simd_bits == simd_bits
    all_simd_bits_equal = Dict(k => v for (k, v) in lhsmap.mapping if v isa SIMD) ==
                          Dict(k => v for (k, v) in memmap.mapping if v isa SIMD)

    mem_inv_lhsmap = memmap ∘ inv(lhsmap)

    stmts = Code[]
    for reg in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$reg"
        lhsname = Symbol(lhs, rname)
        if all_simd_bits_equal
            expressions = Code[]
            # TODO: This assumes a memory layout in `int`s, not bytes
            # TODO: Check for bank conflicts
            push!(expressions,
                  movebits(:((blockIdx().x - 1) % $SizeT),
                           [BitMap(b, (mem_inv_lhsmap[Block(b)]::Memory).bit) for b in 0:(block_bits - 1)],
                           (1 << max_block_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().y - 1) % $SizeT),
                           [BitMap(w, (mem_inv_lhsmap[Warp(w)]::Memory).bit) for w in 0:(warp_bits - 1)], (1 << max_warp_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().x - 1) % $SizeT),
                           [BitMap(t, (mem_inv_lhsmap[Thread(t)]::Memory).bit) for t in 0:(thread_bits - 1)],
                           (1 << max_thread_bits) - 1))
            push!(expressions,
                  movebits(SizeT(reg), [BitMap(r, (mem_inv_lhsmap[Register(r)]::Memory).bit) for r in 0:(register_bits - 1)]))
            @assert !isempty(expressions)
            filter!(≠(0), expressions)
            if length(expressions) == 0
                expression = make_uint(0)
            elseif length(expressions) == 1
                expression = expressions[1]
            else
                expression = :(+($(expressions...)))
            end
            # It is important to write `1 + $expression` instead of
            # `$expression + 1`, so that the added `1` can be combined
            # with the subtracted `1` in the `getindex` function.
            push!(stmts, quote
                      @inbounds $lhsname = $mem[1 + $expression]
                  end)
        else
            @assert false
        end
    end
    return Step("Load from memory", Variable[], Variable[lhs => lhsmap], quote
                    $(stmts...)
                end)
end

export store!
function store!(env::Environment, rhs::Symbol, mem::Symbol, memmap::Mapping)
    rhsmap = env[rhs]

    blocks = [v.bit for (k, v) in rhsmap.mapping if v isa Block]
    block_bits = isempty(blocks) ? 0 : maximum(blocks) + 1
    warps = [v.bit for (k, v) in rhsmap.mapping if v isa Warp]
    warp_bits = isempty(warps) ? 0 : maximum(warps) + 1
    threads = [v.bit for (k, v) in rhsmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in rhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in rhsmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    mem_simds = [v.bit for (k, v) in memmap.mapping if v isa SIMD]
    mem_simd_bits = isempty(mem_simds) ? 0 : maximum(mem_simds) + 1
    @assert mem_simd_bits == simd_bits
    all_simd_bits_equal = Dict(k => v for (k, v) in rhsmap.mapping if v isa SIMD) ==
                          Dict(k => v for (k, v) in memmap.mapping if v isa SIMD)

    mem_inv_rhsmap = memmap ∘ inv(rhsmap)

    stmts = Code[]
    for reg in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$reg"
        rhsname = Symbol(rhs, rname)
        if all_simd_bits_equal
            expressions = Code[]
            # TODO: This assumes a memory layout in `int`s, not bytes
            # TODO: Check for bank conflicts
            push!(expressions,
                  movebits(:((blockIdx().x - 1) % $SizeT),
                           [BitMap(b, (mem_inv_rhsmap[Block(b)]::Memory).bit) for b in 0:(block_bits - 1)],
                           (1 << max_block_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().y - 1) % $SizeT),
                           [BitMap(w, (mem_inv_rhsmap[Warp(w)]::Memory).bit) for w in 0:(warp_bits - 1)], (1 << max_warp_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().x - 1) % $SizeT),
                           [BitMap(t, (mem_inv_rhsmap[Thread(t)]::Memory).bit) for t in 0:(thread_bits - 1)],
                           (1 << max_thread_bits) - 1))
            push!(expressions,
                  movebits(SizeT(reg), [BitMap(r, (mem_inv_rhsmap[Register(r)]::Memory).bit) for r in 0:(register_bits - 1)]))
            @assert !isempty(expressions)
            filter!(≠(0), expressions)
            if length(expressions) == 0
                expression = make_uint(0)
            elseif length(expressions) == 1
                expression = expressions[1]
            else
                expression = :(+($(expressions...)))
            end
            # It is important to write `1 + $expression` instead of
            # `$expression + 1`, so that the added `1` can be combined
            # with the subtracted `1` in the `getindex` function.
            push!(stmts, quote
                      @inbounds $mem[1 + $expression] = $rhsname
                  end)
        else
            @assert false
        end
    end
    return Step("Store to memory", [rhs => rhsmap], Variable[], quote
                    $(stmts...)
                end)
end

################################################################################

function Base.permute!(env::Environment, lhs::Symbol, rhs::Symbol, register::Register, simd::SIMD)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)
    simd_dual = inv_rhsmap[simd]
    register_dual = inv_rhsmap[register]
    lhsmap = copy(rhsmap)
    lhsmap[simd_dual] = register
    lhsmap[register_dual] = simd
    env[lhs] = lhsmap

    registers = [v.bit for (k, v) in rhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in rhsmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1
    @assert 0 ≤ register.bit < register_bits
    @assert 0 ≤ simd.bit < simd_bits

    stmts = Code[]
    for reg in 0:((1 << register_bits) - 1)
        if reg & (1 << register.bit) == 0
            reg0 = reg
            reg1 = reg | (1 << register.bit)
            rname0 = register_bits == 0 ? "" : "$reg0"
            rname1 = register_bits == 0 ? "" : "$reg1"
            if simd_bits == 3 && simd.bit == 0
                push!(stmts, quote
                          $(Symbol(lhs, rname0)) = $(get_lo4(Symbol(rhs, rname0), Symbol(rhs, rname1)))
                          $(Symbol(lhs, rname1)) = $(get_hi4(Symbol(rhs, rname0), Symbol(rhs, rname1)))
                      end)
            elseif simd_bits == 3 && simd.bit == 1
                push!(stmts, quote
                          $(Symbol(lhs, rname0)) = $(get_lo8(Symbol(rhs, rname0), Symbol(rhs, rname1)))
                          $(Symbol(lhs, rname1)) = $(get_hi8(Symbol(rhs, rname0), Symbol(rhs, rname1)))
                      end)
            else
                error("not implemented")
            end
        end
    end

    return Step("Permute Register($(register.bit)) and SIMD($(simd.bit))", Variable[rhs => rhsmap], Variable[lhs => lhsmap],
                quote
                    $(stmts...)
                end)
end

function Base.permute!(env::Environment, lhs::Symbol, rhs::Symbol, thread::Thread, register::Register)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)
    register_dual = inv_rhsmap[register]
    thread_dual = inv_rhsmap[thread]
    lhsmap = copy(rhsmap)
    lhsmap[register_dual] = thread
    lhsmap[thread_dual] = register
    env[lhs] = lhsmap

    threads = [v.bit for (k, v) in rhsmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in rhsmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    @assert 0 ≤ thread.bit < thread_bits
    @assert 0 ≤ register.bit < register_bits

    stmts = Code[]
    push!(stmts, quote
              mask = $(UInt32(1 << thread.bit))
              # Thread 0: exchange register 1
              # Thread 1: exchange register 0
              isthread1 = ((threadIdx().x - 1) % Int32) & mask ≠ 0
          end)
    for reg in 0:((1 << register_bits) - 1)
        if reg & (1 << register.bit) == 0
            reg0 = reg
            reg1 = reg | (1 << register.bit)
            rname0 = register_bits == 0 ? "" : "$reg0"
            rname1 = register_bits == 0 ? "" : "$reg1"
            result = push!(stmts, quote
                               $(Symbol(lhs, rname0)) = $(Symbol(rhs, rname0))
                               $(Symbol(lhs, rname1)) = $(Symbol(rhs, rname1))
                               src = isthread1 ? $(Symbol(rhs, rname0)) : $(Symbol(rhs, rname1))
                               dst = shfl_xor_sync($(~UInt32(0)), src, mask)
                               if isthread1
                                   $(Symbol(lhs, rname0)) = dst
                               else
                                   $(Symbol(lhs, rname1)) = dst
                               end
                           end)
        end
    end

    return Step("Permute Thread($(thread.bit)) and Register($(register.bit))", Variable[rhs => rhsmap], Variable[lhs => lhsmap],
                quote
                    $(stmts...)
                end)
end

################################################################################

export wmma_mma_row_col_m16n16k16_s8!
function wmma_mma_row_col_m16n16k16_s8!(env::Environment, D::Symbol, A::Symbol, B::Symbol, C::Symbol)
    Amap = env[A]
    Bmap = env[B]
    Cmap = env[C]
    @assert D ∉ keys(env)
    Dmap = Cmap
    env[D] = Dmap

    threads_A = [v.bit for (k, v) in Amap.mapping if v isa Thread]
    thread_bits_A = isempty(threads_A) ? 0 : maximum(threads_A) + 1
    registers_A = [v.bit for (k, v) in Amap.mapping if v isa Register]
    register_bits_A = isempty(registers_A) ? 0 : maximum(registers_A) + 1
    simds_A = [v.bit for (k, v) in Amap.mapping if v isa SIMD]
    simd_bits_A = isempty(simds_A) ? 0 : maximum(simds_A) + 1

    threads_B = [v.bit for (k, v) in Bmap.mapping if v isa Thread]
    thread_bits_B = isempty(threads_B) ? 0 : maximum(threads_B) + 1
    registers_B = [v.bit for (k, v) in Bmap.mapping if v isa Register]
    register_bits_B = isempty(registers_B) ? 0 : maximum(registers_B) + 1
    simds_B = [v.bit for (k, v) in Bmap.mapping if v isa SIMD]
    simd_bits_B = isempty(simds_B) ? 0 : maximum(simds_B) + 1

    threads_C = [v.bit for (k, v) in Cmap.mapping if v isa Thread]
    thread_bits_C = isempty(threads_C) ? 0 : maximum(threads_C) + 1
    registers_C = [v.bit for (k, v) in Cmap.mapping if v isa Register]
    register_bits_C = isempty(registers_C) ? 0 : maximum(registers_C) + 1
    simds_C = [v.bit for (k, v) in Cmap.mapping if v isa SIMD]
    simd_bits_C = isempty(simds_C) ? 0 : maximum(simds_C) + 1

    @assert thread_bits_A == 5
    @assert register_bits_A == 1
    @assert simd_bits_A == 2

    @assert thread_bits_B == 5
    @assert register_bits_B == 1
    @assert simd_bits_B == 2

    @assert thread_bits_C == 5
    @assert register_bits_C == 3
    @assert simd_bits_C == 0

    stmt = quote
        A_frag = ($([:($(Symbol(A, i)) % UInt32) for i in 0:1]...),)::NTuple{2,UInt32}
        B_frag = ($([:($(Symbol(B, i)) % UInt32) for i in 0:1]...),)::NTuple{2,UInt32}
        C_frag = ($([Symbol(C, i) for i in 0:7]...),)::NTuple{8,Int32}
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        ($([Symbol(D, i) for i in 0:7]...),) = D_frag
    end

    return Step("WMMA::mma 16x16x16", Variable[A => Amap, B => Bmap, C => Cmap], Variable[D => Dmap], stmt)
end

# function permute_simd(inmap::Mapping, perm::Mapping)
#     simd03(i) = i isa SIMD && 0 ≤ i.bit < 2
#     @assert length(perm) == 4
#     @assert all(simd03(k) && simd03(v) for (k, v) in perm)
#     for (k, v) in inmap
#         k isa SIMD && @assert 0 ≤ k.bit < 2
#         v isa SIMD && @assert 0 ≤ v.bit < 2
#     end
#     outmap = copy(inmap)
#     for i in 0:3
#         outmap[SIMD(i)] = inmap[SIMD(perm[SIMD(i)])]
#     end
#     bytes = Array{Int}(undef, 4)
#     for i in 0:3
#         bits = [(i >> n) & 1 for n in 0:1]
#         newbits = [bits[perm[SIMD(n)].bit + 1] for n in 0:1]
#         bytes[i + 1] = sum(newbits[n + 1] << n for n in 0:1)
#     end
#     s = sum(bytes[i + 1] << (4 * i) for i in 0:3)
#     @assert s ∈ [0x3210, 0x3120]
#     return Step("Permute SIMD entries", inmap, outmap, ["__byte_perm(r, 0, 0x$(string(s; base=16)));"])
# end
# 
# function permute_thread(inmap::Mapping, perm::Mapping)
#     thread04(i) = i isa Thread && 0 ≤ i.bit < 5
#     @assert length(perm) == 5
#     @assert all(thread04(k) && thread04(v) for (k, v) in perm)
#     for (k, v) in inmap
#         k isa Thread && @assert 0 ≤ k.bit < 5
#         v isa Thread && @assert 0 ≤ v.bit < 5
#     end
#     outmap = copy(inmap)
#     for i in 0:4
#         outmap[Thread(i)] = inmap[Thread(perm[Thread(i)])]
#     end
#     sources = String[]
#     for i in 0:4
#         j = perm[Thread(i)].bit
#         push!(sources, setbit(getbit("threadIdx.x", i), j))
#     end
#     source = "(" * join(sources, ") | (") * ")"
#     return Step("Permute threads", inmap, outmap, ["__shfl_sync(~0U, r, $source);"])
# end

# convert_int8_to_int16 (with more registers)
# convert_int16_to_int32 (with more registers)
# convert_int8_to_int32 (with more registers)
# convert_int16_to_int8 (with fewer registers)
# convert_int32_to_int16 (with fewer registers)
# convert_int32_to_int8 (with fewer registers)
# TODO: Implement the 8- and 16-bit `apply` above this way.

end
