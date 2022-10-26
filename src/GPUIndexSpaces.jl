module GPUIndexSpaces

using BFloat16s
using CUDA
using LLVM
using OrderedCollections

################################################################################

export Int4x2
struct Int4x2
    val::UInt8
end

export Int4x8
struct Int4x8
    val::UInt32
end
export Int8x4
struct Int8x4
    val::UInt32
end
export Int16x2
struct Int16x2
    val::UInt32
end

export Float16x2
struct Float16x2
    val::UInt32
end
export BFloat16x2
struct BFloat16x2
    val::UInt32
end

# Int4x2

Int4x2(a1::Int32, a2::Int32) = Int4x2((a1 << 0x00) & 0x0f | (a2 << 0x04) & 0xf0)

Base.convert(::Type{Int4x2}, a::NTuple{2,Int8}) = Int4x2(a[1], a[2])
function Base.convert(::Type{NTuple{2,Int8}}, a::Int4x2)
    # TODO: Merge the `⊻ 0x88` and the `& 0x0f` into a single LOP3
    a1 = a.val ⊻ 0x88                  # a + 8
    a2_lo = a1 & 0x0f                  # extract low part
    a3_lo = a2_lo + 0x78               # a + 128
    a4_lo = a3_lo ⊻ 0x80               # a
    a2_hi = (a1 >>> 0x04) & 0x0f       # extract high part
    a3_hi = a2_hi + 0x78               # a + 128
    a4_hi = a3_hi ⊻ 0x80               # a
    return (a4_lo % Int8, a4_hi % Int8)::NTuple{2,Int8}
end
function Base.convert(::Type{NTuple{2,Int32}}, a::Int4x2)
    alo8, ahi8 = convert(NTuple{2,Int8}, a)
    alo32 = convert(Int32, alo8)
    ahi32 = convert(Int32, ahi8)
    return (alo32, ahi32)
end

Base.show(io::IO, a::Int4x2) = print(io, convert(NTuple{2,Int32}, a))

Base.length(::Int4x2) = 1

Base.zero(::Type{Int4x2}) = Int4x2(Int8(0))

Base.:~(a::Int4x2) = Int4x2(~a.val)
Base.:&(a::Int4x2, b::Int4x2) = Int4x2(a.val & b.val)
Base.:|(a::Int4x2, b::Int4x2) = Int4x2(a.val | b.val)
Base.xor(a::Int4x2, b::Int4x2) = Int4x2(a.val ⊻ b.val)

function Base.:-(a::Int4x2)
    rlo = (-a.val) & 0x0f
    rhi = -(a.val & 0xf0)
    return Int4x2(rlo | rhi)
end
function Base.:+(a::Int4x2, b::Int4x2)
    rlo = (a.val + b.val) & 0x0f
    rhi = (a.val & 0xf0) + (b.val & 0xf0)
    return Int4x2(rlo | rhi)
end
function Base.:-(a::Int4x2, b::Int4x2)
    rlo = (a.val - b.val) & 0x0f
    rhi = (a.val & 0xf0) - (b.val & 0xf0)
    return Int4x2(rlo | rhi)
end

# Int4x8

function Int4x8(a1::Int32, a2::Int32, a3::Int32, a4::Int32, a5::Int32, a6::Int32, a7::Int32, a8::Int32)
    return Int4x8(bitwise_merge(0xf0f0f0f0, Int8x4(a1, a3, a5, a7).val << 0x00, Int8x4(a2, a4, a6, a8).val << 0x04))
end

Base.convert(::Type{Int4x8}, a::NTuple{2,Int8x4}) = Int4x8(bitwise_merge(0x0f0f0f0f, a[2].val << 0x04, a[1].val))
function Base.convert(::Type{NTuple{2,Int8x4}}, a::Int4x8)
    a1 = a.val ⊻ 0x88888888            # a + 8
    a2_lo = a1 & 0x0f0f0f0f            # extract low part
    a3_lo = a2_lo + 0x78787878         # a + 128
    a4_lo = a3_lo ⊻ 0x80808080         # a
    a2_hi = (a1 >>> 0x04) & 0x0f0f0f0f # extract high part
    a3_hi = a2_hi + 0x78787878         # a + 128
    a4_hi = a3_hi ⊻ 0x80808080         # a
    return (Int8x4(a4_lo), Int8x4(a4_hi))::NTuple{2,Int8x4}
end
function Base.convert(::Type{NTuple{8,Int32}}, a::Int4x8)
    alo8, ahi8 = convert(NTuple{2,Int8x4}, a)
    alo32 = convert(NTuple{4,Int32}, alo8)
    ahi32 = convert(NTuple{4,Int32}, ahi8)
    return (alo32[1], ahi32[1], alo32[2], ahi32[2], alo32[3], ahi32[3], alo32[4], ahi32[4])
end

Base.show(io::IO, a::Int4x8) = print(io, convert(NTuple{8,Int32}, a))

Base.zero(::Type{Int4x8}) = Int4x8(Int32(0))

Base.:~(a::Int4x8) = Int4x8(~a.val)
Base.:&(a::Int4x8, b::Int4x8) = Int4x8(a.val & b.val)
Base.:|(a::Int4x8, b::Int4x8) = Int4x8(a.val | b.val)
Base.xor(a::Int4x8, b::Int4x8) = Int4x8(a.val ⊻ b.val)

function Base.:-(a::Int4x8)
    alo = a.val & 0x0f0f0f0f
    rlo = 0x80808080 - alo
    ahi = a.val & 0xf0f0f0f0
    rhi = 0x08080800 - ahi
    return Int4x8(bitwise_merge(0xf0f0f0f0, rlo, rhi))
end
function Base.:+(a::Int4x8, b::Int4x8)
    a1 = a.val ⊻ 0x88888888
    b1 = b.val ⊻ 0x88888888
    alo = a1 & 0x0f0f0f0f
    blo = b1 & 0x0f0f0f0f
    rlo = alo + blo
    ahi = a1 & 0xf0f0f0f0
    bhi = b1 & 0xf0f0f0f0
    rhi = ahi + bhi
    return Int4x8(bitwise_merge(0xf0f0f0f0, rlo, rhi))
end
function Base.:-(a::Int4x8, b::Int4x8)
    a1 = a.val ⊻ 0x88888888
    b1 = b.val ⊻ 0x88888888
    alo = (a1 & 0x0f0f0f0f) ⊻ 0x10101010
    blo = b1 & 0x0f0f0f0f
    rlo = alo - blo
    ahi = (a1 & 0xf0f0f0f0) ⊻ 0x01010100
    bhi = b1 & 0xf0f0f0f0
    rhi = ahi - bhi
    return Int4x8(bitwise_merge(0xf0f0f0f0, rlo, rhi))
end

# Int8x4

function Int8x4(a1::Int32, a2::Int32, a3::Int32, a4::Int32)
    return Int8x4(
        (a4 % UInt8 % UInt32) << 0x18 | (a3 % UInt8 % UInt32) << 0x10 | (a2 % UInt8 % UInt32) << 0x8 | (a1 % UInt8 % UInt32)
    )
end
CUDA.@device_override function Int8x4(a1::Int32, a2::Int32, a3::Int32, a4::Int32)
    return cvt_pack_s8(a2, a1, cvt_pack_s8(a4, a3))
end

function Base.convert(::Type{Int8x4}, a::NTuple{2,Int16x2})
    return Int8x4(
        (a[1].val >>> 0x00) % Int32, (a[1].val >>> 0x10) % Int32, (a[2].val >>> 0x00) % Int32, (a[2].val >>> 0x10) % Int32
    )
end
CUDA.@device_override function Base.convert(::Type{Int8x4}, a::NTuple{2,Int16x2})
    return Int8x4(cuda_prmt(a[1].val, a[2].val, 0x6240) % UInt32)
end

function Base.convert(::Type{NTuple{2,Int16x2}}, a::Int8x4)
    a1 = ((a.val >>> 0x00) & 0xff) % Int8 % Int32
    a2 = ((a.val >>> 0x08) & 0xff) % Int8 % Int32
    a3 = ((a.val >>> 0x10) & 0xff) % Int8 % Int32
    a4 = ((a.val >>> 0x18) & 0xff) % Int8 % Int32
    return (Int16x2(a1, a3), Int16x2(a2, a4))::NTuple{2,Int16x2}
end
CUDA.@device_override function Base.convert(::Type{NTuple{2,Int16x2}}, a::Int8x4)
    return (Int16x2(cuda_prmt(a.val, UInt32(0), 0xa280)), Int16x2(cuda_prmt(a.val, UInt32(0), 0xb391)))::NTuple{2,Int16x2}
end

function Base.convert(::Type{Int8x4}, a::NTuple{4,Int32})
    return Int8x4(a[1], a[2], a[3], a[4])
end
CUDA.@device_override function Base.convert(::Type{Int8x4}, a::NTuple{4,Int32})
    return cvt_pack_s8(a[2], a[1], cvt_pack_s8(a[4], a[3]))
end

function Base.convert(::Type{NTuple{4,Int32}}, a::Int8x4)
    return (
        (a.val >>> 0x00) % Int8 % Int32,
        (a.val >>> 0x08) % Int8 % Int32,
        (a.val >>> 0x10) % Int8 % Int32,
        (a.val >>> 0x18) % Int8 % Int32,
    )::NTuple{4,Int32}
end
CUDA.@device_override function Base.convert(::Type{NTuple{4,Int32}}, a::Int8x4)
    return (
        cuda_prmt(a.val, UInt32(0), 0x8880) % Int32,
        cuda_prmt(a.val, UInt32(0), 0x9991) % Int32,
        cuda_prmt(a.val, UInt32(0), 0xaaa2) % Int32,
        cuda_prmt(a.val, UInt32(0), 0xbbb3) % Int32,
    )::NTuple{4,Int32}
end

"""
    d = cvt_pack_s8(a::Int32, b::Int32, c::Int8x4)
    d::Int8x4
    d[1] = sat(b)
    d[2] = sat(a)
    d[3] = c[1]
    d[4] = c[2]
"""
function cvt_pack_s8(a::Int32, b::Int32, c::Int8x4)
    # I2IP.S8.S32.SAT
    return Int8x4(
        LLVM.Interop.@asmcall(
            "cvt.pack.sat.s8.s32.b32 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{Int32,Int32,UInt32}, a, b, c.val
        )
    )
end
"""
    d = cvt_pack_s8(a::Int32, b::Int32)
    d::Int8x4
    d[1] = sat(b)
    d[2] = sat(a)
    d[3] = 0
    d[4] = 0
"""
function cvt_pack_s8(a::Int32, b::Int32)
    # I2IP.S8.S32.SAT
    return Int8x4(LLVM.Interop.@asmcall("cvt.pack.sat.s8.s32.b32 \$0, \$1, \$2, 0;", "=r,r,r", UInt32, Tuple{Int32,Int32}, a, b))
end

export dp4a
"""
    d = dp4a(a::Int8x4, b::Int8x4, c::Int32)
    d::Int32
    d = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4] + c
"""
function dp4a(a::Int8x4, b::Int8x4, c::Int32)
    # IDP.4A.S8.S8
    return LLVM.Interop.@asmcall(
        "dp4a.s32.s32 \$0, \$1, \$2, \$3;", "=r,r,r,r", Int32, Tuple{UInt32,UInt32,Int32}, a.val, b.val, c
    )::Int32
end

Base.show(io::IO, a::Int8x4) = print(io, convert(NTuple{4,Int32}, a))

Base.zero(::Type{Int8x4}) = Int8x4(Int32(0))

Base.:~(a::Int8x4) = Int8x4(~a.val)
Base.:&(a::Int8x4, b::Int8x4) = Int8x4(a.val & b.val)
Base.:|(a::Int8x4, b::Int8x4) = Int8x4(a.val | b.val)
Base.xor(a::Int8x4, b::Int8x4) = Int8x4(a.val ⊻ b.val)

function Base.:-(a::Int8x4)
    alo = a.val & 0x00ff00ff
    rlo = 0x80008000 - alo
    ahi = a.val & 0xff00ff00
    rhi = 0x00800000 - ahi
    return Int8x4(bitwise_merge(0xff00ff00, rlo, rhi))
end
function Base.:+(a::Int8x4, b::Int8x4)
    a1 = a.val ⊻ 0x80808080
    b1 = b.val ⊻ 0x80808080
    alo = a1 & 0x00ff00ff
    blo = b1 & 0x00ff00ff
    rlo = alo + blo
    ahi = a1 & 0xff00ff00
    bhi = b1 & 0xff00ff00
    rhi = ahi + bhi
    return Int8x4(bitwise_merge(0xff00ff00, rlo, rhi))
end
function Base.:-(a::Int8x4, b::Int8x4)
    a1 = a.val ⊻ 0x80808080
    b1 = b.val ⊻ 0x80808080
    alo = (a1 & 0x00ff00ff) ⊻ 0x01000100
    blo = b1 & 0x00ff00ff
    rlo = alo - blo
    ahi = (a1 & 0xff00ff00) ⊻ 0x00010000
    bhi = b1 & 0xff00ff00
    rhi = ahi - bhi
    return Int8x4(bitwise_merge(0xff00ff00, rlo, rhi))
end

# Int16x2

function Int16x2(a1::Int32, a2::Int32)
    return Int16x2(((a1 % UInt32) & 0xffff) + ((a2 % UInt32) & 0xffff) << 0x10)
end
CUDA.@device_override function Int16x2(a1::Int32, a2::Int32)
    return cvt_pack_s16(a2, a1)
end

Base.convert(::Type{Int16x2}, a::NTuple{2,Int32}) = Int16x2(a[1], a[2])
function Base.convert(::Type{NTuple{2,Int32}}, a::Int16x2)
    return ((a.val >>> 0x00) % Int16 % Int32, (a.val >>> 0x10) % Int16 % Int32)::NTuple{2,Int32}
end

"""
    d = cvt_pack_s16(a::Int32, b::Int32)
    d::Int16x2
    d[1] = sat(b)
    d[2] = sat(a)
"""
function cvt_pack_s16(a::Int32, b::Int32)
    return Int16x2(LLVM.Interop.@asmcall("cvt.pack.sat.s16.s32 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{Int32,Int32}, a, b))
end

Base.show(io::IO, a::Int16x2) = print(io, convert(NTuple{2,Int32}, a))

Base.zero(::Type{Int16x2}) = Int16x2(Int32(0))

Base.:~(a::Int16x2) = Int16x2(~a.val)
Base.:&(a::Int16x2, b::Int16x2) = Int16x2(a.val & b.val)
Base.:|(a::Int16x2, b::Int16x2) = Int16x2(a.val | b.val)
Base.xor(a::Int16x2, b::Int16x2) = Int16x2(a.val ⊻ b.val)

function Base.:-(a::Int16x2)
    alo = a.val
    rlo = -alo
    ahi = a.val & 0xffff0000
    rhi = -ahi
    return Int16x2(bitwise_merge(0xffff0000, rlo, rhi))
end
function Base.:+(a::Int16x2, b::Int16x2)
    a1 = a.val ⊻ 0x80008000
    b1 = b.val ⊻ 0x80008000
    alo = a1
    blo = b1
    rlo = alo + blo
    ahi = a1 & 0xffff0000
    bhi = b1 & 0xffff0000
    rhi = ahi + bhi
    return Int16x2(bitwise_merge(0xffff0000, rlo, rhi))
end
function Base.:-(a::Int16x2, b::Int16x2)
    a1 = a.val ⊻ 0x80008000
    b1 = b.val ⊻ 0x80008000
    alo = a1
    blo = b1
    rlo = alo - blo
    ahi = a1 & 0xffff0000
    bhi = b1 & 0xffff0000
    rhi = ahi - bhi
    return Int16x2(bitwise_merge(0xffff0000, rlo, rhi))
end

# Int32
export add_sat
add_sat(x::Int32, y::Int32) = clamp(Int64(x) + Int64(y), Int32)
CUDA.@device_override function add_sat(x::Int32, y::Int32)
    LLVM.Interop.@asmcall("add.sat.s32 \$0, \$1, \$2;", "=r,r,r", Int32, Tuple{Int32,Int32}, x, y)
end

# Float16x2

function Float16x2(a1::Float32, a2::Float32)
    return Float16x2((reinterpret(UInt16, Float16(a1)) % UInt32) << 0x00 | (reinterpret(UInt16, Float16(a2)) % UInt32) << 0x10)
end
CUDA.@device_override function Float16x2(a1::Float32, a2::Float32)
    return Float16x2(LLVM.Interop.@asmcall("cvt.rn.f16x2.f32 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{Float32,Float32}, a2, a1))
end

function Base.convert(::Type{NTuple{2,Float32}}, a::Float16x2)
    return (Float32(reinterpret(Float16, (a.val >> 0x00) % UInt16)), Float32(reinterpret(Float16, (a.val >> 0x10) % UInt16)))
end
CUDA.@device_override function Base.convert(::Type{NTuple{2,Float32}}, a::Float16x2)
    return (
        LLVM.Interop.@asmcall("cvt.f32.f16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val),
        LLVM.Interop.@asmcall("cvt.f32.f16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val >> 0x10)
    )::NTuple{2,Float32}
end

Base.show(io::IO, a::Float16x2) = print(io, convert(NTuple{2,Float32}, a))

Base.zero(::Type{Float16x2}) = Float16x2(0.0f0, 0.0f0)

Base.:+(a::Float16x2) = a
Base.:-(a::Float16x2) = Float16x2(a.val ⊻ 0x80008000)
CUDA.@device_override function Base.:-(a::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("neg.rn.f16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
end
"""Negate a[1]"""
# negate1(a::Float16x2) = Float16x2(a.val ⊻ 0x00008000)
negate1(a::Float16x2) = a * Float16x2(-1.0f0, 1.0f0)
"""Negate a[2]"""
# negate2(a::Float16x2) = Float16x2(a.val ⊻ 0x80000000)
negate2(a::Float16x2) = a * Float16x2(1.0f0, -1.0f0)
Base.abs(a::Float16x2) = Float16x2(a.val & 0x7fff7fff)
CUDA.@device_override function Base.abs(a::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("abs.rn.f16x2 \$0, \$1;", "=r,r", UInt32, Tuple{UInt32}, a.val))
end

function Base.:+(a::Float16x2, b::Float16x2)
    alo, ahi = convert(NTuple{2,Float32}, a)
    blo, bhi = convert(NTuple{2,Float32}, b)
    return Float16x2(alo + blo, ahi + bhi)
end
CUDA.@device_override function Base.:+(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("add.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:-(a::Float16x2, b::Float16x2)
    alo, ahi = convert(NTuple{2,Float32}, a)
    blo, bhi = convert(NTuple{2,Float32}, b)
    return Float16x2(alo - blo, ahi - bhi)
end
CUDA.@device_override function Base.:-(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("sub.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.:*(a::Float16x2, b::Float16x2)
    alo, ahi = convert(NTuple{2,Float32}, a)
    blo, bhi = convert(NTuple{2,Float32}, b)
    return Float16x2(alo * blo, ahi * bhi)
end
CUDA.@device_override function Base.:*(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("mul.rn.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.muladd(a::Float16x2, b::Float16x2, c::Float16x2)
    alo, ahi = convert(NTuple{2,Float32}, a)
    blo, bhi = convert(NTuple{2,Float32}, b)
    clo, chi = convert(NTuple{2,Float32}, c)
    return Float16x2(muladd(alo, blo, clo), muladd(ahi, bhi, chi))
end
CUDA.@device_override function Base.muladd(a::Float16x2, b::Float16x2, c::Float16x2)
    return Float16x2(
        LLVM.Interop.@asmcall(
            "fma.rn.f16x2 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{UInt32,UInt32,UInt32}, a.val, b.val, c.val
        )
    )
end
export muladd_sat
function muladd_sat(a::Float16x2, b::Float16x2, c::Float16x2)
    return Float16x2(
        LLVM.Interop.@asmcall(
            "fma.rn.sat.f16x2 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{UInt32,UInt32,UInt32}, a.val, b.val, c.val
        )
    )
end
function Base.max(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("max.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end
function Base.min(a::Float16x2, b::Float16x2)
    return Float16x2(LLVM.Interop.@asmcall("min.f16x2 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{UInt32,UInt32}, a.val, b.val))
end

#  BFloat16x2

function BFloat16x2(a::Float32, b::Float32)
    return BFloat16x2(LLVM.Interop.@asmcall("cvt.rn.bf16x2.f32 \$0, \$1, \$2;", "=r,r,r", UInt32, Tuple{Float32,Float32}, a, b))
end
function Base.convert(::Type{NTuple{2,Float32}}, a::BFloat16x2)
    return (
        LLVM.Interop.@asmcall("cvt.f32.bf16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val),
        LLVM.Interop.@asmcall("cvt.f32.bf16 \$0, \$1;", "=r,r", Float32, Tuple{UInt32}, a.val >> 0x10)
    )::NTuple{2,Float32}
end
Base.show(io::IO, a::BFloat16x2) = print(io, convert(NTuple{2,Float32}, a))
Base.zero(::Type{BFloat16x2}) = BFloat16x2(0.0f0, 0.0f0)
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
    return BFloat16x2(
        LLVM.Interop.@asmcall(
            "fma.rn.bf16x2 \$0, \$1, \$2, \$3;", "=r,r,r,r", UInt32, Tuple{UInt32,UInt32,UInt32}, a.val, b.val, c.val
        )
    )
end

################################################################################

const Code = Union{Expr,Number,Symbol}

export comment
comment(text, result) = result

function make_uint(i::Integer)
    @assert i ≥ 0
    i ≤ typemax(UInt8) && return UInt8(i)
    i ≤ typemax(UInt16) && return UInt16(i)
    i ≤ typemax(UInt32) && return UInt32(i)
    i ≤ typemax(UInt64) && return UInt64(i)
    @assert false
end

const Int_UInt_8_16_32 = Union{Int8,Int16,Int32,UInt8,UInt16,UInt32}

export cuda_prmt
function cuda_prmt(x::UInt32, y::UInt32, op::UInt32)
    LLVM.Interop.@asmcall("prmt.b32 \$0, \$1, \$2, \$3;", "=r,r,r,i", UInt32, Tuple{UInt32,UInt32,UInt32}, x, y, op)
end

function cuda_prmt(x::T, y::T, op::Int_UInt_8_16_32) where {T<:Int_UInt_8_16_32}
    return T(cuda_prmt(x % UInt32, y % UInt32, op % UInt32)::UInt32)
end

function cuda_prmt(x::Code, y::Code, op::Int_UInt_8_16_32)
    return :(LLVM.Interop.@asmcall(
        "prmt.b32 \$0, \$1, \$2, \$3;", "=r,r,r,i", UInt32, Tuple{UInt32,UInt32,UInt32}, $x % UInt32, $y % UInt32, $(op % UInt32)
    ))
end

export cuda_lop3
function cuda_lop3(x::UInt32, y::UInt32, z::UInt32, op::UInt32)
    LLVM.Interop.@asmcall(
        "lop3.b32 \$0, \$1, \$2, \$3, \$4;", "=r,r,r,r,i", UInt32, Tuple{UInt32,UInt32,UInt32,UInt32}, x, y, z, op
    )
end

function cuda_lop3(x::Int_UInt_8_16_32, y::Int_UInt_8_16_32, z::Int_UInt_8_16_32, op::Int_UInt_8_16_32)
    return cuda_lop3(x % UInt32, y % UInt32, z % UInt32, op % UInt32)::UInt32
end

function cuda_lop3(x::Code, y::Code, z::Code, op::Int_UInt_8_16_32)
    return :(LLVM.Interop.@asmcall(
        "lop3.b32 \$0, \$1, \$2, \$3, \$4;",
        "=r,r,r,r,i",
        UInt32,
        Tuple{UInt32,UInt32,UInt32,UInt32},
        $x % UInt32,
        $y % UInt32,
        $z % UInt32,
        $(op % UInt32)
    ))
end

"""
    r = a & mask | b & ~mask

See <https://forums.developer.nvidia.com/t/reverse-lut-for-lop3-lut/110651>:
    0x01: ~a & ~b & ~c
    0x02: ~a & ~b &  c
    0x04: ~a &  b & ~c
    0x08: ~a &  b &  c
    0x10:  a & ~b & ~c
    0x20:  a & ~b &  c
    0x40:  a &  b & ~c
    0x80:  a &  b &  c

See <https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#logic-and-shift-instructions-lop3>:
    ta = 0xf0
    tb = 0xcc
    tc = 0xaa

    (a & c) | (b & ~c)
    (ta & tc) | (tb & ~tc) = 0xe4
"""
function bitwise_merge end
bitwise_merge(mask::UInt32, iffalse::UInt32, iftrue::UInt32) = (~mask & iffalse) | (mask & iftrue)
bitwise_merge(mask::UInt32, iffalse::Int32, iftrue::Int32) = bitwise_merge(mask, iffalse % UInt32, iftrue % UInt32) % Int32
CUDA.@device_override bitwise_merge(mask::UInt32, iffalse::UInt32, iftrue::UInt32) = cuda_lop3(iftrue, iffalse, mask, 0xe4)::UInt32
CUDA.@device_override bitwise_merge(mask::UInt32, iffalse::Int32, iftrue::Int32) = cuda_lop3(iftrue, iffalse, mask, 0xe4) % Int32
export bitwise_merge

bitwise_merge(mask::Code, iffalse::Code, iftrue::Code) = :(cuda_lop3($iftrue, $iffalse, $mask, 0xe4)::UInt32)

export unsafe_load4_global
# Address space 1 is global, 3 is shared
function unsafe_load4_global(ptr::Core.LLVMPtr{Int32,1})
    return Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(1)* %0 to [4 x i32] addrspace(1)*
           %val = load [4 x i32], [4 x i32] addrspace(1)* %ptr, align 16
           ret [4 x i32] %val
        """,
        NTuple{4,Int32},
        Tuple{Core.LLVMPtr{Int32,1}},
        ptr,
    )
end
function unsafe_load4_global(ptr::Core.LLVMPtr{Int32,3})
    return Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(3)* %0 to [4 x i32] addrspace(3)*
           %val = load [4 x i32], [4 x i32] addrspace(3)* %ptr, align 16
           ret [4 x i32] %val
        """,
        NTuple{4,Int32},
        Tuple{Core.LLVMPtr{Int32,3}},
        ptr,
    )
end
unsafe_load4_global(arr::CuDeviceArray{Int32}, idx::Integer) = unsafe_load4_global(pointer(arr, idx))
function unsafe_load4_global(arr::CuDeviceArray{T}, idx::Integer) where {T}
    @assert sizeof(T) == sizeof(Int32)
    res = unsafe_load4_global(reinterpret(Int32, arr), idx)::NTuple{4,Int32}
    # return ntuple(n -> reinterpret(T, res[n]), 4)::NTuple{4,T}
    return ntuple(n -> T(res[n] % UInt32), 4)::NTuple{4,T}
end

export unsafe_store4_global!
# Address space 1 is global, 3 is shared
function unsafe_store4_global!(ptr::Core.LLVMPtr{Int32,1}, val::NTuple{4,Int32})
    return Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(1)* %0 to [4 x i32] addrspace(1)*
           store [4 x i32] %1, [4 x i32] addrspace(1)* %ptr, align 16
           ret void
        """,
        Nothing,
        Tuple{Core.LLVMPtr{Int32,1},NTuple{4,Int32}},
        ptr,
        val,
    )
end
function unsafe_store4_global!(ptr::Core.LLVMPtr{Int32,3}, val::NTuple{4,Int32})
    return Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(3)* %0 to [4 x i32] addrspace(3)*
           store [4 x i32] %1, [4 x i32] addrspace(3)* %ptr, align 16
           ret void
        """,
        Nothing,
        Tuple{Core.LLVMPtr{Int32,3},NTuple{4,Int32}},
        ptr,
        val,
    )
end
function unsafe_store4_global!(arr::CuDeviceArray{Int32}, idx::Integer, val::NTuple{4,Int32})
    return unsafe_store4_global!(pointer(arr, idx), val)
end
function unsafe_store4_global!(arr::CuDeviceArray{T}, idx::Integer, val::NTuple{4,T}) where {T}
    @assert sizeof(T) == sizeof(Int32)
    val′ = ntuple(n -> val[n].val % Int32, 4)::NTuple{4,Int32}
    return unsafe_store4_global!(reinterpret(Int32, arr), idx, val′)
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

Base.show(io::IO, i::Index) = print(io, tag(i), "(", bit(i), ")")

export Target
struct Target{Tag}
    bit::Int
end
function Base.isless(i1::Target{T1}, i2::Target{T2}) where {T1,T2}
    T1 < T2 && return true
    T1 > T2 && return false
    return i1.bit < i2.bit
end

tag(::Target{Tag}) where {Tag} = Tag
bit(i::Target) = i.bit

Base.show(io::IO, i::Target) = print(io, tag(i), "(", bit(i), ")")

export Ignore, SIMD, Register, Thread, Warp, Block, Loop1, Loop2, Loop3, Loop4, Loop5
const Ignore = Target{:Ignore}
const SIMD = Target{:SIMD}
const Register = Target{:Register}
const Thread = Target{:Thread}
const Warp = Target{:Warp}
const Block = Target{:Block}
const Loop1 = Target{:Loop1}
const Loop2 = Target{:Loop2}
const Loop3 = Target{:Loop3}
const Loop4 = Target{:Loop4}
const Loop5 = Target{:Loop5}

export Memory, Memory2, Memory3
const Memory = Target{:Memory}
const Memory2 = Target{:Memory2}
const Memory3 = Target{:Memory3}

export Mapping
struct Mapping{Key,Value}
    type::Union{Type{Float32},Type{Int32}}
    mapping::Dict{Key,Value}
    function Mapping{Key,Value}(type::Type, mapping::Dict) where {Key,Value}
        # Ensure mapping is injective
        @assert length(Set(values(mapping))) == length(mapping)
        return new{Key,Value}(type, mapping)
    end
end
Base.:(==)(f::Mapping, g::Mapping) = f.type ≡ g.type && f.mapping == g.mapping
Base.copy(f::Mapping{Key,Value}) where {Key,Value} = Mapping{Key,Value}(f.type, copy(f.mapping))
Base.delete!(f::Mapping{Key}, i::Key) where {Key} = delete!(f.mapping, i)
Base.getindex(f::Mapping{Key}, i::Key) where {Key} = f.mapping[i]
Base.iterate(f::Mapping, state...) = iterate(f.mapping, state...)
Base.keys(f::Mapping) = keys(f.mapping)
Base.length(f::Mapping) = length(f.mapping)
Base.setindex!(f::Mapping{Key,Value}, value::Value, i::Key) where {Key,Value} = (f.mapping[i] = value)
Base.values(f::Mapping) = values(f.mapping)

function Base.show(io::IO, f::Mapping)
    println(io, "    type: $(f.type)")
    for (k, v) in sort!(OrderedDict(f))
        println(io, "    $k => $v")
    end
end

Base.inv(f::Mapping{A,B}) where {A,B} = Mapping{B,A}(f.type, Dict(v => k for (k, v) in f.mapping))
function Base.:(∘)(g::Mapping{B,C}, f::Mapping{A,B}) where {A,B,C}
    @assert g.type ≡ f.type
    return Mapping{A,C}(f.type, Dict(k => g[v] for (k, v) in f.mapping))
end

export Layout, InvLayout
const Layout = Mapping{Index,Target}
const InvLayout = Mapping{Target,Index}

function get_type(f::Mapping{Index,Target})
    simds = [v for (k, v) in f if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    if f.type ≡ Float32
        simd_mask == 0b00000 && return Float32
        simd_mask == 0b10000 && return Float16x2
        @assert false
    elseif f.type ≡ Int32
        simd_mask == 0b00000 && return Int32
        simd_mask == 0b10000 && return Int16x2
        simd_mask == 0b11000 && return Int8x4
        simd_mask == 0b11100 && return Int4x8
        @assert false
    else
        @assert false
    end
end
function unget_type(T::Type)
    T ∈ (Float32, Float16x2) && return Float32
    T ∈ (Int32, Int16x2, Int8x4, Int4x8) && return Int32
    @assert false
end
retype(type::Type, f::Mapping{A,B}) where {A,B} = Mapping{A,B}(type, f.mapping)

################################################################################

export Environment
const Variable = Pair{Symbol,Layout}
const Environment = Dict{Symbol,Layout}

export showvar
showvar(var::Variable) = showvar(stdout, var)
function showvar(io::IO, var::Variable)
    println(io, "$(var[1]):")
    print(io, var[2])
    return nothing
end
Base.show(io::IO, var::Variable) = showvar(io, var)
export showenv
showenv(env::Environment) = showenv(stdout, env)
function showenv(io::IO, env::Environment)
    println(io, "Variables: [$(join(sort!([var[1] for var in env]), ", "))]")
    for var in sort!(OrderedDict(env))
        println(io, "    $(var[1]):")
        for (k, v) in sort!(OrderedDict(var[2]))
            println(io, "        $k => $v")
        end
    end
    return nothing
end
Base.show(io::IO, env::Environment) = showenv(io, env)

################################################################################

# Remove line numbers. Line numbers are usually wrong because they
# point to this file, instead of the file where the code originates.
# See
# <https://discourse.julialang.org/t/code-generation-unnecessary-comment-lines-when-using-quote/398/2>
clean_code(expr) = expr
function clean_code(expr::Expr)
    head, args = expr.head, expr.args
    # Remove line number nodes
    if head ≢ :macrocall
        args = filter(arg -> !(arg isa LineNumberNode), args)
    end
    if head ≡ :block && length(args) == 1
        # Remove blocks with only one element
        return clean_code(args[1])
    end
    # Recursive calls
    args = map(clean_code, args)
    return Expr(head, args...)
end
export clean_code

export AbstractStep, invars, outvars, declarations, code
abstract type AbstractStep end
description(::AbstractStep) = error("undefined")
invars(::AbstractStep) = error("undefined")
outvars(::AbstractStep) = error("undefined")
unusedsymbols(::AbstractStep) = error("undefined")
declarations(::AbstractStep) = error("undefined")
code(::AbstractStep) = error("undefined")

function Base.show(io::IO, step::AbstractStep)
    println(io, "# $(description(step))")
    println(io, "#     Inputs: [$(join(sort!([var[1] for var in invars(step)]), ", "))]")
    for var in sort(invars(step); by=v -> v[1])
        println(io, "#         $(var[1])::$(var[2].type)")
        for (k, v) in sort!(OrderedDict(var[2]))
            println(io, "#             $k => $v")
        end
    end
    println(io, "#     Outputs: [$(join(sort!([var[1] for var in outvars(step)]), ", "))]")
    for var in sort(outvars(step); by=v -> v[1])
        println(io, "#         $(var[1])::$(var[2].type)")
        for (k, v) in sort!(OrderedDict(var[2]))
            println(io, "#             $k => $v")
        end
    end
    println(io, "#     Unused: [$(join(sort!(collect(unusedsymbols(step))), ", "))]")
    # println(io, code(step))
    println(io, clean_code(declarations(step)))
    println(io, clean_code(code(step)))
    return nothing
end

export Step
struct Step <: AbstractStep
    description::String
    invars::Vector{Variable}
    outvars::Vector{Variable}
    declarations::Code
    code::Code
end
# For backward compatibility
function Step(description::String, invars::Vector{Variable}, outvars::Vector{Variable}, code::Code)
    return Step(
        description,
        invars,
        outvars,
        quote end,
        code,
    )
end
description(step::Step) = step.description
invars(step::Step) = step.invars
outvars(step::Step) = step.outvars
unusedsymbols(step::Step) = Set(v[1] for v in step.outvars)
declarations(step::Step) = step.declarations
code(step::Step) = step.code

export Seq
struct Seq <: AbstractStep
    description::String
    invars::Vector{Variable}
    outvars::Vector{Variable}
    unusedsymbols::Set{Symbol}
    steps::Vector{AbstractStep}

    function Seq(steps::Vector{<:AbstractStep})
        description′ = "{ " * join(description.(steps), "; ") * " }"
        invars′ = Variable[]
        outvars′ = Variable[]
        all_invars = Environment()
        all_outvars = Environment()
        unusedsymbols′ = Set{Symbol}()
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
                        if !(invar[2] == all_outvars[invar[1]])
                            @show typeof(invar) invar
                            @show typeof(all_outvars) all_outvars
                        end
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
            @assert isdisjoint(this_step_insymbols, this_step_outsymbols)
            setdiff!(unusedsymbols′, this_step_insymbols)
            union!(unusedsymbols′, unusedsymbols(step))
        end
        return new(description′, invars′, outvars′, unusedsymbols′, steps)
    end
end
description(seq::Seq) = seq.description
invars(seq::Seq) = seq.invars
outvars(seq::Seq) = seq.outvars
unusedsymbols(seq::Seq) = seq.unusedsymbols
function declarations(seq::Seq)
    quote
        $(declarations.(seq.steps)...)
    end
end
function code(seq::Seq)
    quote
        $(code.(seq.steps)...)
    end
end

Base.:|>(step1::AbstractStep, step2::AbstractStep) = Seq([step1, step2])

export Nested
struct Nested <: AbstractStep
    description::String
    var::Symbol
    range::Expr
    body::AbstractStep
    unroll::Bool
    function Nested(description::String, var::Symbol, range::Expr, body::AbstractStep; unroll::Bool=false)
        return new(description, var, range, body, unroll)
    end
end
description(nested::Nested) = nested.description
invars(nested::Nested) = invars(nested.body)
outvars(nested::Nested) = outvars(nested.body)
unusedsymbols(nested::Nested) = unusedsymbols(nested.body)
declarations(nested::Nested) = declarations(nested.body)
function code(nested::Nested)
    if nested.unroll
        range = eval(nested.range)
        stmts = [
            quote
                $(nested.var) = $value
                $(code(nested.body))
            end for value in range
        ]
        quote
            $(stmts...)
        end
    else
        quote
            for $(nested.var) in $(nested.range)
                $(code(nested.body))
            end
        end
    end
end

################################################################################

export loop!
function loop!(
    makebody, steps::Vector{AbstractStep}, env::Environment, loopVar::Symbol, loopRange::Code, loopIndices::AbstractArray{<:Index}
)
    loop_steps = AbstractStep[]
    makebody(loop_steps, env)
    push!(steps, Nested("loop", loopVar, loopRange, Seq(loop_steps)))
    return nothing
end

export unrolled_loop!
function unrolled_loop!(
    makebody, steps::Vector{AbstractStep}, env::Environment, loopVar::Symbol, loopRange::Code, loopIndices::AbstractArray{<:Index}
)
    loop_steps = AbstractStep[]
    makebody(loop_steps, env)
    push!(steps, Nested("unrolled loop", loopVar, loopRange, Seq(loop_steps); unroll=true))
    return nothing
end

################################################################################

export sync_threads!
function sync_threads!(steps::Vector{AbstractStep}, env::Environment)
    push!(steps, Step(
        "sync_threads",
        Variable[],
        Variable[],
        quote
            sync_threads()
        end,
    ))
    return nothing
end

################################################################################

function assemble_int4(x0::Code, x1::Code, x2::Code, x3::Code, x4::Code, x5::Code, x6::Code, x7::Code)
    return :(
        (
            ($x0 % Int8) & 0x0000000f |
            (($x1 % Int8) << 0x04) & 0x000000f0 |
            (($x2 % Int8) << 0x08) & 0x00000f00 |
            (($x3 % Int8) << 0x0c) & 0x0000f000 |
            (($x4 % Int8) << 0x10) & 0x000f0000 |
            (($x5 % Int8) << 0x14) & 0x00f00000 |
            (($x6 % Int8) << 0x18) & 0x0f000000 |
            (($x7 % Int8) << 0x1c) & 0xf0000000
        ) % Int32
    )
end

function assemble_int8(x0::Code, x1::Code, x2::Code, x3::Code)
    return :(
        (
            ($x0 % Int8) & 0x000000ff |
            (($x1 % Int8) << 0x08) & 0x0000ff00 |
            (($x2 % Int8) << 0x10) & 0x00ff0000 |
            (($x3 % Int8) << 0x18) & 0xff000000
        ) % Int32
    )
end

function assemble_int16(x0::Code, x1::Code)
    return :((($x0 % Int16) & 0x0000ffff | (($x1 % Int16) << 0x10) & 0xffff0000) % Int32)
end

export constant!
function constant!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, lhsmap::Layout, value::Code)
    @assert lhs ∉ keys(env)
    type = get_type(lhsmap)
    env[lhs] = lhsmap

    registers = [v for (k, v) in lhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in lhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            lhsname = Symbol(lhs, rname)
            if simd_bits == 0
                push!(stmts, :($lhsname = $value::$type))
            elseif simd_bits == 1
                @assert lhsmap.type ≡ Int32
                push!(stmts, :($lhsname = Int16x2($(assemble_int16(value, value)) % UInt32)))
                # if lhsmap.type ≡ Float32
                #     push!(stmts, :($lhsname = Float16x2($value, $value)))
                # elseif lhsmap.type ≡ Int32
                #     push!(stmts, :($lhsname = Int16x2($value, $value)))
                # else
                #     @assert false
                # end
            elseif simd_bits == 2
                @assert lhsmap.type ≡ Int32
                push!(stmts, :($lhsname = Int8x4($(assemble_int8(value, value, value, value)) % UInt32)))
                # push!(stmts, :($lhsname = Int8x4($value, $value, $value, $value)))
            elseif simd_bits == 3
                @assert lhsmap.type ≡ Int32
                push!(
                    stmts, :($lhsname = Int4x8($(assemble_int4(value, value, value, value, value, value, value, value)) % UInt32))
                )
                # push!(stmts, :($lhsname = Int4x8($value, $value, $value, $value, $value, $value, $value, $value)))
            else
                @assert false
            end
        end
    end

    push!(steps, Step(
        "Set to constant",
        Variable[],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export assign!
function assign!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    lhsmap = rhsmap
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            lhsname = Symbol(lhs, rname)
            push!(stmts, :($lhsname = $(Symbol(rhs, rname))))
        end
    end

    push!(steps, return Step(
        "Assign to variable",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export select!

function select!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, index::Index, value::Code)
    return select!(steps, env, lhs, rhs, env[rhs][index], value)
end
function select!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, register::Register, value::Code)
    rhsmap = env[rhs]

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    register_index = inv(lhsmap)[register]
    delete!(lhsmap, register_index)
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    @assert (1 << register.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << register.bit) == 0
                r0 = r
                r1 = r | (1 << register.bit)
                rname0 = register_mask == 0 ? "" : "_$r0"
                rname1 = register_mask == 0 ? "" : "_$r1"

                lhsr = r & ~(1 << register.bit)
                lhsrname = register_mask & ~(1 << register.bit) == 0 ? "" : "_$lhsr"
                push!(stmts, :($(Symbol(lhs, lhsrname)) = !$value ? $(Symbol(rhs, rname0)) : $(Symbol(rhs, rname1))))
            end
        end
    end

    push!(steps, Step(
        "Select variable",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

function select!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, indices::AbstractVector{Index}, value::Code
)
    return select!(steps, env, lhs, rhs, [env[rhs][index] for index in indices], value)
end
function select!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, registers::AbstractVector{Register}, value::Code
)
    rhsmap = env[rhs]

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    register_indices = [inv(lhsmap)[register] for register in registers]
    for register_index in register_indices
        delete!(lhsmap, register_index)
    end
    env[lhs] = lhsmap

    all_registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in all_registers])

    @assert all((1 << register.bit) & register_mask ≠ 0 for register in registers)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            i = sum((r & 1 << register.bit ≠ 0) << (i - 1) for (i, register) in enumerate(registers))
            rname = register_mask == 0 ? "" : "_$r"
            lhsr = r & ~sum(1 << register.bit for register in registers)
            lhsrname = register_mask & ~sum(1 << register.bit for register in registers) == 0 ? "" : "_$lhsr"
            push!(
                stmts,
                quote
                    if $value == $i
                        $(Symbol(lhs, lhsrname)) = $(Symbol(rhs, rname))
                    end
                end,
            )
        end
    end

    push!(steps, Step(
        "Select variable",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export unselect!

function unselect_BROKEN!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, index_register::Pair{<:Index,Register}, value::Code
)
    rhsmap = env[rhs]

    register_index, register = index_register
    @assert register_index ∉ rhsmap
    @assert register_index ∉ inv(rhsmap)

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    lhsmap[register_index] = register
    env[lhs] = lhsmap

    registers = [v for (k, v) in lhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    @assert (1 << register.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << register.bit) == 0
                rname = register_mask & ~(1 << register.bit) == 0 ? "" : "_$r"

                lhsr0 = r
                lhsr1 = r | (1 << register.bit)
                lhsrname0 = register_mask == 0 ? "" : "_$lhsr0"
                lhsrname1 = register_mask == 0 ? "" : "_$lhsr1"
                push!(
                    stmts,
                    quote
                        if !$value
                            $(Symbol(lhs, lhsrname0)) = $(Symbol(rhs, rname))
                        else
                            $(Symbol(lhs, lhsrname1)) = $(Symbol(rhs, rname))
                        end
                    end,
                )
            end
        end
    end

    push!(steps, Step(
        "Unselect variable",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

function unselect!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    index_registers::AbstractArray{<:Pair{<:Index,Register}},
    value::Code,
)
    rhsmap = env[rhs]

    for (register_index, register) in index_registers
        @assert register_index ∉ rhsmap
        @assert register_index ∉ inv(rhsmap)
    end

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    for (register_index, register) in index_registers
        lhsmap[register_index] = register
    end
    env[lhs] = lhsmap

    all_registers = [v for (k, v) in lhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in all_registers])

    @assert all((1 << register.bit) & register_mask ≠ 0 for (register_index, register) in index_registers)

    decls = Code[]
    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            i = sum((r & 1 << register.bit ≠ 0) << (i - 1) for (i, (index_register, register)) in enumerate(index_registers))
            rname = register_mask & ~sum(1 << register.bit for (index_register, register) in index_registers) == 0 ? "" : "_$r"

            lhsr = r
            lhsrname = register_mask == 0 ? "" : "_$lhsr"
            lhstype = get_type(lhsmap)
            push!(
                decls,
                quote
                    $(Symbol(lhs, lhsrname)) = zero($lhstype)
                end,
            )
            push!(
                stmts,
                quote
                    if $value == $i
                        $(Symbol(lhs, lhsrname)) = $(Symbol(rhs, rname))
                    end
                end,
            )
        end
    end

    push!(steps, Step(
        "Unselect variable",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(decls...)
        end,
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export split!
function split!(steps::Vector{AbstractStep}, env::Environment, lhs0::Symbol, lhs1::Symbol, rhs::Symbol, index::Index)
    return split!(steps, env, lhs0, lhs1, rhs, env[rhs][index])
end
function split!(steps::Vector{AbstractStep}, env::Environment, lhs0::Symbol, lhs1::Symbol, rhs::Symbol, register::Register)
    rhsmap = env[rhs]

    @assert lhs0 ∉ keys(env)
    @assert lhs1 ∉ keys(env)
    lhsmap = copy(rhsmap)
    register_index = inv(lhsmap)[register]
    delete!(lhsmap, register_index)
    env[lhs0] = lhsmap
    env[lhs1] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    @assert (1 << register.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"

            lhs = (r & 1 << register.bit) == 0 ? lhs0 : lhs1
            lhsr = r & ~(1 << register.bit)
            lhsrname = register_mask & ~(1 << register.bit) == 0 ? "" : "_$lhsr"
            push!(stmts, :($(Symbol(lhs, lhsrname)) = $(Symbol(rhs, rname))))
        end
    end

    push!(steps, Step(
        "Split variable",
        Variable[rhs => rhsmap],
        Variable[lhs0 => lhsmap, lhs1 => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

function Base.merge!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs0::Symbol, rhs1::Symbol, indexmap::Pair{<:Index,Register}
)
    rhsmap = env[rhs0]
    @assert env[rhs1] == rhsmap

    @assert lhs ∉ keys(env)
    rhsreg = indexmap[2]::Register
    lhsmap = copy(rhsmap)
    @assert indexmap[1] ∉ keys(lhsmap)
    @assert indexmap[2] ∉ values(lhsmap)
    lhsmap[indexmap[1]] = indexmap[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in lhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    @assert (1 << rhsreg.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"

            rhs = (r & 1 << rhsreg.bit) == 0 ? rhs0 : rhs1
            rhsr = r & ~(1 << rhsreg.bit)
            rhsrname = register_mask & ~(1 << rhsreg.bit) == 0 ? "" : "_$rhsr"
            push!(stmts, :($(Symbol(lhs, rname)) = $(Symbol(rhs, rhsrname))))
        end
    end

    push!(steps, Step(
        "Join variables",
        Variable[rhs0 => rhsmap, rhs1 => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export reduce!
function reduce!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, fun::Function)
    rhsmap = env[rhs]
    @assert lhs ∈ keys(env)
    lhsmap = rhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    # @assert isempty(simds)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            lhsname = Symbol(lhs, rname)
            rhsname = Symbol(rhs, rname)
            push!(stmts, fun(lhsname, rhsname)::Code)
        end
    end

    push!(steps, Step(
        "Apply function",
        Variable[lhs => lhsmap, rhs => rhsmap],
        Variable[],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export apply!
function apply!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    fun::Function;
    newtype::Union{Nothing,Type}=nothing,
    operator::Symbol=:(=),
)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    type = something(newtype, get_type(rhsmap))
    lhsmap = retype(unget_type(type), rhsmap)
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    # @assert isempty(simds)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            lhsname = Symbol(lhs, rname)
            if operator === :(=)
                push!(stmts, :($lhsname = $(fun(Symbol(rhs, rname))::Code)::$type))
            elseif operator === :(+=)
                push!(stmts, :($lhsname += $(fun(Symbol(rhs, rname))::Code)::$type))
            else
                @assert false
            end
        end
    end

    push!(steps, Step(
        "Apply function",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

function apply!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs1::Symbol,
    rhs2::Symbol,
    fun::Function;
    newtype::Union{Nothing,Type}=nothing,
)
    rhsmap = env[rhs1]
    # The other rhsmaps must be subsets of the first one
    @assert all(rhsmap[k] == v for (k, v) in env[rhs2] if k in keys(rhsmap))
    @assert lhs ∉ keys(env)
    type = something(newtype, get_type(rhsmap))
    lhsmap = retype(type, rhsmap)
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    registers2 = [v for (k, v) in env[rhs2] if v isa Register]
    register_mask2 = sum(UInt[1 << reg.bit for reg in registers2])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    @assert register_mask2 & ~register_mask == 0
    @assert isempty(simds)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            rname2 = register_mask2 == 0 ? "" : "_$(r & register_mask2)"
            lhsname = Symbol(lhs, rname)
            push!(stmts, :($lhsname = $(fun(Symbol(rhs1, rname), Symbol(rhs2, rname2))::Code)::$(lhsmap.type)))
        end
    end

    push!(steps, Step(
        "Apply function",
        Variable[rhs1 => rhsmap, rhs2 => env[rhs2]],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

function apply!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs1::Symbol,
    rhs2::Symbol,
    rhs3::Symbol,
    rhs4::Symbol,
    fun::Function;
    newtype::Union{Nothing,Type}=nothing,
)
    rhsmap = env[rhs1]
    # The other rhsmaps must be subsets of the first one
    @assert all(rhsmap[k] == v for (k, v) in env[rhs2] if k in keys(rhsmap))
    @assert all(rhsmap[k] == v for (k, v) in env[rhs3] if k in keys(rhsmap))
    @assert all(rhsmap[k] == v for (k, v) in env[rhs4] if k in keys(rhsmap))
    @assert lhs ∉ keys(env)
    type = something(newtype, get_type(rhsmap))
    lhsmap = retype(type, rhsmap)
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    registers2 = [v for (k, v) in env[rhs2] if v isa Register]
    register_mask2 = sum(UInt[1 << reg.bit for reg in registers2])
    registers3 = [v for (k, v) in env[rhs3] if v isa Register]
    register_mask3 = sum(UInt[1 << reg.bit for reg in registers3])
    registers4 = [v for (k, v) in env[rhs4] if v isa Register]
    register_mask4 = sum(UInt[1 << reg.bit for reg in registers4])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    @assert register_mask2 & ~register_mask == 0
    @assert register_mask3 & ~register_mask == 0
    @assert register_mask4 & ~register_mask == 0
    @assert isempty(simds)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            rname2 = register_mask2 == 0 ? "" : "_$(r & register_mask2)"
            rname3 = register_mask3 == 0 ? "" : "_$(r & register_mask3)"
            rname4 = register_mask4 == 0 ? "" : "_$(r & register_mask4)"
            lhsname = Symbol(lhs, rname)
            push!(
                stmts,
                :(
                    $lhsname = $(
                        fun(Symbol(rhs1, rname), Symbol(rhs2, rname2), Symbol(rhs3, rname3), Symbol(rhs4, rname4))::Code
                    )::$(lhsmap.type)
                ),
            )
        end
    end

    push!(
        steps,
        Step(
            "Apply function",
            Variable[rhs1 => rhsmap, rhs2 => env[rhs2], rhs3 => env[rhs3], rhs4 => env[rhs4]],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

################################################################################

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
            # TODO: Check whether this correction led to inefficient array indexing
            # if mask ≠ code_mask
            expr = :($expr & $mask)
            # end
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

function make_indices(
    idxmap::Layout, memmap::Layout; ignore::Set{<:Index}=Set{Index}(), memory::Type{MemoryN}=Memory, offset::Code=Int32(0)
) where {MemoryN}
    loops1 = [v for (k, v) in idxmap if v isa Loop1]
    loop1_mask = sum(UInt[1 << lp.bit for lp in loops1])
    loops2 = [v for (k, v) in idxmap if v isa Loop2]
    loop2_mask = sum(UInt[1 << lp.bit for lp in loops2])
    loops3 = [v for (k, v) in idxmap if v isa Loop3]
    loop3_mask = sum(UInt[1 << lp.bit for lp in loops3])
    loops4 = [v for (k, v) in idxmap if v isa Loop4]
    loop4_mask = sum(UInt[1 << lp.bit for lp in loops4])
    loops5 = [v for (k, v) in idxmap if v isa Loop5]
    loop5_mask = sum(UInt[1 << lp.bit for lp in loops5])
    blocks = [v for (k, v) in idxmap if v isa Block]
    block_mask = sum(UInt[1 << bl.bit for bl in blocks])
    warps = [v for (k, v) in idxmap if v isa Warp]
    warp_mask = sum(UInt[1 << wr.bit for wr in warps])
    threads = [v for (k, v) in idxmap if v isa Thread]
    thread_mask = sum(UInt[1 << thr.bit for thr in threads])
    registers = [v for (k, v) in idxmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in idxmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])

    mem_simds = [v for (k, v) in memmap if v isa SIMD]
    mem_simd_mask = sum(UInt[1 << simd.bit for simd in mem_simds])

    all_simd_bits_equal = Dict(k => v for (k, v) in idxmap if v isa SIMD) == Dict(k => v for (k, v) in memmap if v isa SIMD)
    @assert all_simd_bits_equal

    inv_idxmap = inv(idxmap)

    # Check for bank conflicts
    flag_if_bank_conflict = identity
    #BROKEN if MemoryN ≡ Memory
    #BROKEN     thread_bits = sum(Int[1 << (memmap[inv_idxmap[thr]]::MemoryN).bit
    #BROKEN                           for thr in threads if inv_idxmap[thr] ∉ ignore && memmap[inv_idxmap[thr]] isa Memory])
    #BROKEN     if thread_bits ≠ 0x1f
    #BROKEN         msg = "Bank conflict: thread_mask=0x" * string(thread_bits; base=16) * " (expected 0x1f)"
    #BROKEN         flag_if_bank_conflict = val -> :(comment($msg, $val))
    #BROKEN         @warn msg
    #BROKEN     end
    #BROKEN end

    indices = Dict{Int,Code}()
    for r in 0:register_mask
        if r & ~register_mask == 0
            expressions = Code[]
            # TODO: This assumes a memory layout in CUDA `int`s, not bytes
            # TODO: Check for aligned access
            push!(
                expressions,
                movebits(
                    :(loopIdx5 % $SizeT),
                    [
                        BitMap(lp.bit, (memmap[inv_idxmap[lp]]::MemoryN).bit) for
                        lp in loops5 if inv_idxmap[lp] ∉ ignore && memmap[inv_idxmap[lp]] isa MemoryN
                    ],
                    loop5_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :(loopIdx4 % $SizeT),
                    [
                        BitMap(lp.bit, (memmap[inv_idxmap[lp]]::MemoryN).bit) for
                        lp in loops4 if inv_idxmap[lp] ∉ ignore && memmap[inv_idxmap[lp]] isa MemoryN
                    ],
                    loop4_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :(loopIdx3 % $SizeT),
                    [
                        BitMap(lp.bit, (memmap[inv_idxmap[lp]]::MemoryN).bit) for
                        lp in loops3 if inv_idxmap[lp] ∉ ignore && memmap[inv_idxmap[lp]] isa MemoryN
                    ],
                    loop3_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :(loopIdx2 % $SizeT),
                    [
                        BitMap(lp.bit, (memmap[inv_idxmap[lp]]::MemoryN).bit) for
                        lp in loops2 if inv_idxmap[lp] ∉ ignore && memmap[inv_idxmap[lp]] isa MemoryN
                    ],
                    loop2_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :(loopIdx1 % $SizeT),
                    [
                        BitMap(lp.bit, (memmap[inv_idxmap[lp]]::MemoryN).bit) for
                        lp in loops1 if inv_idxmap[lp] ∉ ignore && memmap[inv_idxmap[lp]] isa MemoryN
                    ],
                    loop1_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :((blockIdx().x - Int32(1)) % $SizeT),
                    [
                        BitMap(bl.bit, (memmap[inv_idxmap[bl]]::MemoryN).bit) for
                        bl in blocks if inv_idxmap[bl] ∉ ignore && memmap[inv_idxmap[bl]] isa MemoryN
                    ],
                    block_mask,
                ),
            )
            push!(
                expressions,
                movebits(
                    :((threadIdx().y - Int32(1)) % $SizeT),
                    [
                        BitMap(wr.bit, (memmap[inv_idxmap[wr]]::MemoryN).bit) for
                        wr in warps if inv_idxmap[wr] ∉ ignore && memmap[inv_idxmap[wr]] isa MemoryN
                    ],
                    warp_mask,
                ),
            )
            push!(
                expressions,
                flag_if_bank_conflict(
                    movebits(
                        :((threadIdx().x - Int32(1)) % $SizeT),
                        [
                            BitMap(thr.bit, (memmap[inv_idxmap[thr]]::MemoryN).bit) for
                            thr in threads if inv_idxmap[thr] ∉ ignore && memmap[inv_idxmap[thr]] isa MemoryN
                        ],
                        thread_mask,
                    ),
                ),
            )
            push!(
                expressions,
                movebits(
                    SizeT(r),
                    [
                        BitMap(reg.bit, (memmap[inv_idxmap[reg]]::MemoryN).bit) for
                        reg in registers if inv_idxmap[reg] ∉ ignore && memmap[inv_idxmap[reg]] isa MemoryN
                    ],
                ),
            )
            if offset ≠ 0
                push!(expressions, offset)
            end
            @assert !isempty(expressions)
            filter!(≠(0), expressions)
            expressions = map(x -> x isa Integer ? :($x % Int32) : x, expressions)
            if isempty(expressions)
                expression = make_uint(0)
            elseif length(expressions) == 1
                expression = expressions[1]
            else
                expression = :(+($(expressions...)))
            end
            indices[r] = expression
        end
    end
    return indices
end

export load!
function load!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, lhsmap::Layout, mem::Symbol, memmap::Layout; align::Int=4
)
    @assert ispow2(align)
    @assert lhs ∉ keys(env)
    type = get_type(lhsmap)
    env[lhs] = lhsmap

    registers = [v for (k, v) in lhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    use_load2 = false
    if align ≥ 8 && Memory(0) ∈ values(memmap)
        membit0 = inv(memmap)[Memory(0)]
        load2_reg = lhsmap[membit0]
        use_load2 = load2_reg isa Register
    end
    use_load4 = false
    if use_load2 && align ≥ 16 && Memory(1) ∈ values(memmap)
        membit1 = inv(memmap)[Memory(1)]
        load4_reg = lhsmap[membit1]
        use_load4 = load4_reg isa Register
    end

    indices = make_indices(lhsmap, memmap)
    have_memory2 = any(v -> v isa Memory2, values(memmap))
    indices2 = make_indices(lhsmap, memmap; memory=Memory2)
    have_memory3 = any(v -> v isa Memory3, values(memmap))
    indices3 = make_indices(lhsmap, memmap; memory=Memory3)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            lhsname = Symbol(lhs, rname)
            index = indices[r]
            index2 = indices2[r]
            index3 = indices3[r]
            # It is important to write `1 + $expression` instead of
            # `$expression + 1`, so that the added `1` can be combined
            # with the subtracted `1` in the `getindex` function.
            if use_load4
                load2_regmask = 1 << load2_reg.bit
                load4_regmask = 1 << load4_reg.bit
                if r & (load4_regmask | load2_regmask) == 0
                    @assert register_mask ≠ 0
                    lhsname0 = Symbol(lhs, "_$r")
                    lhsname1 = Symbol(lhs, "_$(r | load2_regmask)")
                    lhsname2 = Symbol(lhs, "_$(r | load4_regmask)")
                    lhsname3 = Symbol(lhs, "_$(r | load4_regmask | load2_regmask)")
                    if have_memory3
                        @assert false
                    elseif have_memory2
                        @assert false
                    else
                        push!(
                            stmts,
                            :(
                                # ($lhsname0, $lhsname1, $lhsname2, $lhsname3) =
                                #     ($mem[1 + $index], $mem[2 + $index], $mem[3 + $index], $mem[4 + $index])::NTuple{4,$type}
                                ($lhsname0, $lhsname1, $lhsname2, $lhsname3) =
                                    unsafe_load4_global($mem, 1 + $index)::NTuple{4,$type}
                            ),
                        )
                    end
                end
            elseif use_load2
                @assert false
            else
                if have_memory3
                    push!(stmts, :($lhsname = @inbounds $mem[1 + $index, 1 + $index2, 1 + $index3]::$type))
                elseif have_memory2
                    push!(stmts, :($lhsname = @inbounds $mem[1 + $index, 1 + $index2]::$type))
                else
                    push!(stmts, :($lhsname = @inbounds $mem[1 + $index]::$type))
                end
            end
        end
    end
    push!(steps, Step(
        "Load from memory",
        Variable[],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

export store!
# TODO: We could introduce a version of `store!` with `ignore::Set{<:Target}`
function store!(
    steps::Vector{AbstractStep},
    env::Environment,
    rhs::Symbol,
    mem::Symbol,
    memmap::Layout;
    operator::Symbol=:(=),
    ignore::Set{<:Index}=Set{Index}(),
    offset::Code=Int32(0),
    align::Int=4,
)
    @assert ispow2(align)
    rhsmap = env[rhs]

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    use_store2 = false
    if align ≥ 8 && Memory(0) ∈ values(memmap)
        membit0 = inv(memmap)[Memory(0)]
        store2_reg = rhsmap[membit0]
        use_store2 = store2_reg isa Register
    end
    use_store4 = false
    if use_store2 && align ≥ 16 && Memory(1) ∈ values(memmap)
        membit1 = inv(memmap)[Memory(1)]
        store4_reg = rhsmap[membit1]
        use_store4 = store4_reg isa Register
    end

    indices = make_indices(rhsmap, memmap; ignore)
    have_memory2 = any(v -> v isa Memory2, values(memmap))
    indices2 = make_indices(rhsmap, memmap; ignore, memory=Memory2)
    have_memory3 = any(v -> v isa Memory3, values(memmap))
    indices3 = make_indices(rhsmap, memmap; ignore, memory=Memory3)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            rhsname = Symbol(rhs, rname)
            index = indices[r]
            index2 = indices2[r]
            index3 = indices3[r]

            # It is important to write `1 + $expression` instead of
            # `$expression + 1`, so that the added `1` can be combined
            # with the subtracted `1` in the `getindex` function.
            if use_store4
                store2_regmask = 1 << store2_reg.bit
                store4_regmask = 1 << store4_reg.bit
                if r & (store4_regmask | store2_regmask) == 0
                    @assert register_mask ≠ 0
                    rhsname0 = Symbol(rhs, "_$r")
                    rhsname1 = Symbol(rhs, "_$(r | store2_regmask)")
                    rhsname2 = Symbol(rhs, "_$(r | store4_regmask)")
                    rhsname3 = Symbol(rhs, "_$(r | store4_regmask | store2_regmask)")
                    if operator === :(=)
                        if have_memory3
                            @assert false
                        elseif have_memory2
                            push!(
                                stmts,
                                :(unsafe_store4_global!(
                                    $mem,
                                    1 + $offset + size($mem, 1) * $index2 + $index,
                                    ($rhsname0, $rhsname1, $rhsname2, $rhsname3),
                                )),
                            )
                        else
                            push!(
                                stmts,
                                :(unsafe_store4_global!($mem, 1 + $index + $offset, ($rhsname0, $rhsname1, $rhsname2, $rhsname3))),
                            )
                        end
                    else
                        @assert false
                    end
                end
            elseif use_store2
                @assert false
            else
                if operator === :(=)
                    if have_memory3
                        push!(stmts, :(@inbounds $mem[1 + $index + $offset, 1 + $index2, 1 + $index3] = $rhsname))
                    elseif have_memory2
                        push!(stmts, :(@inbounds $mem[1 + $index + $offset, 1 + $index2] = $rhsname))
                    else
                        push!(stmts, :(@inbounds $mem[1 + $index + $offset] = $rhsname))
                    end
                elseif operator === :(+=)
                    @assert !have_memory2 && !have_memory3
                    push!(stmts, :(@inbounds $mem[1 + $index] += $rhsname))
                else
                    @assert false
                end
            end
        end
    end
    # TODO: If the offset is non-zero, mark it as input
    push!(steps, Step(
        "Store to memory",
        [rhs => rhsmap],
        Variable[],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

################################################################################

export move!
function move!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, indexmap::Pair{Register,Register})
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)

    rhsreg = indexmap[1]
    lhsreg = indexmap[2]
    reg_dual = inv_rhsmap[rhsreg]

    @assert lhsreg ∉ inv_rhsmap
    lhsmap = copy(rhsmap)
    @assert lhsmap[reg_dual] == rhsreg
    lhsmap[reg_dual] = lhsreg
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    @assert (1 << rhsreg.bit) & register_mask ≠ 0
    @assert (1 << lhsreg.bit) & register_mask == 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << rhsreg.bit) == 0
                rhsr0 = r
                rhsr1 = r | (1 << rhsreg.bit)
                lhsr0 = r
                lhsr1 = r | (1 << lhsreg.bit)
                rhsrname0 = register_mask == 0 ? "" : "_$rhsr0"
                rhsrname1 = register_mask == 0 ? "" : "_$rhsr1"
                lhsrname0 = register_mask == 0 ? "" : "_$lhsr0"
                lhsrname1 = register_mask == 0 ? "" : "_$lhsr1"
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, lhsrname0)) = $(Symbol(rhs, rhsrname0))
                        $(Symbol(lhs, lhsrname1)) = $(Symbol(rhs, rhsrname1))
                    end,
                )
            end
        end
    end

    push!(
        steps,
        Step(
            "Move Register($(rhsreg.bit)) => Register($(lhsreg.bit))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

################################################################################

export rename!
function rename!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, mapping::Dict{<:Index,<:Index})
    inv_mapping = Dict(i2 => i1 for (i1, i2) in mapping)
    @assert all(inv_mapping[mapping[i1]] == i1 for i1 in keys(mapping))
    @assert all(mapping[inv_mapping[i2]] == i2 for i2 in values(mapping))

    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    lhsmap = Layout(rhsmap.type, Dict{Index,Target}(get(mapping, ind, ind) => tgt for (ind, tgt) in rhsmap))
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"
            push!(
                stmts,
                quote
                    $(Symbol(lhs, rname)) = $(Symbol(rhs, rname))
                end,
            )
        end
    end

    push!(steps, Step(
        "Rename indices $mapping",
        Variable[rhs => rhsmap],
        Variable[lhs => lhsmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

################################################################################

const lomask4 = 0x0f0f0f0f
# get_lo4(r0::Code, r1::Code) = :($(bitwise_merge(lomask4, :($r1 << 0x04), r0)) % UInt32)
# get_hi4(r0::Code, r1::Code) = :($(bitwise_merge(lomask4, r1, :($r0 >>> 0x04))) % UInt32)
get_lo4(r0::Int4x8, r1::Int4x8) = Int4x8(bitwise_merge(GPUIndexSpaces.lomask4, r1.val << 0x04, r0.val))
get_hi4(r0::Int4x8, r1::Int4x8) = Int4x8(bitwise_merge(GPUIndexSpaces.lomask4, r1.val, r0.val >>> 0x04))

# # get_lo8(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x6420 % UInt32) % Int32)
# # get_hi8(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x7531 % UInt32) % Int32)
# get_lo8(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4}} = T(cuda_prmt(r0.val, r1.val, 0x6420))
# get_hi8(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4}} = T(cuda_prmt(r0.val, r1.val, 0x7531))
# get_lo8(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x6240 % UInt32) % Int32)
# get_hi8(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x7351 % UInt32) % Int32)
get_lo8(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4}} = T(cuda_prmt(r0.val, r1.val, 0x6240))
get_hi8(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4}} = T(cuda_prmt(r0.val, r1.val, 0x7351))

# get_lo16(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x5410 % UInt32) % Int32)
# get_hi16(r0::Code, r1::Code) = :(cuda_prmt($r0 % UInt32, $r1 % UInt32, 0x7632 % UInt32) % Int32)
get_lo16(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4,Int16x2,Float16x2}} = T(cuda_prmt(r0.val, r1.val, 0x5410))
get_hi16(r0::T, r1::T) where {T<:Union{Int4x8,Int8x4,Int16x2,Float16x2}} = T(cuda_prmt(r0.val, r1.val, 0x7632))

function Base.permute!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, index1::Index, index2::Index)
    return permute!(steps, env, lhs, rhs, sort([env[rhs][index1], env[rhs][index2]])...)
end

function Base.permute!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, register::Register, simd::SIMD)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)
    simd_dual = inv_rhsmap[simd]
    register_dual = inv_rhsmap[register]
    lhsmap = copy(rhsmap)
    lhsmap[simd_dual] = register
    lhsmap[register_dual] = simd
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    @assert (1 << register.bit) & register_mask ≠ 0
    @assert (1 << simd.bit) & simd_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << register.bit) == 0
                r0 = r
                r1 = r | (1 << register.bit)
                rname0 = register_mask == 0 ? "" : "_$r0"
                rname1 = register_mask == 0 ? "" : "_$r1"
                if simd == SIMD(2)
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, rname0)) = GPUIndexSpaces.get_lo4($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                            $(Symbol(lhs, rname1)) = GPUIndexSpaces.get_hi4($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                        end,
                    )
                elseif simd == SIMD(3)
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, rname0)) = GPUIndexSpaces.get_lo8($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                            $(Symbol(lhs, rname1)) = GPUIndexSpaces.get_hi8($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                        end,
                    )
                elseif simd == SIMD(4)
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, rname0)) = GPUIndexSpaces.get_lo16($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                            $(Symbol(lhs, rname1)) = GPUIndexSpaces.get_hi16($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                        end,
                    )
                else
                    error("not implemented")
                end
            end
        end
    end

    push!(
        steps,
        Step(
            "Permute Register($(register.bit)) and SIMD($(simd.bit))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

function Base.permute!(
    steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, register1::Register, register2::Register
)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)
    register1_dual = inv_rhsmap[register1]
    register2_dual = inv_rhsmap[register2]
    lhsmap = copy(rhsmap)
    lhsmap[register1_dual] = register2
    lhsmap[register2_dual] = register1
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    @assert (1 << register1.bit) & register_mask ≠ 0
    @assert (1 << register2.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << register1.bit) == 0
                r0 = r
                r1 = r | (1 << register1.bit)
                rname0 = register_mask == 0 ? "" : "_$r0"
                rname1 = register_mask == 0 ? "" : "_$r1"
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, rname0)) = $(Symbol(rhs, rname1))
                        $(Symbol(lhs, rname1)) = $(Symbol(rhs, rname0))
                    end,
                )
            end
        end
    end

    push!(
        steps,
        Step(
            "Permute Register($(register1.bit)) and Register($(register2.bit))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

function Base.permute!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, register::Register, thread::Thread)
    rhsmap = env[rhs]
    @assert lhs ∉ keys(env)
    inv_rhsmap = inv(rhsmap)
    register_dual = inv_rhsmap[register]
    thread_dual = inv_rhsmap[thread]
    lhsmap = copy(rhsmap)
    lhsmap[register_dual] = thread
    lhsmap[thread_dual] = register
    type = get_type(lhsmap)
    env[lhs] = lhsmap

    threads = [v for (k, v) in rhsmap if v isa Thread]
    thread_mask = sum(UInt[1 << thr.bit for thr in threads])
    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    @assert (1 << thread.bit) & thread_mask ≠ 0
    @assert (1 << register.bit) & register_mask ≠ 0

    to_UInt32(expr) = type ∈ (Float32, Int32) ? :(reinterpret(UInt32, $expr)) : :($expr.val)
    from_UInt32(expr) = type ∈ (Float32, Int32) ? :(reinterpret($type, $expr)) : :($type($expr))

    stmts = Code[]
    push!(
        stmts,
        quote
            mask = $(UInt32(1 << thread.bit))
            # Thread 0: exchange register 1
            # Thread 1: exchange register 0
            isthread1 = ((threadIdx().x - Int32(1)) % Int32) & mask ≠ 0
        end,
    )
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << register.bit) == 0
                r0 = r
                r1 = r | (1 << register.bit)
                rname0 = register_mask == 0 ? "" : "_$r0"
                rname1 = register_mask == 0 ? "" : "_$r1"
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, rname0)) = $(Symbol(rhs, rname0))
                        $(Symbol(lhs, rname1)) = $(Symbol(rhs, rname1))
                        src = isthread1 ? $(Symbol(rhs, rname0)) : $(Symbol(rhs, rname1))
                        src′ = $(to_UInt32(:src))::UInt32
                        dst′ = shfl_xor_sync($(~UInt32(0)), src′, mask)::UInt32
                        dst = $(from_UInt32(:dst′))::$type
                        if isthread1
                            $(Symbol(lhs, rname0)) = dst
                        else
                            $(Symbol(lhs, rname1)) = dst
                        end
                    end,
                )
            end
        end
    end

    push!(
        steps,
        Step(
            "Permute Thread($(thread.bit)) and Register($(register.bit))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

################################################################################

export addsub!
function addsub!(
    steps::Vector{AbstractStep}, env::Environment, k::Symbol, x::Symbol, x2k::Pair{<:Index,<:Index}; flipsignsub2::Bool=false
)
    xmap = env[x]
    @assert k ∉ keys(env)

    register = xmap[x2k[1]]::Register
    @assert x2k[2] ∉ keys(xmap)

    kmap = copy(xmap)
    delete!(kmap, x2k[1])
    kmap[x2k[2]] = register
    env[k] = kmap

    registers = [v for (k, v) in xmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])

    @assert (1 << register.bit) & register_mask ≠ 0

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & 1 << register.bit == 0
                r0 = r
                r1 = r | 1 << register.bit
                rname0 = register_mask == 0 ? "" : "_$r0"
                rname1 = register_mask == 0 ? "" : "_$r1"

                # addop = :(+)
                addop = :+
                # We allow changing the sign of the second operand of the subtraction
                @assert !flipsignsub2 # currently unused
                # subop = flipsignsub2 ? :(+) : :(-)
                subop = flipsignsub2 ? :+ : :-

                push!(
                    stmts,
                    quote
                        $(Symbol(k, rname0)) = $addop($(Symbol(x, rname0)), $(Symbol(x, rname1)))
                        $(Symbol(k, rname1)) = $subop($(Symbol(x, rname0)), $(Symbol(x, rname1)))
                    end,
                )
            end
        end
    end

    push!(steps, Step(
        "addsub",
        Variable[x => xmap],
        Variable[k => kmap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

################################################################################

export widen!
function widen!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, indexmap::Pair{<:Index,Register})
    return widen!(steps, env, lhs, rhs, env[rhs][indexmap[1]] => indexmap[2])
end

function widen!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, targetmap::Pair{SIMD,Register})
    rhsmap = env[rhs]

    rhssimd = targetmap[1]::SIMD
    rhsreg = targetmap[2]::Register

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    index = inv(rhsmap)[targetmap[1]]::Index
    @assert index ∈ keys(lhsmap)
    @assert lhsmap[index] == targetmap[1]
    lhsmap[index] = targetmap[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    @assert (1 << rhsreg.bit) & register_mask == 0
    @assert simd_bits ≥ 1
    @assert rhssimd == SIMD(5 - simd_bits)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"

            lnamelo = "_$r"
            @assert r & (1 << rhsreg.bit) == 0
            lnamehi = "_$(r | 1 << rhsreg.bit)"

            if rhssimd == SIMD(4)
                if lhsmap.type ≡ Float32
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, lnamelo)), $(Symbol(lhs, lnamehi)) = convert(NTuple{2,Float32}, $(Symbol(rhs, rname)))
                        end,
                    )
                elseif lhsmap.type ≡ Int32
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, lnamelo)), $(Symbol(lhs, lnamehi)) = convert(NTuple{2,Int32}, $(Symbol(rhs, rname)))
                        end,
                    )
                else
                    @assert false
                end
            elseif rhssimd == SIMD(3)
                @assert lhsmap.type ≡ Int32
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, lnamelo)), $(Symbol(lhs, lnamehi)) = convert(NTuple{2,Int16x2}, $(Symbol(rhs, rname)))
                    end,
                )
            elseif rhssimd == SIMD(2)
                @assert lhsmap.type ≡ Int32
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, lnamelo)), $(Symbol(lhs, lnamehi)) = convert(NTuple{2,Int8x4}, $(Symbol(rhs, rname)))
                    end,
                )
            else
                @assert false
            end
        end
    end

    push!(
        steps,
        Step(
            "widen SIMD($(targetmap[1])) => Register($(targetmap[2]))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

export widen2!
function widen2!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    indexmap1::Pair{<:Index,Register},
    indexmap2::Pair{<:Index,Register},
)
    @assert indexmap1[1] ≠ indexmap2[1]
    return widen2!(steps, env, lhs, rhs, env[rhs][indexmap1[1]] => indexmap1[2], env[rhs][indexmap2[1]] => indexmap2[2])
end

function widen2!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    targetmap1::Pair{SIMD,Register},
    targetmap2::Pair{SIMD,Register},
)
    rhsmap = env[rhs]

    rhssimd1 = targetmap1[1]::SIMD
    rhsreg1 = targetmap1[2]::Register
    rhssimd2 = targetmap2[1]::SIMD
    rhsreg2 = targetmap2[2]::Register
    @assert rhssimd1 ≠ rhssimd2
    @assert rhsreg1 ≠ rhsreg2

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    index1 = inv(rhsmap)[targetmap1[1]]::Index
    index2 = inv(rhsmap)[targetmap2[1]]::Index
    @assert index1 ∈ keys(lhsmap)
    @assert index2 ∈ keys(lhsmap)
    @assert lhsmap[index1] == targetmap1[1]
    @assert lhsmap[index1] == targetmap1[1]
    lhsmap[index1] = targetmap1[2]
    lhsmap[index2] = targetmap2[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    @assert (1 << rhsreg1.bit) & register_mask == 0
    @assert (1 << rhsreg2.bit) & register_mask == 0
    @assert simd_bits ≥ 1
    @assert rhssimd1 == SIMD(5 - simd_bits)
    @assert rhssimd2 == SIMD(5 - (simd_bits - 1))

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"

            @assert r & (1 << rhsreg1.bit) == 0
            @assert r & (1 << rhsreg2.bit) == 0
            lname00 = "_$r"
            lname01 = "_$(r | 1 << rhsreg1.bit)"
            lname10 = "_$(r | 1 << rhsreg2.bit)"
            lname11 = "_$(r | 1 << rhsreg2.bit | 1 << rhsreg1.bit)"

            if (rhssimd1, rhssimd2) == (SIMD(3), SIMD(4))
                @assert lhsmap.type ≡ Int32
                push!(
                    stmts,
                    quote
                        $(Symbol(lhs, lname00)), $(Symbol(lhs, lname01)), $(Symbol(lhs, lname10)), $(Symbol(lhs, lname11)) = convert(
                            NTuple{4,Int32}, $(Symbol(rhs, rname))
                        )
                    end,
                )
            else
                @assert false
            end
        end
    end

    push!(
        steps,
        Step(
            "widen2 SIMD($(targetmap1[1])),SIMD($(targetmap2[1])) => Register($(targetmap1[2])),Register($(targetmap2[2]))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

export narrow!
function narrow!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, indexmap::Pair{<:Index,Register})
    return narrow!(steps, env, lhs, rhs, env[rhs][indexmap[1]] => indexmap[2])
end

function narrow!(steps::Vector{AbstractStep}, env::Environment, lhs::Symbol, rhs::Symbol, targetmap::Pair{Register,SIMD})
    rhsmap = env[rhs]

    rhsreg = targetmap[1]::Register
    rhssimd = targetmap[2]::SIMD

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    index = inv(rhsmap)[targetmap[1]]::Index
    @assert index ∈ keys(lhsmap)
    @assert lhsmap[index] == targetmap[1]
    lhsmap[index] = targetmap[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    @assert (1 << rhsreg.bit) & register_mask ≠ 0
    @assert simd_bits ≤ 3
    @assert rhssimd == SIMD(5 - simd_bits - 1)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << rhsreg.bit) == 0
                rname = register_mask == 0 ? "" : "_$r"

                @assert r & (1 << rhsreg.bit) == 0
                rname0 = "_$r"
                rname1 = "_$(r | 1 << rhsreg.bit)"

                if rhssimd == SIMD(4)
                    if lhsmap.type ≡ Float32
                        push!(
                            stmts,
                            quote
                                $(Symbol(lhs, rname)) = Float16x2($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                            end,
                        )
                    elseif lhsmap.type ≡ Int32
                        push!(
                            stmts,
                            quote
                                $(Symbol(lhs, rname)) = Int16x2($(Symbol(rhs, rname0)), $(Symbol(rhs, rname1)))
                            end,
                        )
                    else
                        @assert false
                    end
                else
                    @assert false
                end
            end
        end
    end

    push!(
        steps,
        Step(
            "narrow Register($(targetmap[1])) => SIMD($(targetmap[2]))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

export narrow2!
function narrow2!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    indexmap1::Pair{<:Index,Register},
    indexmap2::Pair{<:Index,Register},
)
    @assert indexmap1[1] ≠ indexmap2[1]
    return narrow2!(steps, env, lhs, rhs, env[rhs][indexmap1[1]] => indexmap1[2], env[rhs][indexmap2[1]] => indexmap2[2])
end

function narrow2!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    targetmap1::Pair{Register,SIMD},
    targetmap2::Pair{Register,SIMD},
)
    rhsmap = env[rhs]

    rhsreg1 = targetmap1[1]::Register
    rhssimd1 = targetmap1[2]::SIMD
    rhsreg2 = targetmap2[1]::Register
    rhssimd2 = targetmap2[2]::SIMD
    @assert rhsreg1 ≠ rhsreg2
    @assert rhssimd1 ≠ rhssimd2

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    index1 = inv(rhsmap)[targetmap1[1]]::Index
    index2 = inv(rhsmap)[targetmap2[1]]::Index
    @assert index1 ∈ keys(lhsmap)
    @assert index2 ∈ keys(lhsmap)
    @assert lhsmap[index1] == targetmap1[1]
    @assert lhsmap[index2] == targetmap2[1]
    lhsmap[index1] = targetmap1[2]
    lhsmap[index2] = targetmap2[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    @assert (1 << rhsreg1.bit) & register_mask ≠ 0
    @assert (1 << rhsreg2.bit) & register_mask ≠ 0
    @assert simd_bits ≤ 3
    @assert rhssimd1 == SIMD(5 - simd_bits - 2)
    @assert rhssimd2 == SIMD(5 - simd_bits - 1)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << rhsreg2.bit | 1 << rhsreg1.bit) == 0
                rname = register_mask == 0 ? "" : "_$r"

                @assert r & (1 << rhsreg1.bit) == 0
                @assert r & (1 << rhsreg2.bit) == 0
                rname00 = "_$r"
                rname01 = "_$(r | 1 << rhsreg1.bit)"
                rname10 = "_$(r | 1 << rhsreg2.bit)"
                rname11 = "_$(r | 1 << rhsreg2.bit | 1 << rhsreg1.bit)"

                if (rhssimd1, rhssimd2) == (SIMD(3), SIMD(4))
                    @assert lhsmap.type ≡ Int32
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, rname)) = Int8x4(
                                $(Symbol(rhs, rname00)), $(Symbol(rhs, rname01)), $(Symbol(rhs, rname10)), $(Symbol(rhs, rname11))
                            )
                        end,
                    )
                else
                    @assert false
                end
            end
        end
    end

    push!(
        steps,
        Step(
            "narrow2 Register($(targetmap1[1])),Register($(targetmap2[1])) => SIMD($(targetmap1[2])),SIMD($(targetmap2[2]))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

export narrow3!
function narrow3!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    indexmap1::Pair{<:Index,Register},
    indexmap2::Pair{<:Index,Register},
    indexmap3::Pair{<:Index,Register},
)
    @assert indexmap1[1] ≠ indexmap2[1] && indexmap1[1] ≠ indexmap3[1] && indexmap3[1] ≠ indexmap3[1]
    return narrow3!(
        steps,
        env,
        lhs,
        rhs,
        env[rhs][indexmap1[1]] => indexmap1[2],
        env[rhs][indexmap2[1]] => indexmap2[2],
        env[rhs][indexmap3[1]] => indexmap3[2],
    )
end

function narrow3!(
    steps::Vector{AbstractStep},
    env::Environment,
    lhs::Symbol,
    rhs::Symbol,
    targetmap1::Pair{Register,SIMD},
    targetmap2::Pair{Register,SIMD},
    targetmap3::Pair{Register,SIMD},
)
    rhsmap = env[rhs]

    rhsreg1 = targetmap1[1]::Register
    rhssimd1 = targetmap1[2]::SIMD
    rhsreg2 = targetmap2[1]::Register
    rhssimd2 = targetmap2[2]::SIMD
    rhsreg3 = targetmap3[1]::Register
    rhssimd3 = targetmap3[2]::SIMD
    @assert rhsreg1 ≠ rhsreg2 && rhsreg1 ≠ rhsreg3 && rhsreg2 ≠ rhsreg3
    @assert rhssimd1 ≠ rhssimd2 && rhssimd1 ≠ rhssimd3 && rhssimd2 ≠ rhssimd3

    @assert lhs ∉ keys(env)
    lhsmap = copy(rhsmap)
    index1 = inv(rhsmap)[targetmap1[1]]::Index
    index2 = inv(rhsmap)[targetmap2[1]]::Index
    index3 = inv(rhsmap)[targetmap3[1]]::Index
    @assert index1 ∈ keys(lhsmap)
    @assert index2 ∈ keys(lhsmap)
    @assert index3 ∈ keys(lhsmap)
    @assert lhsmap[index1] == targetmap1[1]
    @assert lhsmap[index2] == targetmap2[1]
    @assert lhsmap[index3] == targetmap3[1]
    lhsmap[index1] = targetmap1[2]
    lhsmap[index2] = targetmap2[2]
    lhsmap[index3] = targetmap3[2]
    env[lhs] = lhsmap

    registers = [v for (k, v) in rhsmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in rhsmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    @assert (1 << rhsreg1.bit) & register_mask ≠ 0
    @assert (1 << rhsreg2.bit) & register_mask ≠ 0
    @assert (1 << rhsreg3.bit) & register_mask ≠ 0
    @assert simd_bits ≤ 2
    @assert rhssimd1 == SIMD(5 - simd_bits - 3)
    @assert rhssimd2 == SIMD(5 - simd_bits - 2)
    @assert rhssimd3 == SIMD(5 - simd_bits - 1)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            if r & (1 << rhsreg3.bit | 1 << rhsreg2.bit | 1 << rhsreg1.bit) == 0
                rname = register_mask & ~(1 << rhsreg1.bit) & ~(1 << rhsreg2.bit) & ~(1 << rhsreg3.bit) == 0 ? "" : "_$r"

                @assert r & (1 << rhsreg1.bit) == 0
                @assert r & (1 << rhsreg2.bit) == 0
                @assert r & (1 << rhsreg3.bit) == 0
                rname000 = "_$r"
                rname001 = "_$(r | 1 << rhsreg1.bit)"
                rname010 = "_$(r | 1 << rhsreg2.bit)"
                rname011 = "_$(r | 1 << rhsreg2.bit | 1 << rhsreg1.bit)"
                rname100 = "_$(r | 1 << rhsreg3.bit)"
                rname101 = "_$(r | 1 << rhsreg3.bit | 1 << rhsreg1.bit)"
                rname110 = "_$(r | 1 << rhsreg3.bit | 1 << rhsreg2.bit)"
                rname111 = "_$(r | 1 << rhsreg3.bit | 1 << rhsreg2.bit | 1 << rhsreg1.bit)"

                if (rhssimd1, rhssimd2, rhssimd3) == (SIMD(2), SIMD(3), SIMD(4))
                    @assert lhsmap.type ≡ Int32
                    push!(
                        stmts,
                        quote
                            $(Symbol(lhs, rname)) = Int4x8(
                                $(Symbol(rhs, rname000)),
                                $(Symbol(rhs, rname001)),
                                $(Symbol(rhs, rname010)),
                                $(Symbol(rhs, rname011)),
                                $(Symbol(rhs, rname100)),
                                $(Symbol(rhs, rname101)),
                                $(Symbol(rhs, rname110)),
                                $(Symbol(rhs, rname111)),
                            )
                        end,
                    )
                else
                    @assert false
                end
            end
        end
    end

    push!(
        steps,
        Step(
            "narrow3 Register($(targetmap1[1])),Register($(targetmap2[1])),Register($(targetmap3[1])) => SIMD($(targetmap1[2])),SIMD($(targetmap2[2])),SIMD($(targetmap3[2]))",
            Variable[rhs => rhsmap],
            Variable[lhs => lhsmap],
            quote
                $(stmts...)
            end,
        ),
    )
    return nothing
end

################################################################################

export div2!
function div2!(steps::Vector{AbstractStep}, env::Environment, y::Symbol, x::Symbol)
    xmap = env[x]
    @assert y ∉ keys(env)

    ymap = xmap
    env[y] = ymap

    registers = [v for (k, v) in xmap if v isa Register]
    register_mask = sum(UInt[1 << reg.bit for reg in registers])
    simds = [v for (k, v) in xmap if v isa SIMD]
    simd_mask = sum(UInt[1 << simd.bit for simd in simds])
    simd_bits = count_ones(simd_mask)
    @assert simd_mask == (0x01 << simd_bits - 0x01) << (5 - simd_bits)

    stmts = Code[]
    for r in 0:register_mask
        if r & ~register_mask == 0
            rname = register_mask == 0 ? "" : "_$r"

            @assert ymap.type ≡ Int32

            if simd_bits == 0
                push!(
                    stmts,
                    quote
                        $(Symbol(y, rname)) = $(Symbol(x, rname)) >> 0x01
                    end,
                )
            elseif simd_bits == 1
                push!(
                    stmts,
                    quote
                        $(Symbol(y, rname)) = $(bitwise_merge(0x80008000, :($(Symbol(x, rname)) >>> 0x01), Symbol(x, rname)))
                    end,
                )
            elseif simd_bits == 2
                push!(
                    stmts,
                    quote
                        $(Symbol(y, rname)) = $(bitwise_merge(0x80808080, :($(Symbol(x, rname)) >>> 0x01), Symbol(x, rname)))
                    end,
                )
            elseif simd_bits == 3
                push!(
                    stmts,
                    quote
                        $(Symbol(y, rname)) = $(bitwise_merge(0x88888888, :($(Symbol(x, rname)) >>> 0x01), Symbol(x, rname)))
                    end,
                )
            else
                @assert 0
            end
        end
    end

    push!(steps, Step(
        "div2",
        Variable[x => xmap],
        Variable[y => ymap],
        quote
            $(stmts...)
        end,
    ))
    return nothing
end

################################################################################

export mma_m8n8k16
function mma_m8n8k16(A::Int8x4, B::Int8x4, C::NTuple{2,Int32})
    return Base.llvmcall(
        """
            %res = call {i32, i32} asm sideeffect "mma.sync.aligned.m8n8k16.row.col.satfinite.s32.s8.s8.s32 {\$0, \$1}, {\$2}, {\$3}, {\$4, \$5};", "=r,=r,r,r,r,r"(i32 %0, i32 %1, i32 %2, i32 %3)
            %res0 = extractvalue {i32, i32} %res, 0
            %res1 = extractvalue {i32, i32} %res, 1
            %val0 = insertvalue [2 x i32] undef, i32 %res0, 0
            %val = insertvalue [2 x i32] %val0, i32 %res1, 1
            ret [2 x i32] %val
        """,
        NTuple{2,Int32},
        NTuple{4,Int32},
        A.val % Int32,
        B.val % Int32,
        C[1],
        C[2],
    )
end

export mma_row_col_m8n8k16_s8!
function mma_row_col_m8n8k16_s8!(steps::Vector{AbstractStep}, env::Environment, D::Symbol, A::Symbol, B::Symbol, C::Symbol)
    Amap = env[A]
    Bmap = env[B]
    Cmap = env[C]
    @assert D ∉ keys(env)
    Dmap = Cmap
    env[D] = Dmap

    threads_A = [v for (k, v) in Amap if v isa Thread]
    thread_mask_A = sum(UInt[1 << thr.bit for thr in threads_A])
    registers_A = [v for (k, v) in Amap if v isa Register]
    register_mask_A = sum(UInt[1 << reg.bit for reg in registers_A])
    simds_A = [v for (k, v) in Amap if v isa SIMD]
    simd_mask_A = sum(UInt[1 << simd.bit for simd in simds_A])
    simd_bits_A = count_ones(simd_mask_A)
    @assert simd_mask_A == (0x01 << simd_bits_A - 0x01) << (5 - simd_bits_A)
    @assert Amap.type ≡ Int32

    threads_B = [v for (k, v) in Bmap if v isa Thread]
    thread_mask_B = sum(UInt[1 << thr.bit for thr in threads_B])
    registers_B = [v for (k, v) in Bmap if v isa Register]
    register_mask_B = sum(UInt[1 << reg.bit for reg in registers_B])
    simds_B = [v for (k, v) in Bmap if v isa SIMD]
    simd_mask_B = sum(UInt[1 << simd.bit for simd in simds_B])
    simd_bits_B = count_ones(simd_mask_B)
    @assert simd_mask_B == (0x01 << simd_bits_B - 0x01) << (5 - simd_bits_B)
    @assert Bmap.type ≡ Int32

    threads_C = [v for (k, v) in Cmap if v isa Thread]
    thread_mask_C = sum(UInt[1 << thr.bit for thr in threads_C])
    registers_C = [v for (k, v) in Cmap if v isa Register]
    register_mask_C = sum(UInt[1 << reg.bit for reg in registers_C])
    simds_C = [v for (k, v) in Cmap if v isa SIMD]
    simd_mask_C = sum(UInt[1 << simd.bit for simd in simds_C])
    simd_bits_C = count_ones(simd_mask_C)
    @assert simd_mask_C == (0x01 << simd_bits_C - 0x01) << (5 - simd_bits_C)
    @assert Cmap.type ≡ Int32

    # We could loop over additional register bits
    @assert count_ones(thread_mask_A) == 5
    @assert count_ones(register_mask_A) == 0
    @assert simd_bits_A == 2
    @assert thread_mask_A == 0b11111
    @assert register_mask_A == 0b0
    @assert simd_mask_A == 0b11000

    @assert count_ones(thread_mask_B) == 5
    @assert count_ones(register_mask_B) == 0
    @assert simd_bits_B == 2
    @assert thread_mask_B == 0b11111
    @assert register_mask_B == 0b0
    @assert simd_mask_B == 0b11000

    @assert count_ones(thread_mask_C) == 5
    @assert count_ones(register_mask_C) == 1
    @assert simd_bits_C == 0
    @assert thread_mask_C == 0b11111
    @assert register_mask_C == 0b1
    @assert simd_mask_C == 0b00000

    inv_Amap = inv(Amap)
    dual_A_col0 = inv_Amap[SIMD(3)]
    dual_A_col1 = inv_Amap[SIMD(4)]
    dual_A_col2 = inv_Amap[Thread(0)]
    dual_A_col3 = inv_Amap[Thread(1)]
    dual_A_row0 = inv_Amap[Thread(2)]
    dual_A_row1 = inv_Amap[Thread(3)]
    dual_A_row2 = inv_Amap[Thread(4)]

    inv_Bmap = inv(Bmap)
    dual_B_row0 = inv_Bmap[SIMD(3)]
    dual_B_row1 = inv_Bmap[SIMD(4)]
    dual_B_row2 = inv_Bmap[Thread(0)]
    dual_B_row3 = inv_Bmap[Thread(1)]
    dual_B_col0 = inv_Bmap[Thread(2)]
    dual_B_col1 = inv_Bmap[Thread(3)]
    dual_B_col2 = inv_Bmap[Thread(4)]

    inv_Cmap = inv(Cmap)
    dual_C_col0 = inv_Cmap[Register(0)]
    dual_C_col1 = inv_Cmap[Thread(0)]
    dual_C_col2 = inv_Cmap[Thread(1)]
    dual_C_row0 = inv_Cmap[Thread(2)]
    dual_C_row1 = inv_Cmap[Thread(3)]
    dual_C_row2 = inv_Cmap[Thread(4)]

    @assert dual_C_row0 == dual_A_row0
    @assert dual_C_row1 == dual_A_row1
    @assert dual_C_row2 == dual_A_row2

    @assert dual_A_col0 == dual_B_row0
    @assert dual_A_col1 == dual_B_row1
    @assert dual_A_col2 == dual_B_row2

    code = quote
        A_frag = $(Symbol(A))::Int8x4
        B_frag = $(Symbol(B))::Int8x4
        C_frag = ($([Symbol(C, :_, i) for i in 0:1]...),)::NTuple{2,Int32}
        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
        ($([Symbol(D, :_, i) for i in 0:1]...),) = D_frag
    end

    push!(steps, Step("mma 8x8x16", Variable[A => Amap, B => Bmap, C => Cmap], Variable[D => Dmap], code))
    return nothing
end

export wmma_mma_row_col_m16n16k16_s8!
function wmma_mma_row_col_m16n16k16_s8!(steps::Vector{AbstractStep}, env::Environment, D::Symbol, A::Symbol, B::Symbol, C::Symbol)
    Amap = env[A]
    Bmap = env[B]
    Cmap = env[C]
    @assert D ∉ keys(env)
    Dmap = Cmap
    env[D] = Dmap

    threads_A = [v for (k, v) in Amap if v isa Thread]
    thread_mask_A = sum(UInt[1 << thr.bit for thr in threads_A])
    registers_A = [v for (k, v) in Amap if v isa Register]
    register_mask_A = sum(UInt[1 << reg.bit for reg in registers_A])
    simds_A = [v for (k, v) in Amap if v isa SIMD]
    simd_mask_A = sum(UInt[1 << simd.bit for simd in simds_A])
    simd_bits_A = count_ones(simd_mask_A)
    @assert simd_mask_A == (0x01 << simd_bits_A - 0x01) << (5 - simd_bits_A)
    @assert Amap.type ≡ Int32

    threads_B = [v for (k, v) in Bmap if v isa Thread]
    thread_mask_B = sum(UInt[1 << thr.bit for thr in threads_B])
    registers_B = [v for (k, v) in Bmap if v isa Register]
    register_mask_B = sum(UInt[1 << reg.bit for reg in registers_B])
    simds_B = [v for (k, v) in Bmap if v isa SIMD]
    simd_mask_B = sum(UInt[1 << simd.bit for simd in simds_B])
    simd_bits_B = count_ones(simd_mask_B)
    @assert simd_mask_B == (0x01 << simd_bits_B - 0x01) << (5 - simd_bits_B)
    @assert Bmap.type ≡ Int32

    threads_C = [v for (k, v) in Cmap if v isa Thread]
    thread_mask_C = sum(UInt[1 << thr.bit for thr in threads_C])
    registers_C = [v for (k, v) in Cmap if v isa Register]
    register_mask_C = sum(UInt[1 << reg.bit for reg in registers_C])
    simds_C = [v for (k, v) in Cmap if v isa SIMD]
    simd_mask_C = sum(UInt[1 << simd.bit for simd in simds_C])
    simd_bits_C = count_ones(simd_mask_C)
    @assert simd_mask_C == (0x01 << simd_bits_C - 0x01) << (5 - simd_bits_C)
    @assert Cmap.type ≡ Int32

    # We could loop over additional register bits
    @assert count_ones(thread_mask_A) == 5
    @assert count_ones(register_mask_A) == 1
    @assert simd_bits_A == 2
    @assert thread_mask_A == 0b11111
    @assert register_mask_A == 0b1
    @assert simd_mask_A == 0b11000

    @assert count_ones(thread_mask_B) == 5
    @assert count_ones(register_mask_B) == 1
    @assert simd_bits_B == 2
    @assert thread_mask_B == 0b11111
    @assert register_mask_B == 0b1
    @assert simd_mask_B == 0b11000

    @assert count_ones(thread_mask_C) == 5
    @assert count_ones(register_mask_C) == 3
    @assert simd_bits_C == 0
    @assert thread_mask_C == 0b11111
    @assert register_mask_C == 0b111
    @assert simd_mask_C == 0b00000

    # These fragment layouts are valid for (at least) sm_75 and sm_86
    inv_Amap = inv(Amap)
    dual_A_col0 = inv_Amap[SIMD(3)]
    dual_A_col1 = inv_Amap[SIMD(4)]
    dual_A_col2 = inv_Amap[Thread(0)]
    dual_A_col3 = inv_Amap[Thread(1)]
    dual_A_row0 = inv_Amap[Thread(2)]
    dual_A_row1 = inv_Amap[Thread(3)]
    dual_A_row2 = inv_Amap[Thread(4)]
    dual_A_row3 = inv_Amap[Register(0)]

    inv_Bmap = inv(Bmap)
    dual_B_row0 = inv_Bmap[SIMD(3)]
    dual_B_row1 = inv_Bmap[SIMD(4)]
    dual_B_row2 = inv_Bmap[Thread(0)]
    dual_B_row3 = inv_Bmap[Thread(1)]
    dual_B_col0 = inv_Bmap[Thread(2)]
    dual_B_col1 = inv_Bmap[Thread(3)]
    dual_B_col2 = inv_Bmap[Thread(4)]
    dual_B_col3 = inv_Bmap[Register(0)]

    inv_Cmap = inv(Cmap)
    dual_C_col0 = inv_Cmap[Register(0)]
    dual_C_col1 = inv_Cmap[Thread(0)]
    dual_C_col2 = inv_Cmap[Thread(1)]
    dual_C_col3 = inv_Cmap[Register(2)]
    dual_C_row0 = inv_Cmap[Thread(2)]
    dual_C_row1 = inv_Cmap[Thread(3)]
    dual_C_row2 = inv_Cmap[Thread(4)]
    dual_C_row3 = inv_Cmap[Register(1)]

    @assert dual_C_row0 == dual_A_row0
    @assert dual_C_row1 == dual_A_row1
    @assert dual_C_row2 == dual_A_row2
    @assert dual_C_row3 == dual_A_row3

    @assert dual_A_col0 == dual_B_row0
    @assert dual_A_col1 == dual_B_row1
    @assert dual_A_col2 == dual_B_row2
    @assert dual_A_col3 == dual_B_row3

    code = quote
        A_frag = ($([:($(Symbol(A, :_, i)).val) for i in 0:1]...),)::NTuple{2,UInt32}
        B_frag = ($([:($(Symbol(B, :_, i)).val) for i in 0:1]...),)::NTuple{2,UInt32}
        C_frag = ($([Symbol(C, :_, i) for i in 0:7]...),)::NTuple{8,Int32}
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        ($([Symbol(D, :_, i) for i in 0:7]...),) = D_frag
    end

    push!(steps, Step("WMMA::mma 16x16x16", Variable[A => Amap, B => Bmap, C => Cmap], Variable[D => Dmap], code))
    return nothing
end

end
