# CHORD 8-bit baseband beamformer
# See <https://www.overleaf.com/project/6228adae742a3a2da1afe437>

using BenchmarkTools
using CUDA
using GPUIndexSpaces
using Random

################################################################################

# Kernel parameters

const T2 = 32768                # number of times
const T1 = 128                  # outer time cadence
@assert T2 % T1 == 0
const B = 96                    # number of beams
const D = 512                   # number of dishes
const F = 16                    # frequency channels per GPU
const Wb = 6                    # A matrix tiling
const Wd = 4                    # A matrix tiling
@assert B % Wb == 0
@assert D % Wd == 0
const W = Wb * Wd               # warps per block
const T = 32                    # chunk size (inner time cadence)
@assert T1 % T == 0
@assert T % 4 == 0

const σ = 3 + round(Int, log2(Wd))

################################################################################

# Define physical indices

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Polr = Index{:Polr}       # 1 bit
const Dish = Index{:Dish}       # 9 bits
const Dish′ = Index{:Dish′}     # 9 bits
const Freq = Index{:Freq}       # 8 bits here
const Time = Index{:Time}       # 15 bits
const Beam = Index{:Beam}       # 7 bits (0...95)

const LoopT2 = Loop1            # outer time loop
const LoopT1 = Loop2
const LoopT = Loop3
const LoopB = Loop4
const LoopD = Loop5
const loopIdxT2 = :loopIdx1
const loopIdxT1 = :loopIdx2
const loopIdxT = :loopIdx3
const loopIdxB = :loopIdx4
const loopIdxD = :loopIdx5

const dish2dish′ = Dict(0 => 0, 1 => 1, 2 => 4, 3 => 5, 4 => 6, 5 => 2, 6 => 3, 7 => 7, 8 => 8)
const dish′2dish = Dict(d′ => d for (d, d′) in dish2dish′)
@assert all(dish′2dish[dish2dish′[d]] == d for d in 0:8)
@assert all(dish2dish′[dish′2dish[d′]] == d′ for d′ in 0:8)

################################################################################

# Define memory layouts

# Electric field array E
const map_E_global = let
    m = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Dish(0) => SIMD(3),
            Dish(1) => SIMD(4),
            Dish(2) => Memory(m += 1),
            Dish(3) => Memory(m += 1),
            Dish(4) => Memory(m += 1),
            Dish(5) => Memory(m += 1),
            Dish(6) => Memory(m += 1),
            Dish(7) => Memory(m += 1),
            Dish(8) => Memory(m += 1),
            Polr(0) => Memory(m += 1),
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

# Section 3, eqn. (13)
const map_E_shared = let
    m = m2 = -1
    b = -1
    i = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Dish(0) => SIMD(3),
            Dish(1) => SIMD(4),
            Dish(2) => Memory(m += 1),
            Dish(3) => Memory(m += 1),
            Dish(4) => Memory(m += 1),
            Dish(5) => Memory(m += 1),
            Dish(6) => Memory(m += 1),
            Dish(7) => Memory(m += 1),
            Dish(8) => Memory(m += 1),
            Polr(0) => Block(b += 1),
            Freq(0) => Block(b += 1),
            Freq(1) => Block(b += 1),
            Freq(2) => Block(b += 1),
            Freq(3) => Block(b += 1),
            Freq(4) => Block(b += 1),
            Freq(5) => Block(b += 1),
            Freq(6) => Block(b += 1),
            Freq(7) => Block(b += 1),
            # TODO: Make padding a compile-time constant, not a run-time choice
            Time(0) => Memory2(m2 += 1),
            Time(1) => Memory2(m2 += 1),
            Time(2) => Memory2(m2 += 1),
            Time(3) => Memory2(m2 += 1),
            Time(4) => Memory2(m2 += 1),
            Time(5) => Ignore(i += 1),
            Time(6) => Ignore(i += 1),
            Time(7) => Ignore(i += 1),
            Time(8) => Ignore(i += 1),
            Time(9) => Ignore(i += 1),
            Time(10) => Ignore(i += 1),
            Time(11) => Ignore(i += 1),
            Time(12) => Ignore(i += 1),
            Time(13) => Ignore(i += 1),
            Time(14) => Ignore(i += 1),
        ),
    )
end

# Defined in section 3
const map_Ecopy_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Dish(0) => SIMD(3),
        Dish(1) => SIMD(4),
        Dish(2) => Register(0),
        Dish(3) => Register(1),
        Dish(4) => Thread(0),
        Dish(5) => Thread(1),
        Dish(6) => Thread(2),
        Dish(7) => Warp(0),
        Dish(8) => Warp(1),
        Time(0) => Thread(3),
        Time(1) => Thread(4),
        Time(2) => Warp(2),
        Time(3) => Warp(3),
        # TODO: With 24 warps, this will not work
        Time(4) => Warp(4),
    ),
)

const map_E_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Dish′(0) => SIMD(3),
        Dish′(1) => SIMD(4),
        Dish′(2) => Thread(0),
        Dish′(3) => Thread(1),
        Dish′(4) => LoopD(0),   # since Wd = 4
        Dish′(5) => LoopD(1),   # since Wd = 4
        Dish′(6) => LoopD(2),   # since Wd = 4
        Dish′(7) => Warp(0),    # since Wd = 4
        Dish′(8) => Warp(1),    # since Wd = 4
        Time(0) => Thread(2),
        Time(1) => Thread(3),
        Time(2) => Thread(4),
        Time(3) => LoopT(0),
        Time(4) => LoopT(1),
    ),
)

# Beamforming matrix A
const map_A_global = let
    m = -1
    Layout(
        Int32,
        Dict(
            # The natural layout
            Cplx(0) => SIMD(3),
            Dish(0) => SIMD(4),
            Dish(1) => Memory(m += 1),
            Dish(2) => Memory(m += 1),
            Dish(3) => Memory(m += 1),
            Dish(4) => Memory(m += 1),
            Dish(5) => Memory(m += 1),
            Dish(6) => Memory(m += 1),
            Dish(7) => Memory(m += 1),
            Dish(8) => Memory(m += 1),
            Beam(0) => Memory(m += 1),
            Beam(1) => Memory(m += 1),
            Beam(2) => Memory(m += 1),
            Beam(3) => Memory(m += 1),
            Beam(4) => Memory(m += 1),
            Beam(5) => Memory(m += 1),
            Beam(6) => Memory(m += 1),
            Polr(0) => Memory(m += 1),
            # The internal layout
            # Cplx(0) => Memory(0 + 0),
            # Dish′(0) => SIMD(3),
            # Dish′(1) => SIMD(4),
            # Dish′(2) => Memory(5 + 0),
            # Dish′(3) => Memory(5 + 1),
            # Dish′(4) => Memory(0 + 1),
            # Dish′(5) => Memory(0 + 2),
            # Dish′(6) => Memory(0 + 3),
            # Dish′(7) => Memory(10 + 0),
            # Dish′(8) => Memory(10 + 1),
            # Beam(0) => Memory(5 + 2),
            # Beam(1) => Memory(5 + 3),
            # Beam(2) => Memory(5 + 4),
            # Beam(3) => Memory(0 + 4),
            # Beam(4) => Memory(10 + 2),
            # Beam(5) => Memory(10 + 3),
            # Beam(6) => Memory(10 + 4),
        ),
    )
end

# Section 4, eqn (17)
const map_A_registers = Layout(
    Int32,
    Dict(
        Cplx(0) => Register(0),
        Dish′(0) => SIMD(3),
        Dish′(1) => SIMD(4),
        Dish′(2) => Thread(0),
        Dish′(3) => Thread(1),
        Dish′(4) => Register(1), # since Wd = 4
        Dish′(5) => Register(2), # since Wd = 4
        Dish′(6) => Register(3), # since Wd = 4
        Dish′(7) => Warp(0),     # since Wd = 4
        Dish′(8) => Warp(1),     # since Wd = 4
        Beam(0) => Thread(2),
        Beam(1) => Thread(3),
        Beam(2) => Thread(4),
        Beam(3) => Register(4), # since Wb = 6
        Beam(4) => Warp(2),     # since Wb = 6
        Beam(5) => Warp(3),     # since Wb = 6
        Beam(6) => Warp(4),     # since Wb = 6
        Polr(0) => Block(0),
    ),
)

# Bit shift parameter
# TODO: How many bits? 4? 8? 32?
const map_s_global = let
    m = -1
    Layout(
        Int32,
        Dict(
            Beam(0) => Memory(m += 1),
            Beam(1) => Memory(m += 1),
            Beam(2) => Memory(m += 1),
            Beam(3) => Memory(m += 1),
            Beam(4) => Memory(m += 1),
            Beam(5) => Memory(m += 1),
            Beam(6) => Memory(m += 1),
            Freq(0) => Memory(m += 1),
            Freq(1) => Memory(m += 1),
            Freq(2) => Memory(m += 1),
            Freq(3) => Memory(m += 1),
            Freq(4) => Memory(m += 1),
            Freq(5) => Memory(m += 1),
            Freq(6) => Memory(m += 1),
            Freq(7) => Memory(m += 1),
            Polr(0) => Memory(m += 1),
        ),
    )
end

# Beamformed electric field
const map_J_global = let
    m = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Time(0) => SIMD(3),
            Time(1) => SIMD(4),
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
            Polr(0) => Memory(m += 1),
            Freq(0) => Memory(m += 1),
            Freq(1) => Memory(m += 1),
            Freq(2) => Memory(m += 1),
            Freq(3) => Memory(m += 1),
            Freq(4) => Memory(m += 1),
            Freq(5) => Memory(m += 1),
            Freq(6) => Memory(m += 1),
            Freq(7) => Memory(m += 1),
            Beam(0) => Memory(m += 1),
            Beam(1) => Memory(m += 1),
            Beam(2) => Memory(m += 1),
            Beam(3) => Memory(m += 1),
            Beam(4) => Memory(m += 1),
            Beam(5) => Memory(m += 1),
            Beam(6) => Memory(m += 1),
        ),
    )
end

const map_Ju_shared = let
    m = m2 = m3 = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(4),
            Beam(0) => Memory(m += 1),
            Beam(1) => Memory(m += 1),
            Beam(2) => Memory(m += 1),
            Beam(3) => Memory(m += 1),
            Beam(4) => Memory(m += 1),
            Beam(5) => Memory(m += 1),
            Beam(6) => Memory(m += 1),
            Time(0) => Memory2(m2 += 1),
            Time(1) => Memory2(m2 += 1),
            Time(2) => Memory2(m2 += 1),
            Time(3) => Memory2(m2 += 1),
            Time(4) => Memory2(m2 += 1),
            Dish(7) => Memory3(m3 += 1),
            Dish(8) => Memory3(m3 += 1),
            Polr(0) => Ignore(0),
        ),
    )
end

################################################################################

function read_A!(steps::Vector{AbstractStep}, env::Environment)
    map_A0_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(3),
            Dish(0) => SIMD(4),
            Dish(1) => Register(0),
            Dish(2) => Register(1),
            Dish(3) => Register(2),
            Dish(4) => Register(3),
            Dish(5) => Thread(0),
            Dish(6) => Thread(1),
            Dish(7) => Warp(0),
            Dish(8) => Warp(1),
            Beam(0) => Thread(2),
            Beam(1) => Thread(3),
            Beam(2) => Thread(4),
            Beam(3) => Register(4),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
            Polr(0) => Block(0),
        ),
    )
    load!(steps, env, :A0, map_A0_registers, :A_mem, map_A_global)
    rename!(steps, env, :A1, :A0, Dict(Dish(d) => Dish′(dish2dish′[d]) for d in 0:8))
    permute!(steps, env, :A2, :A1, Register(0), SIMD(4))
    permute!(steps, env, :A, :A2, Register(0), SIMD(3))
    @assert env[:A] == map_A_registers
    return nothing
end

# Step 1: transferring global memory to shared memory
function copy_E!(steps::Vector{AbstractStep}, env::Environment)
    load!(steps, env, :Ecopy, map_Ecopy_registers, :E_mem, map_E_global)
    store!(steps, env, :Ecopy, :E_shared, map_E_shared)
    sync_threads!(steps, env)
    return nothing
end

# Step 2: matrix multiplication
function multiply!(steps::Vector{AbstractStep}, env::Environment)
    loop!(steps, env, loopIdxT, :(Int32(0):Int32(T ÷ 8 - 1)), [Time(3), Time(4)]) do steps, env
        @assert D ÷ Wd % 16 == 0
        @assert D ÷ Wd ÷ 16 == 8
        loop!(steps, env, loopIdxD, :(Int32(0):Int32(D ÷ Wd ÷ 16 - 1)), [Dish(2), Dish(3), Dish(4)]) do steps, env
            map_E0_registers = Layout(
                Int32,
                Dict(
                    Cplx(0) => SIMD(2),
                    Dish(0) => SIMD(3),
                    Dish(1) => SIMD(4),
                    Dish(2) => LoopD(0), # since Wd = 4
                    Dish(3) => LoopD(1), # since Wd = 4
                    Dish(4) => LoopD(2), # since Wd = 4
                    Dish(5) => Thread(0),
                    Dish(6) => Thread(1),
                    Dish(7) => Warp(0), # since Wd = 4
                    Dish(8) => Warp(1), # since Wd = 4
                    Time(0) => Thread(2),
                    Time(1) => Thread(3),
                    Time(2) => Thread(4),
                    Time(3) => LoopT(0),
                    Time(4) => LoopT(1),
                ),
            )
            load!(steps, env, :E0, map_E0_registers, :E_shared, map_E_shared)
            rename!(steps, env, :E1, :E0, Dict(Dish(d) => Dish′(dish2dish′[d]) for d in 0:8))
            @assert env[:E1] == map_E_registers

            # Section 4, eqn (16)
            map_E2_registers = Layout(
                Int32,
                Dict(
                    Cplx(0) => Register(0),
                    Dish′(0) => SIMD(3),
                    Dish′(1) => SIMD(4),
                    Dish′(2) => Thread(0),
                    Dish′(3) => Thread(1),
                    Dish′(4) => LoopD(0), # since Wd = 4
                    Dish′(5) => LoopD(1), # since Wd = 4
                    Dish′(6) => LoopD(2), # since Wd = 4
                    Dish′(7) => Warp(0),  # since Wd = 4
                    Dish′(8) => Warp(1),  # since Wd = 4
                    Time(0) => Thread(2),
                    Time(1) => Thread(3),
                    Time(2) => Thread(4),
                    Time(3) => LoopT(0),
                    Time(4) => LoopT(1),
                ),
            )
            widen!(steps, env, :E2, :E1, SIMD(2) => Register(0))
            @assert env[:E2] == map_E2_registers

            # select!(steps, env, :A3, :A, Register(1), :($loopIdxD & 0b1 ≠ 0))
            # select!(steps, env, :A4, :A3, Register(2), :($loopIdxD & 0b10 ≠ 0))
            # select!(steps, env, :A5, :A4, Register(3), :($loopIdxD & 0b100 ≠ 0))
            select!(steps, env, :A5, :A, [Register(1), Register(2), Register(3)], :($loopIdxD & 0b111))

            @assert B ÷ Wb % 8 == 0
            @assert B ÷ Wb ÷ 8 == 2
            loop!(steps, env, loopIdxB, :(Int32(0):Int32(D ÷ Wd ÷ 8 - 1)), [Beam(6)]) do steps, env
                # select!(steps, env, :A6, :A5, Register(4), :($loopIdxB & 0b1 ≠ 0))
                select!(steps, env, :A6, :A5, [Register(4)], :($loopIdxB & 0b1))
                split!(steps, env, :Are, :Aim, :A6, Cplx(0))

                split!(steps, env, :E2re, :E2im, :E2, Cplx(0))

                map_Ju_registers = Layout(
                    Int32,
                    Dict(
                        Dish(7) => Warp(0),
                        Dish(8) => Warp(1),
                        Time(0) => Register(0),
                        Time(1) => Thread(0),
                        Time(2) => Thread(1),
                        Time(3) => LoopT(0),
                        Time(4) => LoopT(1),
                        Polr(0) => Block(0),
                        Beam(0) => Thread(2),
                        Beam(1) => Thread(3),
                        Beam(2) => Thread(4),
                        Beam(3) => LoopB(0),    # since Wb = 6
                        Beam(4) => Warp(2),     # since Wb = 6
                        Beam(5) => Warp(3),     # since Wb = 6
                        Beam(6) => Warp(4),     # since Wb = 6
                    ),
                )
                constant!(steps, env, :Ju0, map_Ju_registers, :(Int32(0)))
                mma_row_col_m8n8k16_s8!(steps, env, :Jure1, :Aim, :E2im, :Ju0)
                apply!(steps, env, :Jure2, :Jure1, Jure1 -> :(-$Jure1))
                mma_row_col_m8n8k16_s8!(steps, env, :Jure, :Are, :E2re, :Jure2)
                mma_row_col_m8n8k16_s8!(steps, env, :Juim1, :Are, :E2im, :Ju0)
                mma_row_col_m8n8k16_s8!(steps, env, :Juim, :Aim, :E2re, :Juim1)

                # TODO: Break ties to even?
                apply!(steps, env, :Jure3, :Jure, Jure -> :(($Jure + (Int32(1) << $σ) >> 1) >> $σ))
                apply!(steps, env, :Juim3, :Juim, Juim -> :(($Juim + (Int32(1) << $σ) >> 1) >> $σ))

                merge!(steps, env, :Ju1, :Jure3, :Juim3, Cplx(0) => Register(1))
                narrow!(steps, env, :Ju2, :Ju1, Register(1) => SIMD(4))
                @assert env[:Ju2] == Layout(
                    Int32,
                    Dict(
                        Cplx(0) => SIMD(4),
                        Time(0) => Register(0),
                        Time(1) => Thread(0),
                        Time(2) => Thread(1),
                        Beam(0) => Thread(2),
                        Beam(1) => Thread(3),
                        Beam(2) => Thread(4),
                        Time(3) => LoopT(0),
                        Time(4) => LoopT(1),
                        Beam(3) => LoopB(0),
                        Dish(7) => Warp(0),
                        Dish(8) => Warp(1),
                        Polr(0) => Block(0),
                        Beam(4) => Warp(2),     # since Wb = 6
                        Beam(5) => Warp(3),     # since Wb = 6
                        Beam(6) => Warp(4),     # since Wb = 6
                    ),
                )
                store!(steps, env, :Ju2, :Ju_shared, map_Ju_shared)

                nothing
            end
            nothing
        end
        nothing
    end
    sync_threads!(steps, env)

    return nothing
end

# Step 3: reduce and quantize
function reduce!(steps::Vector{AbstractStep}, env::Environment)
    # Section 5, eqn (22)
    map_Ju3_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(4),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
            Time(0) => Thread(0),
            Time(1) => Thread(1),
            Time(2) => Thread(2),
            Time(3) => Register(3),
            Time(4) => Register(4),
            Dish(7) => Register(0),
            Dish(8) => Register(1),
        ),
    )
    load!(steps, env, :Ju3, map_Ju3_registers, :Ju_shared, map_Ju_shared)
    # TODO: Use a saturating add-and-halve instead?
    widen!(steps, env, :Ju4, :Ju3, SIMD(4) => Register(2))
    split!(steps, env, :Ju4a, :Ju4b, :Ju4, Register(0))
    apply!(steps, env, :Ju5, :Ju4a, :Ju4b, (Ju4a, Ju4b) -> :($Ju4a + $Ju4b))
    split!(steps, env, :Ju5a, :Ju5b, :Ju5, Register(1))
    apply!(steps, env, :J, :Ju5a, :Ju5b, (Ju5a, Ju5b) -> :($Ju5a + $Ju5b))
    # Section 5, eqn. (24)
    map_J_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => Register(2),
            Time(0) => Thread(0),
            Time(1) => Thread(1),
            Time(2) => Thread(2),
            Time(3) => Register(3),
            Time(4) => Register(4),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
        ),
    )
    @assert env[:J] == map_J_registers

    # TODO: Use s_β
    apply!(steps, env, :J2, :J, J -> :(($J + (Int32(1) << (16 - 1 - $σ))) >> (16 - $σ)))

    narrow3!(steps, env, :J3, :J2, Register(2) => SIMD(2), Register(3) => SIMD(3), Register(4) => SIMD(4))
    # Section 5, eqn. (26)
    map_J3_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Time(0) => Thread(0),
            Time(1) => Thread(1),
            Time(2) => Thread(2),
            Time(3) => SIMD(3),
            Time(4) => SIMD(4),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
        ),
    )
    @assert env[:J3] == map_J3_registers

    unselect!(steps, env, :Jper, :J3, [Time(5) => Register(0), Time(6) => Register(1)], :($loopIdxT1 & 0b11))
    # Section 5, eqn. (27), but Time(5:6) replaced by Time(3:4)
    map_Jper_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            # Time(5) => SIMD(3),
            # Time(6) => SIMD(4),
            # Time(3) => Register(3),
            # Time(4) => Register(4),
            Time(0) => Thread(0),
            Time(1) => Thread(1),
            Time(2) => Thread(2),
            Time(3) => SIMD(3),
            Time(4) => SIMD(4),
            Time(5) => Register(0),
            Time(6) => Register(1),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
        ),
    )
    @assert env[:Jper] == map_Jper_registers

    # narrow!(steps, env, :J3, :J2, Register(2) => SIMD(4))
    # map_J3_registers = Layout(
    #     Int32,
    #     Dict(
    #         Cplx(0) => SIMD(4),
    #         Time(0) => Thread(0),
    #         Time(1) => Thread(1),
    #         Time(2) => Thread(2),
    #         Time(3) => Register(3),
    #         Time(4) => Register(4),
    #         Beam(0) => Thread(3),
    #         Beam(1) => Thread(4),
    #         Beam(2) => Warp(0),
    #         Beam(3) => Warp(1),
    #         Beam(4) => Warp(2),
    #         Beam(5) => Warp(3),
    #         Beam(6) => Warp(4),
    #     ),
    # )
    # @assert env[:J3] == map_J3_registers
    # permute!(steps, env, :J4, :J3, Register(4), Thread(2))
    # permute!(steps, env, :J5, :J4, Register(3), Thread(1))
    # permute!(steps, env, :J6, :J5, Register(4), Thread(0))
    # map_J6_registers = Layout(
    #     Int32,
    #     Dict(
    #         Cplx(0) => SIMD(4),
    #         Time(0) => Register(4),
    #         Time(1) => Register(3),
    #         Time(2) => Thread(0),
    #         Time(3) => Thread(1),
    #         Time(4) => Thread(2),
    #         Beam(0) => Thread(3),
    #         Beam(1) => Thread(4),
    #         Beam(2) => Warp(0),
    #         Beam(3) => Warp(1),
    #         Beam(4) => Warp(2),
    #         Beam(5) => Warp(3),
    #         Beam(6) => Warp(4),
    #     ),
    # )
    # @assert env[:J6] == map_J6_registers
    # # TODO: use narrow2! directly, in one go
    # widen!(steps, env, :J7, :J6, SIMD(4) => Register(5))
    # narrow3!(steps, env, :J8, :J7, Register(5) => SIMD(2), Register(4) => SIMD(3), Register(3) => SIMD(4))
    # # Section 5, eqn. (27)
    # map_J8_registers = Layout(
    #     Int32,
    #     Dict(
    #         Cplx(0) => SIMD(2),
    #         Time(0) => SIMD(3),
    #         Time(1) => SIMD(4),
    #         Time(2) => Thread(0),
    #         Time(3) => Thread(1),
    #         Time(4) => Thread(2),
    #         Time(5) => Register(0),
    #         Time(6) => Register(1),
    #         Beam(0) => Thread(3),
    #         Beam(1) => Thread(4),
    #         Beam(2) => Warp(0),
    #         Beam(3) => Warp(1),
    #         Beam(4) => Warp(2),
    #         Beam(5) => Warp(3),
    #         Beam(6) => Warp(4),
    #     ),
    # )
    # @assert env[:J8] == map_J8_registers

    # @assert env[:J8] == map_J_registers
    # store!(steps, env, :J8, :J_mem, map_J_global)

    return nothing
end

function write_J!(steps::Vector{AbstractStep}, env::Environment)
    map_Jper_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            # Time(5) => SIMD(3),
            # Time(6) => SIMD(4),
            # Time(3) => Register(3),
            # Time(4) => Register(4),
            Time(0) => Thread(0),
            Time(1) => Thread(1),
            Time(2) => Thread(2),
            Time(3) => SIMD(3),
            Time(4) => SIMD(4),
            Time(5) => Register(0),
            Time(6) => Register(1),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
        ),
    )
    @assert env[:Jper] == map_Jper_registers

    Dict(
        Cplx(0) => SIMD(2),
        Time(0) => SIMD(3),
        Time(1) => SIMD(4),
        Time(2) => Register(0),
        Time(3) => Register(1),
        Time(4) => Thread(0),
        Time(5) => Thread(2),
        Time(6) => Thread(1),
        Beam(0) => Thread(3),
        Beam(1) => Thread(4),
        Beam(2) => Warp(0),
        Beam(3) => Warp(1),
        Beam(4) => Warp(2),
        Beam(5) => Warp(3),
        Beam(6) => Warp(4),
    ),
    permute!(steps, env, :Jper2, :Jper, Register(0), SIMD(3))
    permute!(steps, env, :Jper3, :Jper2, Register(0), Thread(0))
    permute!(steps, env, :Jper4, :Jper3, Register(0), SIMD(3))
    permute!(steps, env, :Jper5, :Jper4, Register(1), Thread(1))
    permute!(steps, env, :Jper6, :Jper5, Register(1), SIMD(4))
    permute!(steps, env, :Jper7, :Jper6, Register(0), Thread(2))
    permute!(steps, env, :Jstore, :Jper7, Register(1), Thread(0))

    map_Jstore_registers = Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Time(0) => SIMD(3),
            Time(1) => SIMD(4),
            Time(2) => Register(0),
            Time(3) => Register(1),
            Time(4) => Thread(0),
            Time(5) => Thread(2),
            Time(6) => Thread(1),
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
        ),
    )
    @show env[:Jstore] map_Jstore_registers
    @assert env[:Jstore] == map_Jstore_registers

    # TODO: Use 16-byte stores
    store!(steps, env, :Jstore, :J_mem, map_J_global)

    return nothing
end

function bb!(steps::Vector{AbstractStep}, env::Environment)
    read_A!(steps, env)
    loop!(steps, env, loopIdxT2, :(Int32(0):Int32(T2 ÷ T1 - 1)), [Time(t) for t in 7:14]) do steps, env
        loop!(steps, env, loopIdxT1, :(Int32(0):Int32(T1 ÷ T - 1)), [Time(5), Time(6)]) do steps, env
            copy_E!(steps, env)
            multiply!(steps, env)
            reduce!(steps, env)
            return nothing
        end
        write_J!(steps, env)
        return nothing
    end
    return nothing
end

bb_steps = AbstractStep[]
bb_env = Environment()
bb!(bb_steps, bb_env)
bb_allsteps = Seq(bb_steps)
println(bb_allsteps)

const E_shared_size = (516 ÷ 4, T)
const Ju_shared_size = (B + 4, T, Wd)

const E_shared_length = prod(E_shared_size)
const Ju_shared_length = prod(Ju_shared_size)

const E_shared_offset = 0
const Ju_shared_offset = E_shared_length

const shmem_length = E_shared_length + Ju_shared_length
const shmem_bytes = sizeof(Int32) * shmem_length

@eval function runsteps(A_mem, E_mem, J_mem, E_shared, Ju_shared)
    # E_shared = @cuDynamicSharedMem(Int4x8, $E_shared_size, $(sizeof(Int32) * E_shared_offset))
    # Ju_shared = @cuDynamicSharedMem(Int16x2, $Ju_shared_size, $(sizeof(Int32) * Ju_shared_offset))
    $(code(bb_allsteps))
    return nothing
end

function runcuda()
    # Cplx, Dish, Beam, Polr
    A_input = zeros(Int8, 2, 512, 96, 2)

    # Dish, Polr, Freq, Time
    E_input = zeros(Int8, 512, 2, 256, 32768)

    # Time, Polr, Freq, Beam
    J_input = zeros(Int8, 32768, 2, 256, 96)

    A_mem = reinterpret(Int8x4, reshape(A_input, :))
    E_mem = reinterpret(Int4x8, reshape(E_input, :))
    J_mem = reinterpret(Int4x8, reshape(J_input, :))

    E_shared = zeros(Int4x8, E_shared_size)
    Ju_shared = zeros(Int16x2, Ju_shared_size)

    A_mem = CuArray(A_mem)
    E_mem = CuArray(E_mem)
    J_mem = CuArray(J_mem)
    E_shared = CuArray(E_shared)
    Ju_shared = CuArray(Ju_shared)

    nthreads = 32
    nwarps = Wb * Wd
    nblocks = 2 * F             # Polr, Freq
    @assert shmem_bytes ≤ 99 * 1024   # NVIDIA A10 has 99 kB shared memory

    blocks_per_sm = 1
    maxregs = 65536 ÷ (nthreads * nwarps * blocks_per_sm)
    kernel = @cuda launch = false blocks_per_sm = blocks_per_sm runsteps(A_mem, E_mem, J_mem, E_shared, Ju_shared)

    attributes(kernel.fun)[CUDA.CU_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES] = shmem_bytes
    kernel(A_mem, E_mem, J_mem, E_shared, Ju_shared; threads=(nthreads, nwarps), blocks=nblocks, shmem=shmem_bytes)
    synchronize()

    E_shared = Array(E_shared)
    Ju_shared = Array(Ju_shared)

    return nothing
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
