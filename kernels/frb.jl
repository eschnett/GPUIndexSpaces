using BenchmarkTools
using CUDA
using GPUIndexSpaces
using Random

################################################################################

Base.div(x::Complex{<:Integer}, y::Integer) = Complex(div(real(x), y), div(imag(x), y))

################################################################################

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Polr = Index{:Polr}       # 1 bit
const Dish = Index{:Dish}       # 9 bits
const DishI = Index{:DishI}     # 5 bits (only 4 during FT)
const DishJ = Index{:DishJ}     # 5 bits (only 4 during FT)
const Freq = Index{:Freq}       # 8 bits here (0 bits used)
const Time = Index{:Time}       # 15 bits here (3 bits used)
const BeamI = Index{:BeamI}     # 7 bits (using 4 during FT, 1 via FFT, 2 via loop)
const BeamJ = Index{:BeamJ}     # 7 bits (using 4 during FT, 1 via FFT, 2 via loop)
const PlMi = Index{:PlMi}       # 1 bit (0:+, 1:-)

################################################################################

# Layout of E in global memory
# One time sample corresponds to 1.7 μs

# KS estimates that processing this data set with 2^15 time samples
# and 2^4 frequencies should take 27% of an A40, i.e. 15 ms when
# running across all 84 SMs. It should thus take 79 ms for 84
# frequencies. Current state for 84 frequencies is 113 ms.

# Current state for 84 frequencies is 91 ms.

# 2022-03-09:
# -    8 frequencies: 0.081697 seconds (519 CPU allocations: 34.766 KiB)
# -   84 frequencies: 0.081796 seconds (519 CPU allocations: 34.766 KiB)
# - 2*84 frequencies: 0.162504 seconds (71 CPU allocations: 4.516 KiB)
# - 3*84 frequencies: 0.243574 seconds (71 CPU allocations: 4.516 KiB)

# Missing optimizations:
# - shared memory layout for E, use only 24 warps
# - store A in shared memory
# - store fI in registers
# - check for bank conflicts
# - (use integer math after second FT)

const F = Cint(16)              # Frequencies
# const F = Cint(84)              # Frequencies
# const F = Cint(2 * 84)          # Frequencies
# const F = Cint(3 * 84)          # Frequencies
const K = Cint(256)             # Time loop iterations
const M = Cint(3)               # BeamI loop iterations
const N = Cint(3)               # BeamJ loop iterations
#TODO const F = Cint(1)               # Frequencies
#TODO const K = Cint(1)               # Time loop iterations
#TODO const M = Cint(1)               # BeamI loop iterations
#TODO const N = Cint(1)               # BeamJ loop iterations

const map_E_global = let
    m = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Polr(0) => SIMD(3),
            Dish(0) => SIMD(4),
            Dish(1) => Memory(m += 1),
            Dish(2) => Memory(m += 1),
            Dish(3) => Memory(m += 1),
            Dish(4) => Memory(m += 1),
            Dish(5) => Memory(m += 1),
            Dish(6) => Memory(m += 1),
            Dish(7) => Memory(m += 1),
            Dish(8) => Memory(m += 1),
            Freq(0) => Memory(m += 1),
            Freq(1) => Memory(m += 1),
            Freq(2) => Memory(m += 1),
            Freq(3) => Memory(m += 1),
            Freq(4) => Memory(m += 1),
            Freq(5) => Memory(m += 1),
            Freq(6) => Memory(m += 1),
            Freq(7) => Memory(m += 1),
            Time(0) => Memory(m += 1),
            Time(1) => Memory(m += 1),
            Time(2) => Memory(m += 1),
            Time(3) => Memory(m += 1),
            Time(4) => Memory(m += 1),
            Time(5) => Memory(m += 1),
            Time(6) => Memory(m += 1),
            Time(7) => Memory(m += 1),
            Time(8) => Memory(m += 1),
            Time(9) => Memory(m += 1),
            Time(10) => Memory(m += 1),
            Time(11) => Memory(m += 1),
            Time(12) => Memory(m += 1),
            Time(13) => Memory(m += 1),
            Time(14) => Memory(m += 1),
        ),
    )
end

# Layout of fI in registers
const map_fI_registers = Layout(
    Float32,
    Dict(
        BeamI(0) => Warp(0),
        BeamI(1) => Warp(1),
        BeamI(2) => Warp(2),
        BeamI(3) => Warp(3),
        BeamI(4) => Warp(4),
        BeamI(5) => Loop1(0),
        BeamI(6) => Loop1(1),
        BeamJ(0) => Thread(2),
        BeamJ(1) => Thread(3),
        BeamJ(2) => Thread(4),
        BeamJ(3) => Thread(0),
        BeamJ(4) => Thread(1),
        BeamJ(5) => Loop2(0),
        BeamJ(6) => Loop2(1),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

# Layout of fI in global memory
const map_fI_memory = let
    m = 13
    Layout(
        Float32,
        Dict(
            BeamI(0) => Memory(5 + 0),
            BeamI(1) => Memory(5 + 1),
            BeamI(2) => Memory(5 + 2),
            BeamI(3) => Memory(5 + 3),
            BeamI(4) => Memory(5 + 4),
            BeamI(5) => Memory(10 + 2),
            BeamI(6) => Memory(10 + 3),
            BeamJ(0) => Memory(0 + 2),
            BeamJ(1) => Memory(0 + 3),
            BeamJ(2) => Memory(0 + 4),
            BeamJ(3) => Memory(0 + 0),
            BeamJ(4) => Memory(0 + 1),
            BeamJ(5) => Memory(10 + 0),
            BeamJ(6) => Memory(10 + 1),
            Freq(0) => Memory(m += 1),
            Freq(1) => Memory(m += 1),
            Freq(2) => Memory(m += 1),
            Freq(3) => Memory(m += 1),
            Freq(4) => Memory(m += 1),
            Freq(5) => Memory(m += 1),
            Freq(6) => Memory(m += 1),
            Freq(7) => Memory(m += 1),
            Time(7) => Memory(m += 1),
            Time(8) => Memory(m += 1),
            Time(9) => Memory(m += 1),
            Time(10) => Memory(m += 1),
            Time(11) => Memory(m += 1),
            Time(12) => Memory(m += 1),
            Time(13) => Memory(m += 1),
            Time(14) => Memory(m += 1),
        ),
    )
end

# Layout of E in registers; see (48)
const map_E_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Polr(0) => SIMD(3),
        Dish(0) => SIMD(4),
        Dish(1) => Thread(0),
        Dish(2) => Thread(1),
        Dish(3) => Thread(2),
        Dish(4) => Thread(3),
        Dish(5) => Thread(4),
        Dish(6) => Warp(0),
        Dish(7) => Warp(1),
        Dish(8) => Warp(2),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(0) => Register(0),
        Time(1) => Warp(3),
        Time(2) => Warp(4),
        Time(3) => Loop3(0),
        Time(4) => Loop3(1),
        Time(5) => Loop3(2),
        Time(6) => Loop3(3),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

const map_K_memory = Layout(
    Int32,
    Dict(
        Dish(0) => SIMD(4),
        Dish(1) => Memory(0),
        Dish(2) => Memory(1),
        Dish(3) => Memory(2),
        Dish(4) => Memory(3),
        Dish(5) => Memory(4),
        Dish(6) => Memory(5),
        Dish(7) => Memory(6),
        Dish(8) => Memory(7),
    ),
)
const map_K_registers = Layout(
    Int32,
    Dict(
        Dish(0) => SIMD(4),
        Dish(1) => Thread(0),
        Dish(2) => Thread(1),
        Dish(3) => Thread(2),
        Dish(4) => Thread(3),
        Dish(5) => Thread(4),
        Dish(6) => Warp(0),
        Dish(7) => Warp(1),
        Dish(8) => Warp(2),
    ),
)

# Layout of E in shared memory see (49)
const E_shared_size = (5, 32, 32)
const map_E_shared = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Polr(0) => SIMD(3),
        DishJ(0) => Memory2(0),
        DishJ(1) => Memory2(1),
        DishJ(2) => Memory2(2),
        DishJ(3) => Memory2(3),
        DishJ(4) => Memory2(4),
        DishI(0) => Memory3(0),
        DishI(1) => Memory3(1),
        DishI(2) => Memory3(2),
        DishI(3) => Memory3(3),
        DishI(4) => Memory3(4),
        Freq(0) => Ignore(0),
        Freq(1) => Ignore(1),
        Freq(2) => Ignore(2),
        Freq(3) => Ignore(3),
        Freq(4) => Ignore(4),
        Freq(5) => Ignore(5),
        Freq(6) => Ignore(6),
        Freq(7) => Ignore(7),
        Time(0) => SIMD(4),
        Time(1) => Memory(0),
        Time(2) => Memory(1),
        Time(3) => Ignore(8),
        Time(4) => Ignore(9),
        Time(5) => Ignore(10),
        Time(6) => Ignore(11),
        Time(7) => Ignore(12),
        Time(8) => Ignore(13),
        Time(9) => Ignore(14),
        Time(10) => Ignore(15),
        Time(11) => Ignore(16),
        Time(12) => Ignore(17),
        Time(13) => Ignore(18),
        Time(14) => Ignore(19),
    ),
)

# Layout of E to access the shared memory, see (56)
const map_E′_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Polr(0) => SIMD(3),
        DishJ(0) => Thread(2),
        DishJ(1) => Thread(3),
        DishJ(2) => Warp(2),
        DishJ(3) => Warp(3),
        DishJ(4) => Warp(4),
        DishI(0) => Register(0),
        DishI(1) => Thread(4),
        DishI(2) => Thread(0),
        DishI(3) => Thread(1),
        DishI(4) => Register(1),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(0) => SIMD(4),
        Time(1) => Warp(0),
        Time(2) => Warp(1),
        Time(3) => Loop3(0),
        Time(4) => Loop3(1),
        Time(5) => Loop3(2),
        Time(6) => Loop3(3),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

# Layout of Gin in registers see (60)
const map_Gin_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => Register(2),
        Polr(0) => Thread(4),
        DishJ(0) => Thread(2),
        DishJ(1) => Thread(3),
        DishJ(2) => Warp(2),
        DishJ(3) => Warp(3),
        DishJ(4) => Warp(4),
        DishI(0) => SIMD(3),
        DishI(1) => SIMD(4),
        DishI(2) => Thread(0),
        DishI(3) => Thread(1),
        DishI(4) => Register(1),
    ),
)
# Layout of Gin in memory
const map_Gin_memory = Layout(
    Int32,
    Dict(
        Cplx(0) => Memory(5),
        Polr(0) => Memory(4),
        DishJ(0) => Memory(2),
        DishJ(1) => Memory(3),
        DishJ(2) => Memory(7),
        DishJ(3) => Memory(8),
        DishJ(4) => Memory(9),
        DishI(0) => SIMD(3),
        DishI(1) => SIMD(4),
        DishI(2) => Memory(0),
        DishI(3) => Memory(1),
        DishI(4) => Memory(6),
    ),
)

# Layout of 1d N-S FT transformation matrix
const map_Ans_registers = Layout(
    Int32,
    Dict(
        DishI(0) => SIMD(3),
        DishI(1) => SIMD(4),
        DishI(2) => Thread(0),
        DishI(3) => Thread(1),
        BeamI(0) => Thread(2),
        BeamI(1) => Thread(3),
        BeamI(2) => Thread(4),
        BeamI(3) => Register(0),
        # BeamI(4) => Ignore(0),
        BeamI(5) => Loop1(0),
        BeamI(6) => Loop1(1),
        Cplx(0) => Register(1),
    ),
)
const map_Ans_memory = Layout(
    Int32,
    Dict(
        DishI(0) => SIMD(3),
        DishI(1) => SIMD(4),
        DishI(2) => Memory(0),
        DishI(3) => Memory(1),
        BeamI(0) => Memory(2),
        BeamI(1) => Memory(3),
        BeamI(2) => Memory(4),
        BeamI(3) => Memory(5),
        # BeamI(4) => Ignore(0),
        BeamI(5) => Memory(7),
        BeamI(6) => Memory(8),
        Cplx(0) => Memory(6),
    ),
)

# Layout of C in first 1d Fourier transform in registers ([m,n])
const map_Fpre_registers = Layout(
    Int32,
    Dict(
        Polr(0) => Thread(1),
        BeamI(0) => Thread(2),
        BeamI(1) => Thread(3),
        BeamI(2) => Thread(4),
        BeamI(3) => Register(1),
        # BeamI(4) => Ignore(0),
        BeamI(5) => Loop1(0),
        BeamI(6) => Loop1(1),
        DishJ(0) => Register(0),
        DishJ(1) => Register(2),
        DishJ(2) => Warp(2),
        DishJ(3) => Warp(3),
        DishJ(4) => Warp(4),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(0) => Thread(0),
        Time(1) => Warp(0),
        Time(2) => Warp(1),
        Time(3) => Loop3(0),
        Time(4) => Loop3(1),
        Time(5) => Loop3(2),
        Time(6) => Loop3(3),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

# Layout of F̃ in shared memory
const F̃_shared_size = (8, M * 32 * 16, 2)
const map_F̃_shared = Layout(
    Int32,
    Dict(
        Cplx(0) => Memory3(0 + 0),
        Polr(0) => Memory2(0 + 0),
        BeamI(0) => Memory2(4 + 0),
        BeamI(1) => Memory2(4 + 1),
        BeamI(2) => Memory2(4 + 2),
        BeamI(3) => Memory2(4 + 3),
        BeamI(4) => Memory2(4 + 4),
        BeamI(5) => Memory2(4 + 5),
        BeamI(6) => Memory2(4 + 6),
        DishJ(0) => SIMD(3),
        DishJ(1) => SIMD(4),
        DishJ(2) => Memory(0),
        DishJ(3) => Memory(1),
        DishJ(4) => Memory(2),
        Freq(0) => Ignore(0),
        Freq(1) => Ignore(1),
        Freq(2) => Ignore(2),
        Freq(3) => Ignore(3),
        Freq(4) => Ignore(4),
        Freq(5) => Ignore(5),
        Freq(6) => Ignore(6),
        Freq(7) => Ignore(7),
        Time(0) => Memory2(0 + 1),
        Time(1) => Memory2(0 + 2),
        Time(2) => Memory2(0 + 3),
        Time(3) => Ignore(8),
        Time(4) => Ignore(9),
        Time(5) => Ignore(10),
        Time(6) => Ignore(11),
        Time(7) => Ignore(12),
        Time(8) => Ignore(13),
        Time(9) => Ignore(14),
        Time(10) => Ignore(15),
        Time(11) => Ignore(16),
        Time(12) => Ignore(17),
        Time(13) => Ignore(18),
        Time(14) => Ignore(19),
    ),
)

# Layout of F̃ in registers
const map_F̃_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => Register(1),
        Polr(0) => Thread(4),
        BeamI(0) => Warp(0),
        BeamI(1) => Warp(1),
        BeamI(2) => Warp(2),
        BeamI(3) => Warp(3),
        BeamI(4) => Warp(4),
        BeamI(5) => Loop2(0),
        BeamI(6) => Loop2(1),
        DishJ(0) => SIMD(3),
        DishJ(1) => SIMD(4),
        DishJ(2) => Thread(0),
        DishJ(3) => Thread(1),
        DishJ(4) => Register(2),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(0) => Thread(3),
        Time(1) => Thread(2),
        Time(2) => Register(0),
        Time(3) => Loop3(0),
        Time(4) => Loop3(1),
        Time(5) => Loop3(2),
        Time(6) => Loop3(3),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

# Layout of 1d E-W FT transformation matrix
const map_Aew_registers = Layout(
    Int32,
    Dict(
        DishJ(0) => SIMD(3),
        DishJ(1) => SIMD(4),
        DishJ(2) => Thread(0),
        DishJ(3) => Thread(1),
        BeamJ(0) => Thread(2),
        BeamJ(1) => Thread(3),
        BeamJ(2) => Thread(4),
        BeamJ(3) => Register(0),
        # BeamJ(4) => Ignore(0),
        BeamJ(5) => Loop1(0),
        BeamJ(6) => Loop1(1),
        Cplx(0) => Register(1),
    ),
)
const map_Aew_memory = Layout(
    Int32,
    Dict(
        DishJ(0) => SIMD(3),
        DishJ(1) => SIMD(4),
        DishJ(2) => Memory(0),
        DishJ(3) => Memory(1),
        BeamJ(0) => Memory(2),
        BeamJ(1) => Memory(3),
        BeamJ(2) => Memory(4),
        BeamJ(3) => Memory(5),
        # BeamJ(4) => Ignore(0),
        BeamJ(5) => Memory(7),
        BeamJ(6) => Memory(8),
        Cplx(0) => Memory(6),
    ),
)

# Layout of C in second 1d Fourier transform in registers ([m,n])
const map_Jpre_registers = Layout(
    Int32,
    Dict(
        Polr(0) => Thread(1),
        BeamI(0) => Warp(0),
        BeamI(1) => Warp(1),
        BeamI(2) => Warp(2),
        BeamI(3) => Warp(3),
        BeamI(4) => Warp(4),
        BeamI(5) => Loop2(0),
        BeamI(6) => Loop2(1),
        BeamJ(0) => Thread(2),
        BeamJ(1) => Thread(3),
        BeamJ(2) => Thread(4),
        BeamJ(3) => Register(1),
        # BeamJ(4) => Ignore(0),
        BeamJ(5) => Loop1(0),
        BeamJ(6) => Loop1(1),
        Freq(0) => Block(0),
        Freq(1) => Block(1),
        Freq(2) => Block(2),
        Freq(3) => Block(3),
        Freq(4) => Block(4),
        Freq(5) => Block(5),
        Freq(6) => Block(6),
        Freq(7) => Block(7),
        Time(0) => Thread(0),
        Time(1) => Register(0),
        Time(2) => Register(2),
        Time(3) => Loop3(0),
        Time(4) => Loop3(1),
        Time(5) => Loop3(2),
        Time(6) => Loop3(3),
        Time(7) => Loop4(0),
        Time(8) => Loop4(1),
        Time(9) => Loop4(2),
        Time(10) => Loop4(3),
        Time(11) => Loop4(4),
        Time(12) => Loop4(5),
        Time(13) => Loop4(6),
        Time(14) => Loop4(7),
    ),
)

################################################################################

function zero_dishes!(steps::Vector{AbstractStep}, env::Environment)
    constant!(steps, env, :Ezero, map_E′_registers, 0)
    @assert env[:Ezero] == Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Polr(0) => SIMD(3),
            DishJ(0) => Thread(2),
            DishJ(1) => Thread(3),
            DishJ(2) => Warp(2),
            DishJ(3) => Warp(3),
            DishJ(4) => Warp(4),
            DishI(0) => Register(0),
            DishI(1) => Thread(4),
            DishI(2) => Thread(0),
            DishI(3) => Thread(1),
            DishI(4) => Register(1),
            Freq(0) => Block(0),
            Freq(1) => Block(1),
            Freq(2) => Block(2),
            Freq(3) => Block(3),
            Freq(4) => Block(4),
            Freq(5) => Block(5),
            Freq(6) => Block(6),
            Freq(7) => Block(7),
            Time(0) => SIMD(4),
            Time(1) => Warp(0),
            Time(2) => Warp(1),
            Time(3) => Loop3(0),
            Time(4) => Loop3(1),
            Time(5) => Loop3(2),
            Time(6) => Loop3(3),
            Time(7) => Loop4(0),
            Time(8) => Loop4(1),
            Time(9) => Loop4(2),
            Time(10) => Loop4(3),
            Time(11) => Loop4(4),
            Time(12) => Loop4(5),
            Time(13) => Loop4(6),
            Time(14) => Loop4(7),
        ),
    )
    store!(steps, env, :Ezero, :E_shared, map_E_shared)
    return nothing
end

function grid_dishes!(steps::Vector{AbstractStep}, env::Environment)
    load!(steps, env, :E, map_E_registers, :E_mem, map_E_global)
    permute!(steps, env, :E′, :E, Register(0), SIMD(4))
    load!(steps, env, :K, map_K_registers, :K_mem, map_K_memory)
    widen!(steps, env, :Kd, :K, Dish(0) => Register(0))
    split!(steps, env, :Kd0, :Kd1, :Kd, Dish(0))
    split!(steps, env, :E′d0, :E′d1, :E′, Dish(0))
    @assert env[:E′d0] == Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Polr(0) => SIMD(3),
            Dish(1) => Thread(0),
            Dish(2) => Thread(1),
            Dish(3) => Thread(2),
            Dish(4) => Thread(3),
            Dish(5) => Thread(4),
            Dish(6) => Warp(0),
            Dish(7) => Warp(1),
            Dish(8) => Warp(2),
            Freq(0) => Block(0),
            Freq(1) => Block(1),
            Freq(2) => Block(2),
            Freq(3) => Block(3),
            Freq(4) => Block(4),
            Freq(5) => Block(5),
            Freq(6) => Block(6),
            Freq(7) => Block(7),
            Time(0) => SIMD(4),
            Time(1) => Warp(3),
            Time(2) => Warp(4),
            Time(3) => Loop3(0),
            Time(4) => Loop3(1),
            Time(5) => Loop3(2),
            Time(6) => Loop3(3),
            Time(7) => Loop4(0),
            Time(8) => Loop4(1),
            Time(9) => Loop4(2),
            Time(10) => Loop4(3),
            Time(11) => Loop4(4),
            Time(12) => Loop4(5),
            Time(13) => Loop4(6),
            Time(14) => Loop4(7),
        ),
    )
    store!(steps, env, :E′d0, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:(Kd0 * $(Cint(E_shared_size[1]))))
    store!(steps, env, :E′d1, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:(Kd1 * $(Cint(E_shared_size[1]))))
    return nothing
end

function fourier1!(steps::Vector{AbstractStep}, env::Environment)
    # Load E
    load!(steps, env, :E0, map_E′_registers, :E_shared, map_E_shared)

    permute!(steps, env, :E1, :E0, Register(0), SIMD(3))   # (57)
    permute!(steps, env, :E2, :E1, Register(0), Thread(4)) # (58)
    permute!(steps, env, :E3, :E2, Register(0), SIMD(4))   # (59)
    @assert env[:E3] == Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Polr(0) => Thread(4),
            DishI(0) => SIMD(3),
            DishI(1) => SIMD(4),
            DishI(2) => Thread(0),
            DishI(3) => Thread(1),
            DishI(4) => Register(1),
            DishJ(0) => Thread(2),
            DishJ(1) => Thread(3),
            DishJ(2) => Warp(2),
            DishJ(3) => Warp(3),
            DishJ(4) => Warp(4),
            Freq(0) => Block(0),
            Freq(1) => Block(1),
            Freq(2) => Block(2),
            Freq(3) => Block(3),
            Freq(4) => Block(4),
            Freq(5) => Block(5),
            Freq(6) => Block(6),
            Freq(7) => Block(7),
            Time(0) => Register(0),
            Time(1) => Warp(0),
            Time(2) => Warp(1),
            Time(3) => Loop3(0),
            Time(4) => Loop3(1),
            Time(5) => Loop3(2),
            Time(6) => Loop3(3),
            Time(7) => Loop4(0),
            Time(8) => Loop4(1),
            Time(9) => Loop4(2),
            Time(10) => Loop4(3),
            Time(11) => Loop4(4),
            Time(12) => Loop4(5),
            Time(13) => Loop4(6),
            Time(14) => Loop4(7),
        ),
    )
    widen!(steps, env, :E4, :E3, Cplx(0) => Register(2))

    # Load Gin
    load!(steps, env, :Gin0, map_Gin_registers, :Gin_mem, map_Gin_memory)

    # Apply input gains
    # TODO: Use a sparse matrix tensor core multiplication instead
    # TODO: As alternative, keep values as `int8` and multiply two at a time
    # TODO: Investigate dp4a and dp2a
    widen2!(steps, env, :Gin1, :Gin0, SIMD(3) => Register(3), SIMD(4) => Register(4))
    widen2!(steps, env, :E5, :E4, SIMD(3) => Register(3), SIMD(4) => Register(4))
    split!(steps, env, :Ginre, :Ginim, :Gin1, Cplx(0))
    split!(steps, env, :Ere, :Eim, :E5, Cplx(0))
    # TODO: Use dp4a
    apply!(steps, env, :Ẽre, :Ere, :Eim, :Ginre, :Ginim, (Ere, Eim, Gre, Gim) -> :(($Gre * $Ere - $Gim * $Eim) >> 0x04))
    apply!(steps, env, :Ẽim, :Ere, :Eim, :Ginre, :Ginim, (Ere, Eim, Gre, Gim) -> :(($Gre * $Eim + $Gim * $Ere) >> 0x04))
    merge!(steps, env, :Ẽ0, :Ẽre, :Ẽim, Cplx(0) => Register(2))
    narrow2!(steps, env, :Ẽ1, :Ẽ0, Register(3) => SIMD(3), Register(4) => SIMD(4))

    permute!(steps, env, :Ẽ2, :Ẽ1, Register(1), Register(2)) # (63)
    @assert env[:Ẽ2] == Layout(
        Int32,
        Dict(
            Cplx(0) => Register(1),
            Polr(0) => Thread(4),
            DishI(0) => SIMD(3),
            DishI(1) => SIMD(4),
            DishI(2) => Thread(0),
            DishI(3) => Thread(1),
            DishI(4) => Register(2),
            DishJ(0) => Thread(2),
            DishJ(1) => Thread(3),
            DishJ(2) => Warp(2),
            DishJ(3) => Warp(3),
            DishJ(4) => Warp(4),
            Freq(0) => Block(0),
            Freq(1) => Block(1),
            Freq(2) => Block(2),
            Freq(3) => Block(3),
            Freq(4) => Block(4),
            Freq(5) => Block(5),
            Freq(6) => Block(6),
            Freq(7) => Block(7),
            Time(0) => Register(0),
            Time(1) => Warp(0),
            Time(2) => Warp(1),
            Time(3) => Loop3(0),
            Time(4) => Loop3(1),
            Time(5) => Loop3(2),
            Time(6) => Loop3(3),
            Time(7) => Loop4(0),
            Time(8) => Loop4(1),
            Time(9) => Loop4(2),
            Time(10) => Loop4(3),
            Time(11) => Loop4(4),
            Time(12) => Loop4(5),
            Time(13) => Loop4(6),
            Time(14) => Loop4(7),
        ),
    )
    permute!(steps, env, :Ẽ3, :Ẽ2, Register(0), Thread(3)) # (64)

    loop!(steps, env, :loopIdx1, :(Int32(0):Int32(M - 1)), [BeamI(5), BeamI(6)]) do steps, env
        # Load A
        # TODO: Load from shared memory
        load!(steps, env, :Ans, map_Ans_registers, :Ans_mem, map_Ans_memory)

        # Fourier transform
        # fourier!(steps, env, :F, :Ans, :Ẽ3)
        begin
            split!(steps, env, :Ansre, :Ansim, :Ans, Cplx(0))
            addsub!(steps, env, :Epm, :Ẽ3, DishI(4) => PlMi(0))
            split!(steps, env, :Ep, :Em, :Epm, PlMi(0))
            split!(steps, env, :Epre, :Epim, :Ep, Cplx(0))
            split!(steps, env, :Emre, :Emim, :Em, Cplx(0))

            # Y-plus
            constant!(steps, env, :F0pre, map_Fpre_registers, :(Int32(0)))
            wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fpre, :Ansre, :Epre, :F0pre)
            constant!(steps, env, :F0pim, map_Fpre_registers, :(Int32(0)))
            wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fpim, :Ansre, :Epim, :F0pim)

            # Y-minus
            constant!(steps, env, :F0mre, map_Fpre_registers, :(Int32(0)))
            wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fmre′, :Ansim, :Emim, :F0mre)
            apply!(steps, env, :Fmre, :Fmre′, expr -> :(-$expr))
            constant!(steps, env, :F0mim, map_Fpre_registers, :(Int32(0)))
            wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fmim, :Ansim, :Emre, :F0mim)

            # Merge output
            merge!(steps, env, :Fp, :Fpre, :Fpim, Cplx(0) => Register(4))
            merge!(steps, env, :Fm, :Fmre, :Fmim, Cplx(0) => Register(4))
            merge!(steps, env, :Fpm, :Fp, :Fm, PlMi(0) => Register(3))
            addsub!(steps, env, :F, :Fpm, PlMi(0) => BeamI(4))
        end
        # (69)
        @assert env[:F] == Layout(
            Int32,
            Dict(
                Cplx(0) => Register(4),
                Polr(0) => Thread(1),
                BeamI(0) => Thread(2),
                BeamI(1) => Thread(3),
                BeamI(2) => Thread(4),
                BeamI(3) => Register(1),
                BeamI(4) => Register(3),
                BeamI(5) => Loop1(0),
                BeamI(6) => Loop1(1),
                DishJ(0) => Register(0),
                DishJ(1) => Register(2),
                DishJ(2) => Warp(2),
                DishJ(3) => Warp(3),
                DishJ(4) => Warp(4),
                Freq(0) => Block(0),
                Freq(1) => Block(1),
                Freq(2) => Block(2),
                Freq(3) => Block(3),
                Freq(4) => Block(4),
                Freq(5) => Block(5),
                Freq(6) => Block(6),
                Freq(7) => Block(7),
                Time(0) => Thread(0),
                Time(1) => Warp(0),
                Time(2) => Warp(1),
                Time(3) => Loop3(0),
                Time(4) => Loop3(1),
                Time(5) => Loop3(2),
                Time(6) => Loop3(3),
                Time(7) => Loop4(0),
                Time(8) => Loop4(1),
                Time(9) => Loop4(2),
                Time(10) => Loop4(3),
                Time(11) => Loop4(4),
                Time(12) => Loop4(5),
                Time(13) => Loop4(6),
                Time(14) => Loop4(7),
            ),
        )

        # TODO: Fold shift-by-8 into narrowing
        apply!(steps, env, :F̃0, :F, F -> :(max(-Int32(63), min(Int32(63), $F >> 0x08))))
        narrow2!(steps, env, :F̃1, :F̃0, Register(0) => SIMD(3), Register(2) => SIMD(4))
        move!(steps, env, :F̃2, :F̃1, Register(1) => Register(0))
        move!(steps, env, :F̃3, :F̃2, Register(3) => Register(1))
        move!(steps, env, :F̃4, :F̃3, Register(4) => Register(2))
        # (72)
        @assert env[:F̃4] == Layout(
            Int32,
            Dict(
                Cplx(0) => Register(2),
                Polr(0) => Thread(1),
                BeamI(0) => Thread(2),
                BeamI(1) => Thread(3),
                BeamI(2) => Thread(4),
                BeamI(3) => Register(0),
                BeamI(4) => Register(1),
                BeamI(5) => Loop1(0),
                BeamI(6) => Loop1(1),
                DishJ(0) => SIMD(3),
                DishJ(1) => SIMD(4),
                DishJ(2) => Warp(2),
                DishJ(3) => Warp(3),
                DishJ(4) => Warp(4),
                Freq(0) => Block(0),
                Freq(1) => Block(1),
                Freq(2) => Block(2),
                Freq(3) => Block(3),
                Freq(4) => Block(4),
                Freq(5) => Block(5),
                Freq(6) => Block(6),
                Freq(7) => Block(7),
                Time(0) => Thread(0),
                Time(1) => Warp(0),
                Time(2) => Warp(1),
                Time(3) => Loop3(0),
                Time(4) => Loop3(1),
                Time(5) => Loop3(2),
                Time(6) => Loop3(3),
                Time(7) => Loop4(0),
                Time(8) => Loop4(1),
                Time(9) => Loop4(2),
                Time(10) => Loop4(3),
                Time(11) => Loop4(4),
                Time(12) => Loop4(5),
                Time(13) => Loop4(6),
                Time(14) => Loop4(7),
            ),
        )

        # Store F̃
        store!(steps, env, :F̃4, :F̃_shared, map_F̃_shared)
        return nothing
    end

    return nothing
end

function fourier2!(steps::Vector{AbstractStep}, env::Environment)
    loop!(steps, env, :loopIdx2, :(Int32(0):Int32(M - 1)), [BeamI(5), BeamI(6)]) do steps, env

        # Load F̃
        load!(steps, env, :F̃, map_F̃_registers, :F̃_shared, map_F̃_shared)

        loop!(steps, env, :loopIdx1, :(Int32(0):Int32(N - 1)), [BeamJ(5), BeamJ(6)]) do steps, env

            # Load A
            # TODO: Load from shared memory
            load!(steps, env, :Aew, map_Aew_registers, :Aew_mem, map_Aew_memory)

            # Fourier transform
            # fourier!(steps, env, :J, :Aew, :F̃)
            begin
                split!(steps, env, :Aewre, :Aewim, :Aew, Cplx(0))
                addsub!(steps, env, :F̃pm, :F̃, DishJ(4) => PlMi(0))
                split!(steps, env, :F̃p, :F̃m, :F̃pm, PlMi(0))
                split!(steps, env, :F̃pre, :F̃pim, :F̃p, Cplx(0))
                split!(steps, env, :F̃mre, :F̃mim, :F̃m, Cplx(0))

                # Y-plus
                # TODO: Convert half of the results to `Float32` early, the other half late, to use both the FP32 and INT cores?
                # TODO: Convert to half precision. Use a Register for this. Maybe Register(1) because it lives the longest?
                constant!(steps, env, :J0pre, map_Jpre_registers, :(Int32(0)))
                wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jpre, :Aewre, :F̃pre, :J0pre)
                apply!(steps, env, :fJpre, :Jpre, J -> :(Float32($J)); newtype=Float32)
                constant!(steps, env, :J0pim, map_Jpre_registers, :(Int32(0)))
                wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jpim, :Aewre, :F̃pim, :J0pim)
                apply!(steps, env, :fJpim, :Jpim, J -> :(Float32($J)); newtype=Float32)

                # Y-minus
                constant!(steps, env, :J0mre, map_Jpre_registers, :(Int32(0)))
                wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jmre′, :Aewim, :F̃mim, :J0mre)
                # TODO: Fold the negation explicitly into the later `addsub!`
                # apply!(steps, env, :Jmre, :Jmre′, J -> :(-$J))
                apply!(steps, env, :fJmre, :Jmre′, J -> :(-Float32($J)); newtype=Float32)
                constant!(steps, env, :J0mim, map_Jpre_registers, :(Int32(0)))
                wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jmim, :Aewim, :F̃mre, :J0mim)
                apply!(steps, env, :fJmim, :Jmim, J -> :(Float32($J)); newtype=Float32)

                # Merge output
                merge!(steps, env, :fJp, :fJpre, :fJpim, Cplx(0) => Register(4))
                merge!(steps, env, :fJm, :fJmre, :fJmim, Cplx(0) => Register(4))
                merge!(steps, env, :fJpm, :fJp, :fJm, PlMi(0) => Register(3))
                # narrow!(steps, env, :hJpm, :fJpm, Register(1) => SIMD(4))
                addsub!(steps, env, :fJ, :fJpm, PlMi(0) => BeamJ(4))
            end
            # (81)
            @assert env[:fJ] == Layout(
                Float32,
                Dict(
                    Cplx(0) => Register(4),
                    Polr(0) => Thread(1),
                    BeamI(0) => Warp(0),
                    BeamI(1) => Warp(1),
                    BeamI(2) => Warp(2),
                    BeamI(3) => Warp(3),
                    BeamI(4) => Warp(4),
                    BeamI(5) => Loop2(0),
                    BeamI(6) => Loop2(1),
                    BeamJ(0) => Thread(2),
                    BeamJ(1) => Thread(3),
                    BeamJ(2) => Thread(4),
                    BeamJ(3) => Register(1),
                    BeamJ(4) => Register(3),
                    BeamJ(5) => Loop1(0),
                    BeamJ(6) => Loop1(1),
                    Freq(0) => Block(0),
                    Freq(1) => Block(1),
                    Freq(2) => Block(2),
                    Freq(3) => Block(3),
                    Freq(4) => Block(4),
                    Freq(5) => Block(5),
                    Freq(6) => Block(6),
                    Freq(7) => Block(7),
                    Time(0) => Thread(0),
                    Time(1) => Register(0),
                    Time(2) => Register(2),
                    Time(3) => Loop3(0),
                    Time(4) => Loop3(1),
                    Time(5) => Loop3(2),
                    Time(6) => Loop3(3),
                    Time(7) => Loop4(0),
                    Time(8) => Loop4(1),
                    Time(9) => Loop4(2),
                    Time(10) => Loop4(3),
                    Time(11) => Loop4(4),
                    Time(12) => Loop4(5),
                    Time(13) => Loop4(6),
                    Time(14) => Loop4(7),
                ),
            )

            # Calculate intensities
            apply!(steps, env, :fI1, :fJ, J -> :($J * $J))
            split!(steps, env, :fI1a, :fI1b, :fI1, Cplx(0))
            apply!(steps, env, :fI2, :fI1a, :fI1b, (Ja, Jb) -> :($Ja + $Jb))
            split!(steps, env, :fI2a, :fI2b, :fI2, Time(1))
            apply!(steps, env, :fI3, :fI2a, :fI2b, (Ja, Jb) -> :($Ja + $Jb))
            split!(steps, env, :fI3a, :fI3b, :fI3, Time(2))
            apply!(steps, env, :fI4, :fI3a, :fI3b, (Ja, Jb) -> :($Ja + $Jb))
            # (82), but using Register(1) and Register(3)
            @assert env[:fI4] == Layout(
                Float32,
                Dict(
                    Polr(0) => Thread(1),
                    BeamI(0) => Warp(0),
                    BeamI(1) => Warp(1),
                    BeamI(2) => Warp(2),
                    BeamI(3) => Warp(3),
                    BeamI(4) => Warp(4),
                    BeamI(5) => Loop2(0),
                    BeamI(6) => Loop2(1),
                    BeamJ(0) => Thread(2),
                    BeamJ(1) => Thread(3),
                    BeamJ(2) => Thread(4),
                    BeamJ(3) => Register(1),
                    BeamJ(4) => Register(3),
                    BeamJ(5) => Loop1(0),
                    BeamJ(6) => Loop1(1),
                    Freq(0) => Block(0),
                    Freq(1) => Block(1),
                    Freq(2) => Block(2),
                    Freq(3) => Block(3),
                    Freq(4) => Block(4),
                    Freq(5) => Block(5),
                    Freq(6) => Block(6),
                    Freq(7) => Block(7),
                    Time(0) => Thread(0),
                    Time(3) => Loop3(0),
                    Time(4) => Loop3(1),
                    Time(5) => Loop3(2),
                    Time(6) => Loop3(3),
                    Time(7) => Loop4(0),
                    Time(8) => Loop4(1),
                    Time(9) => Loop4(2),
                    Time(10) => Loop4(3),
                    Time(11) => Loop4(4),
                    Time(12) => Loop4(5),
                    Time(13) => Loop4(6),
                    Time(14) => Loop4(7),
                ),
            )
            permute!(steps, env, :fI5, :fI4, Register(3), Thread(1))
            # (83), but using Register(1) and Register(3)
            split!(steps, env, :fI5a, :fI5b, :fI5, Polr(0))
            apply!(steps, env, :fI6, :fI5a, :fI5b, (Ja, Jb) -> :($Ja + $Jb))
            # (84), but using Register(1) and Register(3)
            permute!(steps, env, :fI7, :fI6, Register(1), Thread(0))
            # (85)
            split!(steps, env, :fI7a, :fI7b, :fI7, Time(0))
            apply!(steps, env, :fI8, :fI7a, :fI7b, (Ja, Jb) -> :($Ja + $Jb))
            # (86)
            @assert env[:fI8] == Layout(
                Float32,
                Dict(
                    BeamI(0) => Warp(0),
                    BeamI(1) => Warp(1),
                    BeamI(2) => Warp(2),
                    BeamI(3) => Warp(3),
                    BeamI(4) => Warp(4),
                    BeamI(5) => Loop2(0),
                    BeamI(6) => Loop2(1),
                    BeamJ(0) => Thread(2),
                    BeamJ(1) => Thread(3),
                    BeamJ(2) => Thread(4),
                    BeamJ(3) => Thread(0),
                    BeamJ(4) => Thread(1),
                    BeamJ(5) => Loop1(0),
                    BeamJ(6) => Loop1(1),
                    Freq(0) => Block(0),
                    Freq(1) => Block(1),
                    Freq(2) => Block(2),
                    Freq(3) => Block(3),
                    Freq(4) => Block(4),
                    Freq(5) => Block(5),
                    Freq(6) => Block(6),
                    Freq(7) => Block(7),
                    Time(3) => Loop3(0),
                    Time(4) => Loop3(1),
                    Time(5) => Loop3(2),
                    Time(6) => Loop3(3),
                    Time(7) => Loop4(0),
                    Time(8) => Loop4(1),
                    Time(9) => Loop4(2),
                    Time(10) => Loop4(3),
                    Time(11) => Loop4(4),
                    Time(12) => Loop4(5),
                    Time(13) => Loop4(6),
                    Time(14) => Loop4(7),
                ),
            )

            # Store fI8
            # Ignoring all Loop3 indices
            store!(steps, env, :fI8, :fI_mem, map_fI_memory; operator=:(+=), ignore=Set(Time(t) for t in 3:6))
            return nothing
        end
    end

    return nothing
end

function frb!(steps::Vector{AbstractStep}, env::Environment)
    # zero_dishes!(steps, env)
    loop!(
        steps,
        env,
        :loopIdx4,
        :(Int32(0):Int32(K - 1)),
        [Time(7), Time(8), Time(9), Time(10), Time(11), Time(12), Time(13), Time(14)],
    ) do steps, env
        loop!(steps, env, :loopIdx2, :(Int32(0):Int32(N - 1)), [BeamJ(5), BeamJ(6)]) do steps, env
            loop!(steps, env, :loopIdx1, :(Int32(0):Int32(M - 1)), [BeamI(5), BeamI(6)]) do steps, env
                constant!(steps, env, :fIzero, map_fI_registers, :(Float32(0)))
                store!(steps, env, :fIzero, :fI_mem, map_fI_memory)
                return nothing
            end
        end
        loop!(steps, env, :loopIdx3, :(Int32(0):Int32(15)), [Time(3), Time(4), Time(5), Time(6)]) do steps, env
            zero_dishes!(steps, env)
            grid_dishes!(steps, env)
            sync_threads!(steps, env)
            fourier1!(steps, env)
            sync_threads!(steps, env)
            fourier2!(steps, env)
            return nothing
        end
        return nothing
    end
    return nothing
end

################################################################################

frb_steps = AbstractStep[]
frb_env = Environment()
frb!(frb_steps, frb_env)
frb_allsteps = Seq(frb_steps)
# println(frb_allsteps)

################################################################################

getbit(val, n) = (val >> n) & 1
mergebits(arr) = foldl((x, y) -> 2 * x + y, arr; init=0)
@assert mergebits((1, 0, 1, 1)) == 0b1011
@assert getbit(0b1011, 3) == 1
@assert getbit(0b1011, 2) == 0
@assert getbit(0b1011, 1) == 1
@assert getbit(0b1011, 0) == 1

function Gin_index(c::Integer, p::Integer, di::Integer, dj::Integer)
    @assert 0 ≤ c < 2^1
    @assert 0 ≤ p < 2^1
    @assert 0 ≤ di < 2^5
    @assert 0 ≤ dj < 2^5
    # see map_Gin_memory
    ind = mergebits((
        getbit(dj, 4),
        getbit(dj, 3),
        getbit(dj, 2),
        getbit(di, 4),
        getbit(c, 0),
        getbit(p, 0),
        getbit(dj, 1),
        getbit(dj, 0),
        getbit(di, 3),
        getbit(di, 2),
        getbit(di, 1),
        getbit(di, 0),
    ))
    return ind + 1
end

function Ans_index(c::Integer, di::Integer, bi::Integer)
    @assert 0 ≤ c < 2^1
    @assert 0 ≤ di < 2^5
    @assert 0 ≤ bi < 2^7
    # see map_Ans_memory
    @assert getbit(di, 4) == 0
    @assert getbit(bi, 4) == 0
    ind = mergebits((
        getbit(bi, 6),
        getbit(bi, 5),
        getbit(c, 0),
        # getbit(bi, 4) is not used!
        getbit(bi, 3),
        getbit(bi, 2),
        getbit(bi, 1),
        getbit(bi, 0),
        # getbit(di, 4) is not used!
        getbit(di, 3),
        getbit(di, 2),
        getbit(di, 1),
        getbit(di, 0),
    ))
    return ind + 1
end

function Aew_index(c::Integer, dj::Integer, bj::Integer)
    @assert 0 ≤ c < 2^1
    @assert 0 ≤ dj < 2^5
    @assert 0 ≤ bj < 2^7
    # see map_Aew_memory
    @assert getbit(dj, 4) == 0
    @assert getbit(bj, 4) == 0
    ind = mergebits((
        getbit(bj, 6),
        getbit(bj, 5),
        getbit(c, 0),
        # getbit(bj, 4) is not used!
        getbit(bj, 3),
        getbit(bj, 2),
        getbit(bj, 1),
        getbit(bj, 0),
        # getbit(dj, 4) is not used!
        getbit(dj, 3),
        getbit(dj, 2),
        getbit(dj, 1),
        getbit(dj, 0),
    ))
    return ind + 1
end

function fI_index(bi::Integer, bj::Integer, f::Integer, t::Integer)
    @assert 0 ≤ bi < 2^7
    @assert 0 ≤ bj < 2^7
    @assert 0 ≤ f < 2^8
    @assert 0 ≤ t < 2^15
    # see map_fI_memory
    @assert all(getbit(t, i) == 0 for i in 0:6)
    ind = mergebits((
        getbit(t, 14),
        getbit(t, 13),
        getbit(t, 12),
        getbit(t, 11),
        getbit(t, 10),
        getbit(t, 9),
        getbit(t, 8),
        getbit(t, 7),
        getbit(f, 7),
        getbit(f, 6),
        getbit(f, 5),
        getbit(f, 4),
        getbit(f, 3),
        getbit(f, 2),
        getbit(f, 1),
        getbit(f, 0),
        getbit(bi, 6),
        getbit(bi, 5),
        getbit(bj, 6),
        getbit(bj, 5),
        getbit(bi, 4),
        getbit(bi, 3),
        getbit(bi, 2),
        getbit(bi, 1),
        getbit(bi, 0),
        getbit(bj, 2),
        getbit(bj, 1),
        getbit(bj, 0),
        getbit(bj, 4),
        getbit(bj, 3),
    ))
    return ind + 1
end

################################################################################

const E_shared_length = prod(E_shared_size)
const F̃_shared_length = prod(F̃_shared_size)

const E_shared_offset = 0
# const F̃_shared_offset = E_shared_offset + E_shared_length
const F̃_shared_offset = 0
# const shmem_length = F̃_shared_offset + F̃_shared_length
const shmem_length = max(E_shared_offset + E_shared_length, F̃_shared_offset + F̃_shared_length)

const shmem = sizeof(Int32) * shmem_length

@eval function runsteps(K_mem, E_mem, Gin_mem, Ans_mem, Aew_mem, fI_mem)
    E_shared = @cuDynamicSharedMem(Int4x8, $E_shared_size, $(sizeof(Int32) * E_shared_offset))
    F̃_shared = @cuDynamicSharedMem(Int8x4, $F̃_shared_size, $(sizeof(Int32) * F̃_shared_offset))
    $(code(frb_allsteps))
    return nothing
end

function runcuda()
    Random.seed!(100)
    for iter in 1:1 # 100
        println("Test iteration $iter:")
        println()

        K_input = NTuple{2,Int8}[(0, 0) for i in 0:511]
        for d in 0:511
            d′ = round(Int, d * 1023 / 511)
            dish_i = d′ % 32
            dish_j = d′ ÷ 32
            K_input[d + 1] = (dish_i, dish_j)
        end
        # Polr, Dish, Freq, Time
        E_input = zeros(Int8, 2, 512, 256, 32768)
        nfrequencies = 1 * F
        ntimes = 128 * K
        # Cplx, Polr, DishJ, DishI
        Gin_input = zeros(Int8, 2 * 2 * 32 * 32)
        # Cplx, DishI ÷ 2, BeamI ÷ 2
        Ans_input = zeros(Int8, 2 * (32 ÷ 2) * (128 ÷ 2))
        nbeams_i = M * 32
        # Cplx, DishJ ÷ 2, BeamJ ÷ 2
        Aew_input = zeros(Int8, 2 * (32 ÷ 2) * (128 ÷ 2))
        nbeams_j = N * 32

        # Select path
        polarization = rand(0:1)
        dish = rand(0:511)
        dish_i = rand(0:31)
        dish_j = rand(0:31)
        dish_i &= ~0x0010           # bit 4 must be 0
        dish_j &= ~0x0010           # bit 4 must be 0
        beam_i = rand(0:(nbeams_i - 1))
        beam_j = rand(0:(nbeams_j - 1))
        beam_i &= ~0x0010           # bit 4 must be 0
        beam_j &= ~0x0010           # bit 4 must be 0
        frequency = rand(0:(nfrequencies - 1))
        time = rand(0:(ntimes - 1))

        # Select values
        E_val = 4 + 0im             # 4 bit
        Gin_val = 16 + 0im          # 8 bit
        Ans_val = 64 + 0im          # 8 bit
        Aew_val = 1 + 0im           # 8 bit
        println("nbeams_i,j=$nbeams_i,$nbeams_j   nfrequencies=$nfrequencies   ntimes=$ntimes")
        println(
            "polarization=$polarization   dish=$dish   dish_i,j=$dish_i,$dish_j",
            "   beam_i,j=$beam_i,$beam_j   frequency=$frequency   time=$time",
        )

        # Set one dish
        E_input[polarization + 1, dish + 1, frequency + 1, time + 1] = ((imag(E_val) << 4) & 0xf0) + (real(E_val) & 0x0f)
        dish′ = findfirst(==((dish_i, dish_j)), K_input)
        if dish′ ≢ nothing
            used = falses(32, 32)
            for (di, dj) in K_input
                used[di + 1, dj + 1] = true
            end
            unused = [(di, dj) for di in 0:31, dj in 0:31 if !used[di + 1, dj + 1]]
            dish″ = rand(unused)
            K_input[dish′] = dish″
        end
        dish′ = findfirst(==((dish_i, dish_j)), K_input)
        @assert dish′ ≡ nothing
        K_input[dish + 1] = (dish_i, dish_j)
        Gin_input[Gin_index(0, polarization, dish_i, dish_j)] = real(Gin_val)
        Gin_input[Gin_index(1, polarization, dish_i, dish_j)] = imag(Gin_val)
        Ans_input[Ans_index(0, dish_i, beam_i)] = real(Ans_val)
        Ans_input[Ans_index(1, dish_i, beam_i)] = imag(Ans_val)
        Aew_input[Aew_index(0, dish_j, beam_j)] = real(Aew_val)
        Aew_input[Aew_index(1, dish_j, beam_j)] = imag(Aew_val)

        used = falses(32, 32)
        for (di, dj) in K_input
            @assert 0 ≤ di < 32
            @assert 0 ≤ dj < 32
            @assert !used[di + 1, dj + 1]
            used[di + 1, dj + 1] = true
        end

        @assert all(0 ≤ di < 32 && 0 ≤ dj < 32 for (di, dj) in K_input)
        K_mem = reinterpret(Int16x2, Int16[32 * di + dj for (di, dj) in K_input])
        @assert length(K_mem) == 256
        E_mem = reinterpret(Int4x8, reshape(E_input, :))
        Gin_mem = reinterpret(Int8x4, Gin_input)
        for dj in 0:31, di in 0:31, p in 0:1, c in 0:1
            idx = Gin_index(c, p, di, dj)
            (idx - 1) % 4 ≠ 0 && continue
            val = Gin_mem[(idx - 1) ÷ 4 + 1].val
            if val ≠ 0
                println("c$c p$p di$di dj$dj Gin$(string(val; base=16, pad=8))")
            end
            # vals = convert(NTuple{4,Int32}, Int8x4(val))
            # if val ≠ 0
            #     println("c$c p$p di$di dj$dj Gin$(string(val; base=16, pad=8)) Gin($(vals[1]),$(vals[2]),$(vals[3]),$(vals[4]))")
            # end
        end
        Ans_mem = reinterpret(Int8x4, Ans_input)
        Aew_mem = reinterpret(Int8x4, Aew_input)

        K_mem = CuArray(K_mem)
        E_mem = CuArray(E_mem)
        Gin_mem = CuArray(Gin_mem)
        Ans_mem = CuArray(Ans_mem)
        Aew_mem = CuArray(Aew_mem)
        # noutputs = maxnbeams_i * maxnbeams_j * maxnfrequencies * (ntimes ÷ 128)
        noutputs = 128 * 128 * 256 * K
        fI_mem = CuArray{Float32}(undef, noutputs)

        kernel = @cuda launch = false blocks_per_sm = 1 maxregs = 64 runsteps(K_mem, E_mem, Gin_mem, Ans_mem, Aew_mem, fI_mem)
        attributes(kernel.fun)[CUDA.CU_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES] = shmem

        # # sm_75
        # nblocks = 68
        # @assert shmem ≤ 48 * 1024   # NVIDIA GeForce RTX 2080 Ti has 48 kB shared memory

        # sm_86
        # nblocks = 84
        nblocks = nfrequencies
        @assert shmem ≤ 99 * 1024   # NVIDIA A10 has 99 kB shared memory

        @assert nblocks == nfrequencies

        kernel(K_mem, E_mem, Gin_mem, Ans_mem, Aew_mem, fI_mem; threads=(32, 32), blocks=nblocks, shmem=shmem)
        synchronize()
        # CUDA.@time kernel(K_mem, E_mem, Gin_mem, Ans_mem, Aew_mem, fI_mem; threads=(32, 32), blocks=nblocks, shmem=shmem)
        # @btime CUDA.@sync $(kernel(K_mem, E_mem, Gin_mem, Ans_mem, Aew_mem, fI_mem; threads=(32, 32), blocks=nblocks, shmem=shmem))

        fI_mem = Array(fI_mem)
        println()
        println("Nonzero inputs:")
        E_mem = Array(E_mem)
        for p in 0:1, d in 0:511, f in 0:(nfrequencies - 1), t in 0:(ntimes - 1)
            expected = 0x00
            val = (E_mem[d ÷ 2 + f * 2^8 + t * 2^15 + 1].val >>> (16 * (d % 2) + 8 * (p % 2))) % UInt8
            if val ≠ expected
                @show p d f t val expected
            end
        end
        println()
        println("Nonzero results:")
        println()
        println("fI:")
        count = 0
        for bi in 0:(nbeams_i - 1), bj in 0:(nbeams_j - 1), f in 0:(nfrequencies - 1), t in 0:128:(ntimes - 1)
            expected = 0.0f0
            val = fI_mem[fI_index(bi, bj, f, t)]
            if val ≠ expected
                @show bi bj f t val expected
            end
        end
        println()
        println("Unexpected results:")
        println()
        println("fI:")
        count = 0
        for bi in 0:(nbeams_i - 1), bj in 0:(nbeams_j - 1), f in 0:(nfrequencies - 1), t in 0:128:(ntimes - 1)
            isactive = (bi & ~0x0010) == beam_i && (bj & ~0x0010) == beam_j && f == frequency && t == time - time % 128
            if isactive
                expected = Complex{Int32}(E_val)
                expected *= Gin_val
                expected ÷= 16
                @assert -127 ≤ real(expected) ≤ 127
                @assert -127 ≤ imag(expected) ≤ 127
                expected *= Ans_val
                expected ÷= 256
                expected = Complex(max(-63, min(63, real(expected))), max(-63, min(63, imag(expected))))
                expected *= Aew_val
                expected = Complex{Float32}(expected)
                expected = abs2(expected)
            else
                expected = 0.0f0
            end
            val = fI_mem[fI_index(bi, bj, f, t)]
            if val ≠ expected
                @show bi bj f t isactive val expected
                count += 1
            end
        end
        count ≠ 0 && break
    end                         # iter

    println()
    println("Done.")

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
