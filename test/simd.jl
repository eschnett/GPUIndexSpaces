using CUDA
using LLVM

################################################################################

struct Int8x4
    val::UInt32
end
# vadd4, vsub4, vmin4, vmax4, vset4

################################################################################

struct Float16x2
    val::UInt32
end
function Float16x2(a::Float32, b::Float32)
    return Float16x2(LLVM.Interop.@asmcall("cvt.rn.f16x2.f32 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{Float32,Float32}, a, b))
end
function convert(::Type{Tuple{Float32,Float32}}, a::Float16x2)
    return (LLVM.Interop.@asmcall("cvt.f32.f16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val),
            LLVM.Interop.@asmcall("cvt.f32.f16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val >> 0x10))
end
Base.:+(a::Float16x2) = a
Base.:-(a::Float16x2) = Float16x2(LLVM.Interop.@asmcall("neg.rn.f16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
Base.abs(a::Float16x2) = Float16x2(LLVM.Interop.@asmcall("abs.rn.f16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
function Base.:+(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("add.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:-(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("sub.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:*(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("mul.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.muladd(a::Float16x2, b::Float16x2, c::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("fma.rn.f16x2 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{UInt32,UInt32,UInt32},
                                           a.val, b.val, c.val))
end

struct BFloat16x2
    val::UInt32
end
function BFloat16x2(a::Float32, b::Float32)
    return BFloat16x2(LLVM.Interop.@asmcall("cvt.rn.bf16x2.f32 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{Float32,Float32}, a, b))
end
function convert(::Type{Tuple{Float32,Float32}}, a::BFloat16x2)
    return (LLVM.Interop.@asmcall("cvt.f32.bf16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val),
            LLVM.Interop.@asmcall("cvt.f32.bf16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val >> 0x10))
end
Base.:+(a::BFloat16x2) = a
Base.:-(a::BFloat16x2) = BFloat16x2(LLVM.Interop.@asmcall("neg.rn.bf16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
Base.abs(a::BFloat16x2) = BFloat16x2(LLVM.Interop.@asmcall("abs.rn.bf16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
function Base.:+(a::BFloat16x2, b::BFloat16x2)
    return BFloat16x2(LLVM.Interop.@asmcall("add.rn.bf16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:-(a::BFloat16x2, b::BFloat16x2)
    return BFloat16x2(LLVM.Interop.@asmcall("sub.rn.bf16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:*(a::BFloat16x2, b::BFloat16x2)
    return BFloat16x2(LLVM.Interop.@asmcall("mul.rn.bf16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.muladd(a::BFloat16x2, b::BFloat16x2, c::BFloat16x2)
    return BFloat16x2(LLVM.Interop.@asmcall("fma.rn.bf16x2 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{UInt32,UInt32,UInt32},
                                            a.val, b.val, c.val))
end

################################################################################

"""
    int8 -> uint32
"""
function cvt_pack_s8(a::Int32, b::Int32, c::Int32)
    # I2IP.S8.S32.SAT
    return LLVM.Interop.@asmcall("cvt.pack.sat.s8.s32.b32 \$0, \$1, \$2, \$3;", "=r,r,r,r", Int32, Tuple{Int32,Int32,Int32}, a, b,
                                 c)::Int32
end

"""
    int8x4 -> int32
"""
function dp4a(a::Int32, b::Int32, c::Int32)
    # IDP.4A.S8.S8
    return LLVM.Interop.@asmcall("dp4a.s32.s32 \$0, \$1, \$2, \$3;", "=r,r,r,r", Int32, Tuple{Int32,Int32,Int32}, a, b, c)::Int32
end

function kernel(r, x, y, z)
    @inbounds begin
        # r[1] = cvt_pack_s8(x[1], y[1], z[1])
        r[1] = dp4a(x[1], y[1], z[1])
        # a = Float16x2(x[1], y[1])
        # b = Float16x2(y[1], z[1])
        # c = a + b
        # d = convert(Tuple{Float32,Float32}, c)
        # r[1] = d[1]
        # r[2] = d[2]
    end
    return nothing
end

x = CuArray(Int32[1])
y = CuArray(Int32[1])
z = CuArray(Int32[1])
r = CuArray{Int32}(undef, 2)
@device_code_ptx @cuda kernel(r, x, y, z)
@device_code_sass @cuda kernel(r, x, y, z)
