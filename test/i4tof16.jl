using BenchmarkTools
using CUDA
using GPUIndexSpaces
using Random

function go(A, B)
    t = (threadIdx().x - 1) % UInt32
    w = (threadIdx().y - 1) % UInt32

    # Read input
    @inbounds A0 = A[(t + UInt32(32) * w) + 1]

    B0 = Float16x2(0.0f0, 0.0f0)
    B1 = Float16x2(0.0f0, 0.0f0)
    B2 = Float16x2(0.0f0, 0.0f0)
    B3 = Float16x2(0.0f0, 0.0f0)
    # B0 = Float16x2(0.0f0, 4.0f0)
    # B1 = Float16x2(1.0f0, 5.0f0)
    # B2 = Float16x2(2.0f0, 6.0f0)
    # B3 = Float16x2(3.0f0, 7.0f0)

    for iter in Int32(0):Int32(1 << 24 - 1)
        offset = (iter % UInt32) * 0xf9cdbcbb

        # Modify input
        A0 = Int4x8(A0.val + offset)
        i01234567 = A0

        if true

            # Switch to offset encoding
            # COST: 0.5 int
            i01234567 = i01234567 ⊻ Int4x8(0x88888888)

            # Extract high 4 bits
            # We don't extract the low bits. Instead, we subtract f16 numbers
            # below. This trades int for fp operations, and might be slightly
            # faster since it reduces the length of the dependency chain of
            # operations.
            # COST: 0.5 int
            i1357 = i01234567 & Int4x8(0xf0f0f0f0)

            # Extract low and high bytes, and insert f16 exponent
            makefp = Float16x2(1536.0f0, 1536.0f0)
            # f01 = 1536 + 16 * (i1 + 8) + (i0 + 8)
            # f1  = 1536 + 16 * (i1 + 8)
            # COST: 4 * 0.5 int
            f0145 = Float16x2(cuda_prmt(i01234567.val, makefp.val, 0x7250))
            f2367 = Float16x2(cuda_prmt(i01234567.val, makefp.val, 0x7351))
            f15 = Float16x2(cuda_prmt(i1357.val, makefp.val, 0x7250))
            f37 = Float16x2(cuda_prmt(i1357.val, makefp.val, 0x7351))

            # COST: 6 * 0.25 fp
            f04 = f0145 - f15 + Float16x2(-8.0f0, -8.0f0)
            f26 = f2367 - f37 + Float16x2(-8.0f0, -8.0f0)
            f15 = muladd(Float16x2(1.0f0 / 16, 1.0f0 / 16), f15, Float16x2(-1536.0f0 / 16 - 8.0f0, -1536.0f0 / 16 - 8.0f0))
            f37 = muladd(Float16x2(1.0f0 / 16, 1.0f0 / 16), f37, Float16x2(-1536.0f0 / 16 - 8.0f0, -1536.0f0 / 16 - 8.0f0))

            # TOTAL COST: 3 int + 1.5 fp ≤ 4.5 cycles
            # (assuming 1 warp can use 1 SM fully)
            # MEASURED: 3.5 cycles + overhead
            # BENCHMARK HARNESS OVERHEAD: 2.25 cycles

        else
            f04 = Float16x2(i01234567.val)
            f26 = Float16x2(i01234567.val)
            f15 = Float16x2(i01234567.val)
            f37 = Float16x2(i01234567.val)
        end

        B0 += f04
        B1 += f26
        B2 += f15
        B3 += f37
    end

    # Write output
    @inbounds B[(t + UInt32(32) * (w + UInt32(32) * UInt32(0))) + 1] = B0
    @inbounds B[(t + UInt32(32) * (w + UInt32(32) * UInt32(1))) + 1] = B1
    @inbounds B[(t + UInt32(32) * (w + UInt32(32) * UInt32(2))) + 1] = B2
    @inbounds B[(t + UInt32(32) * (w + UInt32(32) * UInt32(3))) + 1] = B3

    return nothing
end

function runcuda()
    Random.seed!(100)

    nthreads = 32
    nwarps = 32
    nblocks = 1

    A = Array{Int4x8}(undef, nthreads * nwarps * nblocks * 2)
    for n in eachindex(A)
        A[n] = Int4x8(
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
            rand((-Int32(7)):Int32(7)),
        )
    end
    B = Array{Float16x2}(undef, 4 * nthreads * nwarps * nblocks * 2)
    for n in eachindex(B)
        B[n] = Float16x2(0.0f0, 0.0f0)
    end
    A = CuArray(A)
    B = CuArray(B)

    kernel = @cuda launch = false blocks_per_sm = 1 maxregs = 65536 ÷ (nthreads * nwarps) go(A, B)
    kernel(A, B; threads=(nthreads, nwarps), blocks=nblocks)
    synchronize()
    CUDA.@time kernel(A, B; threads=(nthreads, nwarps), blocks=nblocks)
    # @btime CUDA.@sync $(kernel(A, B; threads=(nthreads, nwarps), blocks=nblocks))

    # A = Array(A)
    # B = Array(B)
    # Δ = nthreads * nwarps * nblocks
    # for n in 1:(nthreads * nwarps * nblocks)
    #     a = convert(NTuple{8,Int32}, A[n])
    #     b0 = convert(NTuple{2,Float32}, B[n + 0 * Δ])
    #     b1 = convert(NTuple{2,Float32}, B[n + 1 * Δ])
    #     b2 = convert(NTuple{2,Float32}, B[n + 2 * Δ])
    #     b3 = convert(NTuple{2,Float32}, B[n + 3 * Δ])
    #     b = (b0[1], b1[1], b2[1], b3[1], b0[2], b1[2], b2[2], b3[2])
    #     if !(a == b)
    #         @show n A[n] B[n + 0Δ] B[n + 1Δ] B[n + 2Δ] B[n + 3Δ] a b0 b1 b2 b3 b
    #     end
    #     @assert b == a
    # end
end

if CUDA.functional()
    # @device_code_lowered runcuda()
    # @device_code_typed runcuda()
    # @device_code_warntype runcuda()
    # @device_code_llvm runcuda()
    # @device_code_ptx runcuda()
    @device_code_sass runcuda()
    # @device_code runcuda()
    # runcuda()
end
