using CUDA
using GPUIndexSpaces
using Random

function runsteps(int8s, int16s, int32s, int8s_16, int8s_32)
    @inbounds begin
        i = threadIdx().x - 1
        int8 = int8s[i + 1]::Int8x4
        int16a, int16b = convert(NTuple{2,Int16x2}, int8)
        int16s[2 * i + 0 + 1] = int16a
        int16s[2 * i + 1 + 1] = int16b
        int32a, int32b, int32c, int32d = convert(NTuple{4,Int32}, int8)
        int32s[4 * i + 0 + 1] = int32a
        int32s[4 * i + 1 + 1] = int32b
        int32s[4 * i + 2 + 1] = int32c
        int32s[4 * i + 3 + 1] = int32d
        int8s_16[i + 1] = convert(Int8x4, (int16a, int16b))
        int8s_32[i + 1] = convert(Int8x4, (int32a, int32b, int32c, int32d))
    end
    return nothing
end

function runcuda()
    n = 256
    Random.seed!(100)
    int8s = Int8x4.(rand(UInt32, n))
    int8s = CuArray(int8s)
    int16s = CuArray{Int16x2}(undef, 2 * n)
    int32s = CuArray{Int32}(undef, 4 * n)
    int8s_16 = CuArray{Int8x4}(undef, n)
    int8s_32 = CuArray{Int8x4}(undef, n)
    @cuda blocks = 1 threads = (n,) runsteps(int8s, int16s, int32s, int8s_16, int8s_32)
    synchronize()
    int8s = Array(int8s)
    int16s = Array(int16s)
    int32s = Array(int32s)
    int8s_16 = Array(int8s_16)
    int8s_32 = Array(int8s_32)
    for i in 0:(n - 1)
        println(
            i,
            " ",
            int8s[i + 1],
            " ",
            int16s[2 * i + 0 + 1],
            " ",
            int16s[2 * i + 1 + 1],
            " ",
            string(int32s[4 * i + 0 + 1] % UInt32; base=16, pad=8),
            " ",
            string(int32s[4 * i + 1 + 1] % UInt32; base=16, pad=8),
            " ",
            string(int32s[4 * i + 0 + 2] % UInt32; base=16, pad=8),
            " ",
            string(int32s[4 * i + 1 + 3] % UInt32; base=16, pad=8),
            " ",
            int8s_16[i + 1],
            " ",
            int8s_32[i + 1],
        )
        @assert int8s_16[i + 1] == int8s[i + 1]
        @assert int8s_32[i + 1] == int8s[i + 1]
    end
    return nothing
end

if CUDA.functional()
    # @device_code_lowered runcuda()
    # @device_code_typed runcuda()
    # @device_code_warntype runcuda()
    # @device_code_llvm runcuda()
    # @device_code_ptx runcuda()
    # @device_code_sass runcuda()
    # @device_code runcuda()
    runcuda()
end
