using CUDA
using GPUIndexSpaces
using Random

function runsteps(int4s, int8s, int4s_8)
    @inbounds begin
        i = threadIdx().x - 1
        int4 = int4s[i + 1]::Int4x8
        int8a, int8b = convert(NTuple{2,Int8x4}, int4)
        int8s[2 * i + 0 + 1] = int8a
        int8s[2 * i + 1 + 1] = int8b
        int4_8 = convert(Int4x8, (int8a, int8b))
        int4s_8[i + 1] = int4_8
    end
    return nothing
end

function runcuda()
    n = 256
    Random.seed!(100)
    int4s = Int4x8.(rand(UInt32, n))
    int4s = CuArray(int4s)
    int8s = CuArray{Int8x4}(undef, 2 * n)
    int4s_8 = CuArray{Int4x8}(undef, n)
    @cuda blocks = 1 threads = (n,) runsteps(int4s, int8s, int4s_8)
    synchronize()
    int4s = Array(int4s)
    int8s = Array(int8s)
    int4s_8 = Array(int4s_8)
    for i in 0:(n - 1)
        println(i, " ", int4s[i + 1], " ", int8s[2 * i + 0 + 1], " ", int8s[2 * i + 1 + 1], " ", int4s_8[i + 1])
        @assert int4s_8[i + 1] == int4s[i + 1]
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
