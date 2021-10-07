using CUDA
using GPUIndexSpaces

################################################################################

beam_bits = 7                   # only 96 beams
complex_bits = 1
dish_bits = 9
frequency_bits = 4              # per GPU
polarization_bits = 1
time_bits = 15                  # per chunk

const Beam = Index{:Beam}
const Complex = Index{:Complex}
const Dish = Index{:Dish}
const Frequency = Index{:Frequency}
const Polarization = Index{:Polarization}
const Time = Index{:Time}

const Dish′ = Index{:Dish′}

const dish_to_dish′ = Mapping{Index,Index}(Dict([Dish(0) => Dish′(6)
                                                 Dish(1) => Dish′(7)
                                                 Dish(2) => Dish′(0)
                                                 Dish(3) => Dish′(1)
                                                 Dish(4) => Dish′(2)
                                                 Dish(5) => Dish′(3)
                                                 Dish(6) => Dish′(4)
                                                 Dish(7) => Dish′(5)
                                                 Dish(8) => Dish′(8)]))

# Layout of A in global memory (original, now unusedd)
const map_A_global = Layout(Dict([Complex(0) => SIMD(4)
                                  Dish(0) => SIMD(3)
                                  Dish(1) => SIMD(2)
                                  Dish(2) => Memory(0)
                                  Dish(3) => Memory(1)
                                  Dish(4) => Memory(2)
                                  Dish(5) => Memory(3)
                                  Dish(6) => Memory(4)
                                  Dish(7) => Memory(5)
                                  Dish(8) => Memory(6)
                                  Beam(0) => Memory(7)
                                  Beam(1) => Memory(8)
                                  Beam(2) => Memory(9)
                                  Beam(3) => Memory(10)
                                  Beam(4) => Memory(11)
                                  Beam(5) => Memory(12)
                                  Beam(6) => Memory(13)
                                  Frequency(0) => Memory(14)
                                  Frequency(1) => Memory(15)
                                  Frequency(2) => Memory(16)
                                  Frequency(3) => Memory(17)]))

# Layout of A in global memory (improved; rearranged on CPU)
const map_A2_global = Layout(Dict([Dish′(0) => SIMD(4)
                                   Dish′(1) => SIMD(3)
                                   Dish′(2) => SIMD(2)
                                   Dish′(3) => Memory(0)
                                   Dish′(4) => Memory(1)
                                   Dish′(5) => Memory(2)
                                   Dish′(6) => Memory(3)
                                   Dish′(7) => Memory(4)
                                   Dish′(8) => Memory(5)
                                   Complex(0) => Memory(6)
                                   Beam(0) => Memory(7)
                                   Beam(1) => Memory(8)
                                   Beam(2) => Memory(9)
                                   Beam(3) => Memory(10)
                                   Beam(4) => Memory(11)
                                   Beam(5) => Memory(12)
                                   Beam(6) => Memory(13)
                                   Frequency(0) => Memory(14)
                                   Frequency(1) => Memory(15)
                                   Frequency(2) => Memory(16)
                                   Frequency(3) => Memory(17)]))

# Layout of A in registers
const map_A_registers = Layout(Dict([Dish′(0) => SIMD(4)
                                     Dish′(1) => SIMD(3)
                                     Dish′(2) => SIMD(2)
                                     Dish′(3) => Thread(0)
                                     Dish′(4) => Thread(1)
                                     Dish′(5) => Register(0)
                                     Dish′(6) => Warp(0)
                                     Dish′(7) => Warp(1)
                                     Dish′(8) => Warp(2)
                                     Beam(0) => Thread(2)
                                     Beam(1) => Thread(3)
                                     Beam(2) => Thread(4)
                                     Beam(3) => Warp(3)
                                     Beam(4) => Warp(4)
                                     Beam(5) => Register(1)
                                     Beam(6) => Register(2)
                                     Complex(0) => Register(3)]))

# Layout of E in global memory
const map_E_global = Layout(Dict([Complex(0) => SIMD(4)
                                  Polarization(0) => SIMD(3)
                                  Dish(0) => SIMD(2)
                                  Dish(1) => Memory(0)
                                  Dish(2) => Memory(1)
                                  Dish(3) => Memory(2)
                                  Dish(4) => Memory(3)
                                  Dish(5) => Memory(4)
                                  Dish(6) => Memory(5)
                                  Dish(7) => Memory(6)
                                  Dish(8) => Memory(7)
                                  Frequency(0) => Memory(8)
                                  Frequency(1) => Memory(9)
                                  Frequency(2) => Memory(10)
                                  Frequency(3) => Memory(11)
                                  Time(0) => Memory(12)
                                  Time(1) => Memory(13)
                                  Time(2) => Memory(14)
                                  Time(3) => Memory(15)
                                  Time(4) => Memory(16)
                                  Time(5) => Memory(17)
                                  Time(6) => Memory(18)
                                  Time(7) => Memory(19)
                                  Time(8) => Memory(20)
                                  Time(9) => Memory(21)
                                  Time(10) => Memory(22)
                                  Time(11) => Memory(23)
                                  Time(12) => Memory(24)
                                  Time(13) => Memory(25)
                                  Time(14) => Memory(26)]))

# Layout of E in registers
const map_E_registers = Layout(Dict([Complex(0) => SIMD(4)
                                     Polarization(0) => SIMD(3)
                                     Dish(0) => SIMD(2)
                                     Dish(1) => Thread(0)
                                     Dish(2) => Thread(1)
                                     Dish(3) => Thread(2)
                                     Dish(4) => Thread(3)
                                     Dish(5) => Thread(4)
                                     Dish(6) => Register(0)
                                     Dish(7) => Register(1)
                                     Dish(8) => Warp(0)
                                     Time(0) => Warp(1)
                                     Time(1) => Warp(2)
                                     Time(2) => Warp(3)
                                     Time(3) => Warp(4)]))

# Layout of E in shared memory
const map_E_shared = Layout(Dict([Dish(6) => SIMD(4)
                                  Dish(7) => SIMD(3)
                                  Dish(0) => SIMD(2)
                                  Dish(1) => Memory(0)
                                  Dish(2) => Memory(1)
                                  Dish(3) => Memory(2)
                                  Dish(4) => Memory(3)
                                  Dish(5) => Memory(4)
                                  Dish(8) => Memory(5)
                                  Polarization(0) => Memory(6)
                                  Time(0) => Memory(7)
                                  Time(1) => Memory(8)
                                  Time(2) => Memory(9)
                                  Time(3) => Memory(10)
                                  Complex(0) => Memory(11)]))

################################################################################

# steps = AbstractStep[]
# env = Environment()
# 
# load!(steps, env, :A_reg, map_A_registers, :A_mem, map_A2_global)
# apply!(steps, env, :A_reg′, :A_reg, expr -> :($expr + Int32(1)))
# store!(steps, env, :A_reg′, :A_mem, map_A2_global)
# 
# allsteps = Seq(steps)
# println(allsteps)

################################################################################

steps = AbstractStep[]
env = Environment()

load!(steps, env, :E_reg, map_E_registers, :E_mem, map_E_global)
permute!(steps, env, :E_reg′, :E_reg, Register(0), SIMD(4))
permute!(steps, env, :E_reg″, :E_reg′, Register(1), SIMD(3))
store!(steps, env, :E_reg″, :E_shared, map_E_shared)

allsteps = Seq(steps)
println(allsteps)

################################################################################

# # matrix A: A  m-by-k row-major [m * stride + k]
# # matrix B: E  k-by-n col-major [n * stride + k]
# # matrix C: Ju m-by-n
# # m=8 (beams)   n=8 (times)   k=32 (dishes)
# 
# step_load_A = load(:A_mem, :A_reg, map_A2_global, map_A_registers)
# print(step_load_A)
# 
# step_load_E = load(:E_shared, :E_reg, map_E_shared, map_E_registers)
# print(step_load_E)
# 
# step_constant_Ju_re_pos = constant(:Ju_re_pos_reg, map_Ju_registers, :(Int32(0)))
# step_constant_Ju_re_neg = constant(:Ju_re_neg_reg, map_Ju_registers, :(Int32(0)))
# step_constant_Ju_im_pos = constant(:Ju_im_pos_reg, map_Ju_registers, :(Int32(0)))
# 
# # Note: 4-bit WMMA operations are not implemented in CUDA.jl; abandoning this experiment here

################################################################################

@eval function runsteps(A_mem, E_mem, E_shared)
    $(code(allsteps))
    return nothing
end

function runcuda()
    A_nelts = 2^18
    E_nelts = 2^12
    A_mem = CuArray(rand(Int32, A_nelts))
    E_mem = CuArray(rand(Int32, A_nelts))
    E_shared = CuArray{Int32}(undef, E_nelts)
    @cuda blocks = 64 threads = (32, 32) runsteps(A_mem, E_mem, E_shared)
    synchronize()
    E_mem = Array(E_mem)
    E_shared = Array(E_shared)
    println(E_mem[1:16] .% UInt32)
    println(E_mem[(end - 15):end] .% UInt32)
    println(E_shared[1:16] .% UInt32)
    println(E_shared[(end - 15):end] .% UInt32)
    return nothing
end

# @device_code_warntype
# @device_code_llvm
# @device_code_ptx
# @device_code_sass
@device_code_sass runcuda()
