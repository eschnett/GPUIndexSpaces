using CUDA
using GPUIndexSpaces

################################################################################

allsteps = quote
    wmma(:a, :b, :c, :d, Mapping(Dict()))
end

################################################################################

@eval function runsteps(A_mem, B_mem, D_mem)
    # $(code(allsteps))
    $(wmma(:a, :b, :c, :d, Mapping(Dict())))
    return nothing
end

function runcuda()
    A_mem = Int32[i for i in 1:(2 * 32)]
    B_mem = Int32[i + 128 for i in 1:(2 * 32)]
    A_mem = CuArray(A_mem)
    B_mem = CuArray(B_mem)
    D_mem = CuArray{Int32}(undef, 8 * 32)
    @cuda blocks = 1 threads = (32, 1) runsteps(A_mem, B_mem, D_mem)
    synchronize()
    D_mem = Array(D_mem)
    println(D_mem .% UInt32)
    return nothing
end

# @device_code_warntype
# @device_code_llvm
# @device_code_ptx
# @device_code_sass
@device_code_sass runcuda()
