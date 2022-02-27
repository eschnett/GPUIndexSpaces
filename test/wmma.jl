using CUDA
using GPUIndexSpaces

################################################################################

const Mm = Index{:Mm}
const Mn = Index{:Mn}
const Mk = Index{:Mk}

# Layout of A in memory ([m,k] row major)
const map_A_memory = Layout(
    Dict(
        [
            Mk(0) => SIMD(4)
            Mk(1) => SIMD(3)
            Mk(2) => Memory(0)
            Mk(3) => Memory(1)
            Mm(0) => Memory(2)
            Mm(1) => Memory(3)
            Mm(2) => Memory(4)
            Mm(3) => Memory(5)
        ],
    ),
)

# Layout of B in memory ([k,n], column major)
const map_B_memory = Layout(
    Dict(
        [
            Mk(0) => SIMD(4)
            Mk(1) => SIMD(3)
            Mk(2) => Memory(0)
            Mk(3) => Memory(1)
            Mn(0) => Memory(2)
            Mn(1) => Memory(3)
            Mn(2) => Memory(4)
            Mn(3) => Memory(5)
        ],
    ),
)

# Layout of D in memory ([m,n], row major]
const map_D_memory = Layout(
    Dict(
        [
            Mn(0) => Memory(0)
            Mn(1) => Memory(1)
            Mn(2) => Memory(2)
            Mn(3) => Memory(3)
            Mm(0) => Memory(4)
            Mm(1) => Memory(5)
            Mm(2) => Memory(6)
            Mm(3) => Memory(7)
        ],
    ),
)

# Layout of A in registers ([m,k])
const map_A_registers = Layout(
    Dict(
        [
            Mk(0) => SIMD(4)
            Mk(1) => SIMD(3)
            Mk(2) => Thread(0)
            Mk(3) => Thread(1)
            Mm(0) => Thread(2)
            Mm(1) => Thread(3)
            Mm(2) => Thread(4)
            Mm(3) => Register(0)
        ],
    ),
)

# Layout of B in registers ([k,n])
const map_B_registers = Layout(
    Dict(
        [
            Mk(0) => SIMD(4)
            Mk(1) => SIMD(3)
            Mk(2) => Thread(0)
            Mk(3) => Thread(1)
            Mn(0) => Thread(2)
            Mn(1) => Thread(3)
            Mn(2) => Thread(4)
            Mn(3) => Register(0)
        ],
    ),
)

# Layout of C in registers ([m,n])
const map_C_registers = Layout(
    Dict(
        [
            Mn(0) => Register(0)
            Mn(1) => Thread(0)
            Mn(2) => Thread(1)
            Mn(3) => Register(2)
            Mm(0) => Thread(2)
            Mm(1) => Thread(3)
            Mm(2) => Thread(4)
            Mm(3) => Register(1)
        ],
    ),
)

################################################################################

steps = AbstractStep[]
env = Environment()

load!(steps, env, :A, map_A_registers, :A_mem, map_A_memory)
load!(steps, env, :B, map_B_registers, :B_mem, map_B_memory)
constant!(steps, env, :C, map_C_registers, :(Int32(0)))
wmma_mma_row_col_m16n16k16_s8!(steps, env, :D, :A, :B, :C)
store!(steps, env, :D, :D_mem, map_D_memory)

allsteps = Seq(steps)
print(allsteps)

################################################################################

@eval function runsteps(A_mem, B_mem, D_mem)
    $(code(allsteps))
    return nothing
end

function runcuda()
    A_mem = Int32[0x01010101 for i in 1:(2 * 32)]
    B_mem = Int32[0x01010101 for i in 1:(2 * 32)]
    println(A_mem .% UInt32)
    println(B_mem .% UInt32)
    A_mem = CuArray(A_mem)
    B_mem = CuArray(B_mem)
    D_mem = CuArray{Int32}(undef, 8 * 32)
    @cuda blocks = 1 threads = (32, 1) runsteps(A_mem, B_mem, D_mem)
    synchronize()
    D_mem = Array(D_mem)
    println(D_mem .% UInt32)
    return nothing
end

if CUDA.functional()
    # @device_code_warntype
    # @device_code_llvm
    # @device_code_ptx
    # @device_code_sass
    @device_code_sass runcuda()
end
