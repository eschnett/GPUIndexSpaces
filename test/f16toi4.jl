using BenchmarkTools
using CUDA
using GPUIndexSpaces
using Random

function go(A, B, Z)
    t = (threadIdx().x - 1) % UInt32
    w = (threadIdx().y - 1) % UInt32

    # Read input
    @inbounds A0 = A[(t + UInt32(32) * (w + UInt32(32) * UInt32(0))) + 1]
    @inbounds A1 = A[(t + UInt32(32) * (w + UInt32(32) * UInt32(1))) + 1]
    @inbounds A2 = A[(t + UInt32(32) * (w + UInt32(32) * UInt32(2))) + 1]
    @inbounds A3 = A[(t + UInt32(32) * (w + UInt32(32) * UInt32(3))) + 1]

    B0 = Int4x8(Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0))
    # B0 = Int4x8(Int32(0), Int32(1), Int32(2), Int32(3), Int32(4), Int32(5), Int32(6), Int32(7))

    for iter in Int32(0):Int32(1 << 24 - 1)
        # Modify input
        @inbounds A0 = A0 + Z[]
        @inbounds A1 = A1 + Z[]
        @inbounds A2 = A2 + Z[]
        @inbounds A3 = A3 + Z[]

        f01 = A0
        f23 = A1
        f45 = A2
        f67 = A3

        if true
            # # Clamp
            # # COST: 8 * 0.5 fp
            # f01 = max(f01, Float16x2(-7.0f0, -7.0f0))
            # f23 = max(f23, Float16x2(-7.0f0, -7.0f0))
            # f45 = max(f45, Float16x2(-7.0f0, -7.0f0))
            # f67 = max(f67, Float16x2(-7.0f0, -7.0f0))
            # f01 = min(f01, Float16x2(+7.0f0, +7.0f0))
            # f23 = min(f23, Float16x2(+7.0f0, +7.0f0))
            # f45 = min(f45, Float16x2(+7.0f0, +7.0f0))
            # f67 = min(f67, Float16x2(+7.0f0, +7.0f0))
            # 
            # # Switch to offset encoding
            # # COST: 4 * 0.25 fp
            # f01 = Float16x2(8.0f0, 8.0f0) + f01
            # f23 = Float16x2(8.0f0, 8.0f0) + f23
            # f45 = Float16x2(8.0f0, 8.0f0) + f45
            # f67 = Float16x2(8.0f0, 8.0f0) + f67

            # Clamp (and scale)
            # COST: 4 * 0.25 fp
            f01 = muladd_sat(Float16x2(1.0f0 / 14, 1.0f0 / 14), f01, Float16x2(7.0f0 / 14, 7.0f0 / 14))
            f23 = muladd_sat(Float16x2(1.0f0 / 14, 1.0f0 / 14), f23, Float16x2(7.0f0 / 14, 7.0f0 / 14))
            f45 = muladd_sat(Float16x2(1.0f0 / 14, 1.0f0 / 14), f45, Float16x2(7.0f0 / 14, 7.0f0 / 14))
            f67 = muladd_sat(Float16x2(1.0f0 / 14, 1.0f0 / 14), f67, Float16x2(7.0f0 / 14, 7.0f0 / 14))

            # Switch to offset encoding (and unscale)
            # COST: 4 * 0.25 fp
            f01 = muladd(Float16x2(14.0f0, 14.0f0), f01, Float16x2(1.0f0, 1.0f0) + Float16x2(1536.0f0, 1536.0f0))
            f23 = muladd(
                Float16x2(16 * 14.0f0, 16 * 14.0f0),
                f23,
                Float16x2(16 * 1.0f0, 16 * 1.0f0) + Float16x2(16 * 1536.0f0, 16 * 1536.0f0),
            )
            f45 = muladd(Float16x2(14.0f0, 14.0f0), f45, Float16x2(1.0f0, 1.0f0) + Float16x2(1536.0f0, 1536.0f0))
            f67 = muladd(
                Float16x2(16 * 14.0f0, 16 * 14.0f0),
                f67,
                Float16x2(16 * 1.0f0, 16 * 1.0f0) + Float16x2(16 * 1536.0f0, 16 * 1536.0f0),
            )

            # Add offset to round to integer
            # # TODO: Combine with the above
            # f01 = f01 + Float16x2(1536.0f0, 1536.0f0)
            # f23 = f23 + Float16x2(16 * 1536.0f0, 16 * 1536.0f0)
            # f45 = f45 + Float16x2(1536.0f0, 1536.0f0)
            # f67 = f67 + Float16x2(16 * 1536.0f0, 16 * 1536.0f0)

            # Combine 4-bit values
            # COST: 4 * 0.25 fp
            f23 = f23 - Float16x2(16 * 1536.0f0, 16 * 1536.0f0)
            f67 = f67 - Float16x2(16 * 1536.0f0, 16 * 1536.0f0)
            f0123 = f23 + f01
            f4567 = f67 + f45

            # Extract integers
            # COST: 0
            i0123 = Int4x8(f0123.val)
            i4567 = Int4x8(f4567.val)

            # Combine bytes
            # COST: 0.5 int
            i01234567 = Int4x8(cuda_prmt(i0123.val, i4567.val, 0x6420))

            # Undo offset encoding
            # COST: 0.5 int
            i01234567 = i01234567 ⊻ Int4x8(0x88888888)

            # TOTAL COST: 1 int + 3 fp ≤ 4 cycles
            # (assuming 1 warp can use 1 SM fully)
            # MEASURED: 6.5 cycles + overhead
            # BENCHMARK HARNESS OVERHEAD: 2.0 cycles

        else
            i01234567 = Int4x8(f01.val + f23.val + f45.val + f67.val)
        end

        B0 = unsafe_add(B0, i01234567)
    end

    # Write output
    @inbounds B[(t + UInt32(32) * (w + UInt32(32) * UInt32(0))) + 1] = B0

    return nothing
end

function runcuda()
    Random.seed!(100)

    nthreads = 32
    nwarps = 32
    nblocks = 1

    A = Array{Float16x2}(undef, 4 * nthreads * nwarps * nblocks * 2)
    for n in eachindex(A)
        A[n] = Float16x2(
            # Avoid testing values ending in 0.5 since we might round
            # differently in this case
            Float32(rand(-88:88)) / 11,
            Float32(rand(-88:88)) / 11,
        )
    end
    B = Array{Int4x8}(undef, nthreads * nwarps * nblocks * 2)
    for n in eachindex(B)
        B[n] = Int4x8(Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0), Int32(0))
    end
    Z = fill(Float16x2(0.0f0, 0.0f0))
    A = CuArray(A)
    B = CuArray(B)
    Z = CuArray(Z)

    kernel = @cuda launch = false blocks_per_sm = 1 maxregs = 65536 ÷ (nthreads * nwarps) go(A, B, Z)
    kernel(A, B, Z; threads=(nthreads, nwarps), blocks=nblocks)
    synchronize()
    CUDA.@time kernel(A, B, Z; threads=(nthreads, nwarps), blocks=nblocks)
    # @btime CUDA.@sync $(kernel(A, B; threads=(nthreads, nwarps), blocks=nblocks))

    # A = Array(A)
    # B = Array(B)
    # Δ = nthreads * nwarps * nblocks
    # for n in 1:(nthreads * nwarps * nblocks)
    #     a0 = convert(NTuple{2,Float32}, A[n + 0 * Δ])
    #     a1 = convert(NTuple{2,Float32}, A[n + 1 * Δ])
    #     a2 = convert(NTuple{2,Float32}, A[n + 2 * Δ])
    #     a3 = convert(NTuple{2,Float32}, A[n + 3 * Δ])
    #     a = (a0[1], a1[1], a0[2], a1[2], a2[1], a3[1], a2[2], a3[2])
    #     a = map(x -> round(clamp(x, -7, 7)), a)
    #     b = convert(NTuple{8,Int32}, B[n])
    #     if !(a == b)
    #         @show n A[n + 0Δ] A[n + 1Δ] A[n + 2Δ] A[n + 3Δ] B[n] a0 a1 a2 a3 a b
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
