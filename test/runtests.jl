using GPUIndexSpaces
using Random
using Test

make_int4(x::Integer) = ((x + 8) & 0xf - 8) % Int8

@testset "Int4x2" begin
    # Test exhaustively
    for xlo in (-Int32(8)):(+Int32(7)),
        xhi in (-Int32(8)):(+Int32(7)),
        ylo in (-Int32(8)):(+Int32(7)),
        yhi in (-Int32(8)):(+Int32(7))

        x = Int4x2(xlo, xhi)
        y = Int4x2(ylo, yhi)

        @test convert(NTuple{2,Int32}, x) == (xlo, xhi)
        @test convert(NTuple{2,Int8}, x) == (xlo, xhi)

        @test string(x) == string((xlo, xhi))

        @test convert(NTuple{2,Int32}, Int4x2(x.val & 0x0f)) == (xlo, 0)
        @test convert(NTuple{2,Int32}, Int4x2(x.val & 0xf0)) == (0, xhi)

        @test convert(NTuple{2,Int32}, zero(Int4x2)) == (0, 0)

        @test convert(NTuple{2,Int32}, ~x) == (~xlo, ~xhi)
        @test convert(NTuple{2,Int32}, -x) == make_int4.((-xlo, -xhi))

        @test convert(NTuple{2,Int32}, x & y) == (xlo & ylo, xhi & yhi)
        @test convert(NTuple{2,Int32}, x | y) == (xlo | ylo, xhi | yhi)
        @test convert(NTuple{2,Int32}, x ⊻ y) == (xlo ⊻ ylo, xhi ⊻ yhi)
        @test convert(NTuple{2,Int32}, x + y) == make_int4.((xlo + ylo, xhi + yhi))
        @test convert(NTuple{2,Int32}, x - y) == make_int4.((xlo - ylo, xhi - yhi))
        @test convert(NTuple{2,Int32}, min(x, y)) == make_int4.((min(xlo, ylo), min(xhi, yhi)))
        @test convert(NTuple{2,Int32}, max(x, y)) == make_int4.((max(xlo, ylo), max(xhi, yhi)))
    end
end

Random.seed!(0)
@testset "Int4x8" begin
    for iter in 1:100000
        n = zero(Int4x8)
        xs = tuple(rand((-Int32(8)):(+Int32(7)), 8)...)
        ys = tuple(rand((-Int32(8)):(+Int32(7)), 8)...)
        x = Int4x8(xs...)
        y = Int4x8(ys...)

        @test convert(NTuple{8,Int32}, x) == xs
        @test convert(NTuple{2,Int8x4}, x) == (Int8x4(xs[1], xs[3], xs[5], xs[7]), Int8x4(xs[2], xs[4], xs[6], xs[8]))

        @test string(x) == string(xs)

        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x0000000f)) == (xs[1], 0, 0, 0, 0, 0, 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x000000f0)) == (0, xs[2], 0, 0, 0, 0, 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x00000f00)) == (0, 0, xs[3], 0, 0, 0, 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x0000f000)) == (0, 0, 0, xs[4], 0, 0, 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x000f0000)) == (0, 0, 0, 0, xs[5], 0, 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x00f00000)) == (0, 0, 0, 0, 0, xs[6], 0, 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0x0f000000)) == (0, 0, 0, 0, 0, 0, xs[7], 0)
        @test convert(NTuple{8,Int32}, Int4x8(x.val & 0xf0000000)) == (0, 0, 0, 0, 0, 0, 0, xs[8])

        @test convert(NTuple{8,Int32}, zero(Int4x8)) == (0, 0, 0, 0, 0, 0, 0, 0)

        @test convert(NTuple{8,Int32}, ~x) == .~xs
        @test convert(NTuple{8,Int32}, -x) == make_int4.(.-xs)

        @test convert(NTuple{8,Int32}, x & y) == xs .& ys
        @test convert(NTuple{8,Int32}, x | y) == xs .| ys
        @test convert(NTuple{8,Int32}, x ⊻ y) == xs .⊻ ys
        @test convert(NTuple{8,Int32}, x + y) == make_int4.(xs .+ ys)
        @test convert(NTuple{8,Int32}, x - y) == make_int4.(xs .- ys)
        @test convert(NTuple{8,Int32}, min(x, y)) == make_int4.(min.(xs, ys))
        @test convert(NTuple{8,Int32}, max(x, y)) == make_int4.(max.(xs, ys))
    end
end

Random.seed!(0)
@testset "Int8x4" begin
    for iter in 1:100000
        n = zero(Int8x4)
        xs = tuple(Int32.(rand(Int8, 4))...)
        ys = tuple(Int32.(rand(Int8, 4))...)
        x = Int8x4(xs...)
        y = Int8x4(ys...)

        @test convert(NTuple{4,Int32}, x) == xs
        @test convert(NTuple{2,Int16x2}, x) == (Int16x2(xs[1], xs[3]), Int16x2(xs[2], xs[4]))

        @test string(x) == string(xs)

        @test convert(NTuple{4,Int32}, Int8x4(x.val & 0x000000ff)) == (xs[1], 0, 0, 0)
        @test convert(NTuple{4,Int32}, Int8x4(x.val & 0x0000ff00)) == (0, xs[2], 0, 0)
        @test convert(NTuple{4,Int32}, Int8x4(x.val & 0x00ff0000)) == (0, 0, xs[3], 0)
        @test convert(NTuple{4,Int32}, Int8x4(x.val & 0xff000000)) == (0, 0, 0, xs[4])

        @test convert(NTuple{4,Int32}, zero(Int8x4)) == (0, 0, 0, 0)

        @test convert(NTuple{4,Int32}, ~x) == .~xs
        @test convert(NTuple{4,Int32}, -x) == .-xs .% Int8

        @test convert(NTuple{4,Int32}, x & y) == xs .& ys
        @test convert(NTuple{4,Int32}, x | y) == xs .| ys
        @test convert(NTuple{4,Int32}, x ⊻ y) == xs .⊻ ys
        @test convert(NTuple{4,Int32}, x + y) == (xs .+ ys) .% Int8
        @test convert(NTuple{4,Int32}, x - y) == (xs .- ys) .% Int8
        @test convert(NTuple{4,Int32}, min(x, y)) == min.(xs, ys) .% Int8
        @test convert(NTuple{4,Int32}, max(x, y)) == max.(xs, ys) .% Int8
    end
end

Random.seed!(0)
@testset "Int16x2" begin
    for iter in 1:100000
        n = zero(Int16x2)
        xs = tuple(Int32.(rand(Int16, 2))...)
        ys = tuple(Int32.(rand(Int16, 2))...)
        x = Int16x2(xs...)
        y = Int16x2(ys...)

        @test convert(NTuple{2,Int32}, x) == xs

        @test string(x) == string(xs)

        @test convert(NTuple{2,Int32}, Int16x2(x.val & 0x0000ffff)) == (xs[1], 0)
        @test convert(NTuple{2,Int32}, Int16x2(x.val & 0xffff0000)) == (0, xs[2])

        @test convert(NTuple{2,Int32}, zero(Int16x2)) == (0, 0)

        @test convert(NTuple{2,Int32}, ~x) == .~xs
        @test convert(NTuple{2,Int32}, -x) == .-xs .% Int16

        @test convert(NTuple{2,Int32}, x & y) == xs .& ys
        @test convert(NTuple{2,Int32}, x | y) == xs .| ys
        @test convert(NTuple{2,Int32}, x ⊻ y) == xs .⊻ ys
        @test convert(NTuple{2,Int32}, x + y) == (xs .+ ys) .% Int16
        @test convert(NTuple{2,Int32}, x - y) == (xs .- ys) .% Int16
        @test convert(NTuple{2,Int32}, min(x, y)) == min.(xs, ys) .% Int16
        @test convert(NTuple{2,Int32}, max(x, y)) == max.(xs, ys) .% Int16
    end
end

Random.seed!(0)
@testset "Int32" begin
    for iter in 1:100000
        n = zero(Int32)
        x = rand(Int32)
        y = rand(Int32)

        @test add_sat(x, y) == Int64(x) + Int64(y) ||
            Int64(x) + Int64(y) < typemin(Int32) && add_sat(x, y) == typemin(Int32) ||
            Int64(x) + Int64(y) > typemax(Int32) && add_sat(x, y) == typemax(Int32)
    end
end

Random.seed!(0)
@testset "Float16x2" begin
    for iter in 1:100000
        n = zero(Float16x2)
        xs = tuple(Float32.(rand(Float16, 2))...)
        ys = tuple(Float32.(rand(Float16, 2))...)
        zs = tuple(Float32.(rand(Float16, 2))...)
        x = Float16x2(xs...)
        y = Float16x2(ys...)
        z = Float16x2(zs...)

        @test convert(NTuple{2,Float32}, x) == xs

        @test string(x) == string(xs)

        @test convert(NTuple{2,Float32}, Float16x2(x.val & 0x0000ffff)) == (xs[1], 0)
        @test convert(NTuple{2,Float32}, Float16x2(x.val & 0xffff0000)) == (0, xs[2])

        @test convert(NTuple{2,Float32}, zero(Float16x2)) == (0, 0)

        @test convert(NTuple{2,Float32}, abs(x)) == abs.(xs)
        @test convert(NTuple{2,Float32}, -x) == .-xs

        @test [convert(NTuple{2,Float32}, x + y)...] ≈ [(xs .+ ys)...] atol = eps(Float16)
        @test [convert(NTuple{2,Float32}, x - y)...] ≈ [(xs .- ys)...] atol = eps(Float16)
        @test [convert(NTuple{2,Float32}, x * y)...] ≈ [(xs .* ys)...] atol = eps(Float16)
        @test [convert(NTuple{2,Float32}, muladd(x, y, z))...] ≈ [muladd.(xs, ys, zs)...] atol = eps(Float16)
    end
end

# TODO: Test BFloat16
