using CUDA
using GPUIndexSpaces
using Random

function runsteps(int16s, int32s, int16s_32)
    @inbounds begin
        i = threadIdx().x - 1
        int16 = int16s[i + 1]::Int16x2
        int32a, int32b = convert(NTuple{2,Int32}, int16)
        int32s[2 * i + 0 + 1] = int32a
        int32s[2 * i + 1 + 1] = int32b
        int16s_32[i + 1] = convert(Int16x2, (int32a, int32b))
    end
    return nothing
end

function runcuda()
    n = 256
    Random.seed!(100)
    int16s = Int16x2.(rand(UInt32, n))
    int16s = CuArray(int16s)
    int32s = CuArray{Int32}(undef, 2 * n)
    int16s_32 = CuArray{Int16x2}(undef, n)
    @cuda blocks = 1 threads = (n,) runsteps(int16s, int32s, int16s_32)
    synchronize()
    int16s = Array(int16s)
    int32s = Array(int32s)
    int16s_32 = Array(int16s_32)
    for i in 0:(n - 1)
        println(
            i,
            " ",
            int16s[i + 1],
            " ",
            string(int32s[2 * i + 0 + 1] % UInt32; base=16, pad=8),
            " ",
            string(int32s[2 * i + 1 + 1] % UInt32; base=16, pad=8),
            " ",
            int16s_32[i + 1],
        )
        @assert int16s_32[i + 1] == int16s[i + 1]
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
