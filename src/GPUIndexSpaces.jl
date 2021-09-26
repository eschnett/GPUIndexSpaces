module GPUIndexSpaces

using OrderedCollections

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

################################################################################

const SizeT = Int32              # Int32 (faster) or Int64 (for large arrays)

# # Bit access helpers
# getbit(expression::AbstractString, i::Int) = "(($expression) >> $i) & 1"
# setbit(expression::AbstractString, i::Int) = "($expression) << $i"

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

function make_uint(i::Integer)
    @assert i ≥ 0
    i ≤ typemax(UInt8) && return UInt8(i)
    i ≤ typemax(UInt16) && return UInt16(i)
    i ≤ typemax(UInt32) && return UInt32(i)
    i ≤ typemax(UInt64) && return UInt64(i)
    @assert false
end

struct BitMap
    srcbit::Int
    dstbit::Int
    dist::Int
    BitMap(srcbit::Int, dstbit::Int) = new(srcbit, dstbit, dstbit - srcbit)
end
function movebits(expression::Code, bitmap::Vector{BitMap}, expression_mask::Integer=0)
    expression_mask = UInt(expression_mask)
    # Assert all sources are unique
    @assert length(Set(bm.srcbit for bm in bitmap)) == length(bitmap)
    distances = Set(bm.dist for bm in bitmap)
    exprs = Code[]
    for distance in sort!(collect(distances))
        expr = expression
        bits = Int[bm.srcbit for bm in bitmap if bm.dist == distance]
        @assert !isempty(bits)
        mask = make_uint(sum(UInt(1) << bit for bit in bits))
        @assert mask ≠ 0
        if expression_mask ≠ 0
            @assert mask | expression_mask == expression_mask
        end
        if expr isa Number
            expr = expr & mask
        else
            if mask ≠ expression_mask
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

export AbstractStep, inname, outname, inmap, outmap, expression
abstract type AbstractStep end
description(::AbstractStep) = error("undefined")
inname(::AbstractStep) = error("undefined")
outname(::AbstractStep) = error("undefined")
inmap(::AbstractStep) = error("undefined")
outmap(::AbstractStep) = error("undefined")
expression(::AbstractStep) = error("undefined")

function Base.show(io::IO, step::AbstractStep)
    println(io, "# $(description(step))")
    println(io, "#   Input: $(inname(step))")
    println(io, "#   Output: $(outname(step))")
    println(io, "#   Input mapping:")
    for (k, v) in sort!(OrderedDict(inmap(step).mapping))
        println(io, "#     $k => $v")
    end
    println(io, "#   Output mapping:")
    for (k, v) in sort!(OrderedDict(outmap(step).mapping))
        println(io, "#     $k => $v")
    end
    #STRING return println(io, join(expression(step), "\n"))
    return println(io, expression(step))
end

export Step
struct Step <: AbstractStep
    description::String
    inname::Symbol
    outname::Symbol
    inmap::Mapping
    outmap::Mapping
    #STRING expression::Vector{String}
    expression::Code
end
description(step::Step) = step.description
inname(step::Step) = step.inname
outname(step::Step) = step.outname
inmap(step::Step) = step.inmap
outmap(step::Step) = step.outmap
expression(step::Step) = step.expression

export Id
struct Id <: AbstractStep
    mapping::Mapping
    name::Symbol
end
description(step::Id) = "No-op"
inname(step::Id) = step.name
outname(step::Id) = step.name
inmap(step::Id) = step.mapping
outmap(step::Id) = step.mapping
#STRING expression(step::Id) = []
expression(step::Id) = quote end

export Seq
struct Seq <: AbstractStep
    step1::AbstractStep
    step2::AbstractStep
    function Seq(step1::AbstractStep, step2::AbstractStep)
        @assert outname(step1) == inname(step2)
        @assert outmap(step1) == inmap(step2)
        return new(step1, step2)
    end
end
description(step::Seq) = join([description(step.step1), description(step.step2)], "; ")
inname(step::Seq) = inname(step.step1)
outname(step::Seq) = outname(step.step2)
inmap(step::Seq) = inmap(step.step1)
outmap(step::Seq) = outmap(step.step2)
#STRING expression(step::Seq) = [expression(step.step1); expression(step.step2)]
expression(step::Seq) = quote
    $(expression(step.step1))
    $(expression(step.step2))
end

Base.:(∘)(step2::AbstractStep, step1::AbstractStep) = Seq(step1, step2)
Base.:|>(step1::AbstractStep, step2::AbstractStep) = Seq(step1, step2)

################################################################################

#STRING export prelude
#STRING prelude() = """
#STRING __device__ __forceinline__ int8_t get_int8_0(int x) { return (uint8_t)x; }
#STRING __device__ __forceinline__ int8_t get_int8_1(int x) { return (uint8_t)(x >> 8); }
#STRING __device__ __forceinline__ int8_t get_int8_2(int x) { return (uint8_t)(x >> 16); }
#STRING __device__ __forceinline__ int8_t get_int8_4(int x) { return (uint8_t)(x >> 24); }
#STRING 
#STRING __device__ __forceinline__ int assemble_int8(int8_t x0, int8_t x1, int8_t x2, int8_t x3) {
#STRING   return (unsigned)(uint8_t)x0 | ((unsigned)(uint8_t)x1 << 8) | ((unsigned)(uint8_t)x2 << 16) | ((unsigned)(uint8_t)x3 << 24);
#STRING }
#STRING 
#STRING __device__ __forceinline__ int16_t get_int16_0(int x) { return (uint16_t)x; }
#STRING __device__ __forceinline__ int16_t get_int16_1(int x) { return (uint16_t)(x >> 16); }
#STRING 
#STRING __device__ __forceinline__ int assemble_int16(int16_t x0, int16_t x1) {
#STRING   return (unsigned)(uint16_t)x0 | ((unsigned)(uint16_t)x1 << 16);
#STRING }
#STRING """

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

export constant
function constant(outname::Symbol, outmap::Mapping, value::Code)
    registers = [v.bit for (k, v) in outmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in outmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1
    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        if simd_bits == 0
            push!(stmts, quote
                      $(Symbol(outname, rname)) = $value
                  end)
        elseif simd_bits == 1
            push!(stmts, quote
                      $(Symbol(outname, rname)) = assemble_int16($value, $value)
                  end)
        elseif simd_bits == 2
            push!(stmts, quote
                      $(Symbol(outname, rname)) = assemble_int8($value, $value, $value, $value)
                  end)
        else
            @assert false
        end
    end
    return Step("Set to constant", Symbol("(nothing)"), outname, Mapping(Dict()), outmap, quote
                    $(stmts...)
                end)
end

export assign
function assign(inname::Symbol, outname::Symbol, inmap::Mapping)
    registers = [v.bit for (k, v) in inmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        push!(stmts, quote
                  $(Symbol(outname, rname)) = $(Symbol(inname, rname))
              end)
    end
    return Step("Assign to variable", inname, outname, inmap, inmap, quote
                    $(stmts...)
                end)
end

export apply
function apply(inname::Symbol, outname::Symbol, inmap::Mapping, fun::Function)
    registers = [v.bit for (k, v) in inmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in inmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1
    stmts = Code[]
    for r in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$r"
        if simd_bits == 0
            result = push!(stmts, quote
                               $(Symbol(outname, rname)) = $(fun(Symbol(inname, rname))::Code)
                           end)
        elseif simd_bits == 1
            push!(stmts, "const int16_t $outname$(rname)_in0 = get_int16_0($inname$rname);")
            push!(stmts, "const int16_t $outname$(rname)_in1 = get_int16_1($inname$rname);")
            funcall0 = fun("$outname$(rname)_in0")
            funcall1 = fun("$outname$(rname)_in1")
            push!(stmts, "const int16_t $outname$(rname)_out0 = $funcall0;")
            push!(stmts, "const int16_t $outname$(rname)_out1 = $funcall1;")
            push!(stmts, "const int $outname$rname = assemble_int16($outname$(rname)_out0, $outname$(rname)_out1);")
        elseif simd_bits == 2
            push!(stmts, "const int8_t $outname$(rname)_in0 = get_int8_0($inname$rname);")
            push!(stmts, "const int8_t $outname$(rname)_in1 = get_int8_1($inname$rname);")
            push!(stmts, "const int8_t $outname$(rname)_in2 = get_int8_2($inname$rname);")
            push!(stmts, "const int8_t $outname$(rname)_in3 = get_int8_3($inname$rname);")
            funcall0 = fun("$outname$(rname)_in0")
            funcall1 = fun("$outname$(rname)_in1")
            funcall2 = fun("$outname$(rname)_in2")
            funcall3 = fun("$outname$(rname)_in3")
            push!(stmts, "const int8_t $outname$(rname)_out0 = $funcall0;")
            push!(stmts, "const int8_t $outname$(rname)_out1 = $funcall1;")
            push!(stmts, "const int8_t $outname$(rname)_out2 = $funcall2;")
            push!(stmts, "const int8_t $outname$(rname)_out3 = $funcall3;")
            push!(stmts,
                  "const int $outname$rname = assemble_int8($outname$(rname)_out0, $outname$(rname)_out1, $outname$(rname)_out2, $outname$(rname)_out3);")
        elseif simd_bits == 3
            # TODO
            result = push!(stmts, quote
                               $(Symbol(outname, rname)) = $(fun(Symbol(inname, rname))::Code)
                           end)
        else
            @assert false
        end
    end
    return Step("Apply function", inname, outname, inmap, inmap, quote
                    $(stmts...)
                end)
end

export load
function load(memname::Symbol, outname::Symbol, memmap::Mapping, outmap::Mapping)
    blocks = [v.bit for (k, v) in outmap.mapping if v isa Block]
    block_bits = isempty(blocks) ? 0 : maximum(blocks) + 1
    warps = [v.bit for (k, v) in outmap.mapping if v isa Warp]
    warp_bits = isempty(warps) ? 0 : maximum(warps) + 1
    threads = [v.bit for (k, v) in outmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in outmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in outmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    mem_simds = [v.bit for (k, v) in memmap.mapping if v isa SIMD]
    mem_simd_bits = isempty(mem_simds) ? 0 : maximum(mem_simds) + 1
    @assert mem_simd_bits == simd_bits
    all_simd_bits_equal = Dict(k => v for (k, v) in outmap.mapping if v isa SIMD) ==
                          Dict(k => v for (k, v) in memmap.mapping if v isa SIMD)

    memmap_inv_inmap = memmap ∘ inv(outmap)

    stmts = Code[]
    for reg in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$reg"
        if all_simd_bits_equal
            expressions = Code[]
            # TODO: Convert to `size_t`
            # TODO: This assumes a memory layout in `int`s, not bytes
            # TODO: Check for bank conflicts
            push!(expressions,
                  movebits(:((blockIdx().x - 1) % $SizeT),
                           [BitMap(b, (memmap_inv_inmap[Block(b)]::Memory).bit) for b in 0:(block_bits - 1)],
                           (1 << max_block_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().y - 1) % $SizeT),
                           [BitMap(w, (memmap_inv_inmap[Warp(w)]::Memory).bit) for w in 0:(warp_bits - 1)],
                           (1 << max_warp_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().x - 1) % $SizeT),
                           [BitMap(t, (memmap_inv_inmap[Thread(t)]::Memory).bit) for t in 0:(thread_bits - 1)],
                           (1 << max_thread_bits) - 1))
            push!(expressions,
                  movebits(SizeT(reg), [BitMap(r, (memmap_inv_inmap[Register(r)]::Memory).bit) for r in 0:(register_bits - 1)]))
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
                      @inbounds $(Symbol(outname, rname)) = $memname[1 + $expression]
                  end)
        else
            @assert false
        end
    end
    return Step("Load from memory", Symbol("(nothing)"), outname, Mapping(Dict()), outmap, quote
                    $(stmts...)
                end)
end

export store
function store(inname::Symbol, memname::Symbol, inmap::Mapping, memmap::Mapping)
    blocks = [v.bit for (k, v) in inmap.mapping if v isa Block]
    block_bits = isempty(blocks) ? 0 : maximum(blocks) + 1
    warps = [v.bit for (k, v) in inmap.mapping if v isa Warp]
    warp_bits = isempty(warps) ? 0 : maximum(warps) + 1
    threads = [v.bit for (k, v) in inmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in inmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in inmap.mapping if v isa SIMD]
    simd_bits = isempty(simds) ? 0 : maximum(simds) + 1

    mem_simds = [v.bit for (k, v) in memmap.mapping if v isa SIMD]
    mem_simd_bits = isempty(mem_simds) ? 0 : maximum(mem_simds) + 1
    @assert mem_simd_bits == simd_bits
    all_simd_bits_equal = Dict(k => v for (k, v) in inmap.mapping if v isa SIMD) ==
                          Dict(k => v for (k, v) in memmap.mapping if v isa SIMD)

    memmap_inv_inmap = memmap ∘ inv(inmap)

    stmts = Code[]
    for reg in 0:((1 << register_bits) - 1)
        rname = register_bits == 0 ? "" : "$reg"
        if all_simd_bits_equal
            expressions = Code[]
            # TODO: Convert to `size_t`
            # TODO: This assumes a memory layout in `int`s, not bytes
            # TODO: Check for bank conflicts
            push!(expressions,
                  movebits(:((blockIdx().x - 1) % $SizeT),
                           [BitMap(b, (memmap_inv_inmap[Block(b)]::Memory).bit) for b in 0:(block_bits - 1)],
                           (1 << max_block_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().y - 1) % $SizeT),
                           [BitMap(w, (memmap_inv_inmap[Warp(w)]::Memory).bit) for w in 0:(warp_bits - 1)],
                           (1 << max_warp_bits) - 1))
            push!(expressions,
                  movebits(:((threadIdx().x - 1) % $SizeT),
                           [BitMap(t, (memmap_inv_inmap[Thread(t)]::Memory).bit) for t in 0:(thread_bits - 1)],
                           (1 << max_thread_bits) - 1))
            push!(expressions,
                  movebits(SizeT(reg), [BitMap(r, (memmap_inv_inmap[Register(r)]::Memory).bit) for r in 0:(register_bits - 1)]))
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
                      @inbounds $memname[1 + $expression] = $(Symbol(inname, rname))
                  end)
        else
            @assert false
        end
    end
    return Step("Store to memory", inname, inname, inmap, inmap, quote
                    $(stmts...)
                end)
end

export permute
function permute(inname::Symbol, outname::Symbol, inmap::Mapping, register::Register, simd::SIMD)
    registers = [v.bit for (k, v) in inmap.mapping if v isa Register]
    register_bits = isempty(registers) ? 0 : maximum(registers) + 1
    simds = [v.bit for (k, v) in inmap.mapping if v isa SIMD]
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
                          $(Symbol(outname, rname0)) = $(get_lo4(Symbol(inname, rname0), Symbol(inname, rname1)))
                          $(Symbol(outname, rname1)) = $(get_hi4(Symbol(inname, rname0), Symbol(inname, rname1)))
                      end)
            elseif simd_bits == 3 && simd.bit == 1
                push!(stmts, quote
                          $(Symbol(outname, rname0)) = $(get_lo8(Symbol(inname, rname0), Symbol(inname, rname1)))
                          $(Symbol(outname, rname1)) = $(get_hi8(Symbol(inname, rname0), Symbol(inname, rname1)))
                      end)
            else
                error("not implemented")
            end
        end
    end
    inv_inmap = inv(inmap)
    simd_dual = inv_inmap[simd]
    register_dual = inv_inmap[register]
    outmap = copy(inmap)
    outmap[simd_dual] = register
    outmap[register_dual] = simd
    return Step("Permute Register($(register.bit)) and SIMD($(simd.bit))", inname, outname, inmap, outmap, quote
                    $(stmts...)
                end)
end

function permute(inname::Symbol, outname::Symbol, inmap::Mapping, thread::Thread, register::Register)
    threads = [v.bit for (k, v) in inmap.mapping if v isa Thread]
    thread_bits = isempty(threads) ? 0 : maximum(threads) + 1
    registers = [v.bit for (k, v) in inmap.mapping if v isa Register]
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
                               $(Symbol(outname, rname0)) = $(Symbol(inname, rname0))
                               $(Symbol(outname, rname1)) = $(Symbol(inname, rname1))
                               src = isthread1 ? $(Symbol(inname, rname0)) : $(Symbol(inname, rname1))
                               dst = shfl_xor_sync($(~UInt32(0)), src, mask)
                               if isthread1
                                   $(Symbol(outname, rname0)) = dst
                               else
                                   $(Symbol(outname, rname1)) = dst
                               end
                           end)
        end
    end
    inv_inmap = inv(inmap)
    register_dual = inv_inmap[register]
    thread_dual = inv_inmap[thread]
    outmap = copy(inmap)
    outmap[register_dual] = thread
    outmap[thread_dual] = register
    return Step("Permute Thread($(thread.bit)) and Register($(register.bit))", inname, outname, inmap, outmap, quote
                    $(stmts...)
                end)
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
