using CUDA
using GPUIndexSpaces

function runsteps(mem)
    mem[4] = bitmerge(mem[1], mem[2], mem[3])
    return nothing
end

function runcuda()
    mem = UInt32[1, 2, 3, 0]
    mem = CuArray(mem)
    @cuda blocks = 1 threads = (32, 1) runsteps(mem)
    synchronize()
    mem = Array(mem)
    println(mem)
    return nothing
end

if CUDA.functional()
    # @device_code_warntype
    # @device_code_llvm
    # @device_code_ptx
    # @device_code_sass
    @device_code_sass runcuda()
end
