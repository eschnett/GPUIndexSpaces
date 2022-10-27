# CHORD 8-bit baseband beamformer
# See <https://www.overleaf.com/project/6228adae742a3a2da1afe437>

using BenchmarkTools
using CUDA
using GPUIndexSpaces
using Random

################################################################################

# Kernel parameters

const T = 32768                # number of times
const T1 = 128                  # outer time cadence
@assert T % T1 == 0
#UNDO const B = 96                    # number of beams
const B = 128                   # number of beams
const D = 512                   # number of dishes
#UNDO const F = 16                    # frequency channels per GPU
const F = 84 ÷ 2                # frequency channels per GPU
# const F = 1                     # frequency channels per GPU
#UNDO const Wb = 6                    # A matrix tiling
const Wb = 8                    # A matrix tiling
const Wd = 4                    # A matrix tiling
@assert B % Wb == 0
@assert D % Wd == 0
const W = Wb * Wd               # warps per block
const T2 = 32                   # chunk size (inner time cadence)
@assert T % T1 == 0
@assert T1 % T2 == 0
@assert T2 % 4 == 0

const σ = 5 - round(Int, log2(Wd))

################################################################################

# Define physical indices

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Polr = Index{:Polr}       # 1 bit
const Dish = Index{:Dish}       # 9 bits
const Dish′ = Index{:Dish′}     # 9 bits
const Freq = Index{:Freq}       # 8 bits here
const Time = Index{:Time}       # 15 bits
const Beam = Index{:Beam}       # 7 bits (0...95)

const LoopT = Loop1            # outer time loop
const LoopT1 = Loop2
const LoopT2 = Loop3
const LoopB = Loop4
const LoopD = Loop5
const loopIdxT = :loopIdx1
const loopIdxT1 = :loopIdx2
const loopIdxT2 = :loopIdx3
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
            [Dish(d) => Memory(m += 1) for d in 2:(ceil(Int, log(2, D)) - 1)]...,
            Polr(0) => Memory(m += 1),
            [Freq(f) => Memory(m += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            [Time(t) => Memory(m += 1) for t in 0:(ceil(Int, log(2, T)) - 1)]...,
        ),
    )
end

# Section 3, eqn. (13)
const map_E_shared = let
    m = m2 = -1
    b = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Dish(0) => SIMD(3),
            Dish(1) => SIMD(4),
            [Dish(d) => Memory(m += 1) for d in 2:(ceil(Int, log(2, D)) - 1)]...,
            Polr(0) => Block(b += 1),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            # TODO: Make padding a compile-time constant, not a run-time choice
            [Time(t) => Memory2(m2 += 1) for t in 0:4]...,
            [Time(t) => LoopT1(t - 5) for t in 5:(ceil(Int, log(2, T1)) - 1)]...,
            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
        ),
    )
end

# Defined in section 3
@assert Wd == 4
@assert Wb == 8
const map_Ecopy_registers = let
    b = -1
    Layout(
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
            Time(5) => LoopT1(0),
            Time(6) => LoopT1(1),
            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
            Polr(0) => Block(b += 1),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
        ),
    )
end

@assert Wd == 4
@assert D ÷ Wd % 16 == 0
@assert D ÷ Wd ÷ 16 == 8
@assert T2 % 8 == 0
@assert T2 ÷ 8 == 4
const map_E_registers = let
    b = -1
    Layout(
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
            Time(3) => LoopT2(0),
            Time(4) => LoopT2(1),
            Time(5) => LoopT1(0),
            Time(6) => LoopT1(1),
            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
            Polr(0) => Block(b += 1),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
        ),
    )
end

# Beamforming matrix A
const map_A_global = let
    m = -1
    i = -1
    Layout(
        Int32,
        Dict(
            # The natural layout
            Cplx(0) => SIMD(3),
            Dish(0) => SIMD(4),
            [Dish(d) => Memory(m += 1) for d in 1:(ceil(Int, log(2, D)) - 1)]...,
            [Beam(b) => Memory(m += 1) for b in 0:(ceil(Int, log(2, B)) - 1)]...,
            Polr(0) => Memory(m += 1),
            [Freq(f) => Ignore(i += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
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
@assert Wd == 4
@assert Wb == 8
const map_A_registers = let
    b = -1
    Layout(
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
            Polr(0) => Block(b += 1),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
        ),
    )
end

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
            Polr(0) => Memory(m += 1),
            Freq(0) => Memory(m += 1),
            Freq(1) => Memory(m += 1),
            Freq(2) => Memory(m += 1),
            Freq(3) => Memory(m += 1),
            Freq(4) => Memory(m += 1),
            Freq(5) => Memory(m += 1),
            Freq(6) => Memory(m += 1),
            Freq(7) => Memory(m += 1),
        ),
    )
end

const map_s_registers = let
    b = -1
    Layout(
        Int32,
        Dict(
            Beam(0) => Thread(3),
            Beam(1) => Thread(4),
            Beam(2) => Warp(0),
            Beam(3) => Warp(1),
            Beam(4) => Warp(2),
            Beam(5) => Warp(3),
            Beam(6) => Warp(4),
            Polr(0) => Block(b += 1),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
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
            [Time(t) => Memory(m += 1) for t in 2:(ceil(Int, log(2, T)) - 1)]...,
            Polr(0) => Memory(m += 1),
            [Freq(f) => Memory(m += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            [Beam(b) => Memory(m += 1) for b in 0:(ceil(Int, log(2, B)) - 1)]...,
        ),
    )
end

const map_Ju_shared = let
    m = m2 = m3 = -1
    i = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(4),
            [Beam(b) => Memory(m += 1) for b in 0:(ceil(Int, log(2, B)) - 1)]...,
            [Time(t) => Memory2(m2 += 1) for t in 0:ceil(Int, log(2, T2) - 1)]...,
            [Time(t) => LoopT1(t - 5) for t in 5:(ceil(Int, log(2, T1)) - 1)]...,
            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
            Dish′(7) => Memory3(m3 += 1),
            Dish′(8) => Memory3(m3 += 1),
            Polr(0) => Ignore(i += 1),
            [Freq(f) => Ignore(i += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
        ),
    )
end

################################################################################

function read_A!(steps::Vector{AbstractStep}, env::Environment)
    @assert B == 128
    map_A0_registers = let
        b = -1
        Layout(
            Int32,
            Dict(
                Cplx(0) => SIMD(3),     # want Register(0)
                Dish(0) => SIMD(4),     # want SIMD(3)
                Dish(1) => Register(0), # want SIMD(4)
                Dish(2) => Register(1), # final
                Dish(3) => Thread(1),   # want Register(2)
                Dish(4) => Thread(2),   # want Register(3)
                Dish(5) => Thread(0),   # final
                Dish(6) => Register(2), # want Thread(1)
                Dish(7) => Warp(0),     # final
                Dish(8) => Warp(1),     # final
                Beam(0) => Register(3), # want Thread(2)
                Beam(1) => Thread(3),   # final
                Beam(2) => Thread(4),   # final
                Beam(3) => Register(4), # final
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    load!(steps, env, :A0, map_A0_registers, :A_mem, map_A_global; align=16)
    rename!(steps, env, :A1, :A0, Dict(Dish(d) => Dish′(dish2dish′[d]) for d in 0:8))
    # Make Dish(1) correct
    permute!(steps, env, :A2, :A1, Register(0), SIMD(4))
    # Make Cplx(0) and Dish(0) correct
    permute!(steps, env, :A3, :A2, Register(0), SIMD(3))
    # Make Dish(3), Dish(6) correct
    permute!(steps, env, :A4, :A3, Register(2), Thread(1))
    # Make Dish(4), Beam(0) correct
    permute!(steps, env, :A, :A4, Register(3), Thread(2))
    @assert env[:A] == map_A_registers
    return nothing
end

# Step 1: transferring global memory to shared memory
function copy_E!(steps::Vector{AbstractStep}, env::Environment)
    load!(steps, env, :Ecopy, map_Ecopy_registers, :E_mem, map_E_global; align=16)
    store!(steps, env, :Ecopy, :E_shared, map_E_shared; align=4)
    sync_threads!(steps, env)
    return nothing
end

# Step 2: matrix multiplication
function multiply_A_E!(steps::Vector{AbstractStep}, env::Environment)
    @assert T2 % 8 == 0
    @assert T2 ÷ 8 == 4
    loop!(steps, env, loopIdxT2, :(Int32(0):Int32($T2 ÷ 8 - 1)), [Time(3), Time(4)]) do steps, env
        @assert B ÷ Wb % 8 == 0
        @assert B ÷ Wb ÷ 8 == 2
        unrolled_loop!(steps, env, loopIdxB, :(Int32(0):Int32($B ÷ $Wb ÷ 8 - 1)), [Beam(6)]) do steps, env
            select!(steps, env, :A10, :A, [Register(4)], :($loopIdxB))

            map_Jureim_registers = let
                b = -1
                Layout(
                    Int32,
                    Dict(
                        Dish′(7) => Warp(0),
                        Dish′(8) => Warp(1),
                        Time(0) => Register(0),
                        Time(1) => Thread(0),
                        Time(2) => Thread(1),
                        Time(3) => LoopT2(0),
                        Time(4) => LoopT2(1),
                        Time(5) => LoopT1(0),
                        Time(6) => LoopT1(1),
                        [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                        Beam(0) => Thread(2),
                        Beam(1) => Thread(3),
                        Beam(2) => Thread(4),
                        Beam(3) => LoopB(0),    # since Wb = 6
                        Beam(4) => Warp(2),     # since Wb = 6
                        Beam(5) => Warp(3),     # since Wb = 6
                        Beam(6) => Warp(4),     # since Wb = 6
                        Polr(0) => Block(b += 1),
                        [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
                    ),
                )
            end
            constant!(steps, env, :Jurepos, map_Jureim_registers, :(Int32(0)))
            constant!(steps, env, :Jureneg, map_Jureim_registers, :(Int32(0)))
            constant!(steps, env, :Juim, map_Jureim_registers, :(Int32(0)))

            @assert D ÷ Wd % 16 == 0
            @assert D ÷ Wd ÷ 16 == 8
            unrolled_loop!(steps, env, loopIdxD, :(Int32(0):Int32($D ÷ $Wd ÷ 16 - 1)), [Dish(2), Dish(3), Dish(4)]) do steps, env
                select!(steps, env, :A11, :A10, [Register(1), Register(2), Register(3)], :($loopIdxD))
                split!(steps, env, :Are, :Aim, :A11, Cplx(0))

                map_E0_registers = let
                    b = -1
                    Layout(
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
                            Time(3) => LoopT2(0),
                            Time(4) => LoopT2(1),
                            Time(5) => LoopT1(0),
                            Time(6) => LoopT1(1),
                            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                            Polr(0) => Block(b += 1),
                            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
                        ),
                    )
                end
                load!(steps, env, :E0, map_E0_registers, :E_shared, map_E_shared; align=4)
                rename!(steps, env, :E1, :E0, Dict(Dish(d) => Dish′(dish2dish′[d]) for d in 0:8))
                @assert env[:E1] == map_E_registers

                # Section 4, eqn (16)
                map_E2_registers = let
                    b = -1
                    Layout(
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
                            Time(3) => LoopT2(0),
                            Time(4) => LoopT2(1),
                            Time(5) => LoopT1(0),
                            Time(6) => LoopT1(1),
                            [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                            Polr(0) => Block(b += 1),
                            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
                        ),
                    )
                end
                widen!(steps, env, :E2, :E1, SIMD(2) => Register(0))
                @assert env[:E2] == map_E2_registers

                split!(steps, env, :E2re, :E2im, :E2, Cplx(0))

                mma_row_col_m8n8k16_s8!(steps, env, :Jurepos1, :Are, :E2re, :Jurepos)
                mma_row_col_m8n8k16_s8!(steps, env, :Jureneg1, :Aim, :E2im, :Jureneg)
                mma_row_col_m8n8k16_s8!(steps, env, :Juim1, :Are, :E2im, :Juim)
                mma_row_col_m8n8k16_s8!(steps, env, :Juim2, :Aim, :E2re, :Juim1)

                reduce!(steps, env, :Jurepos, :Jurepos1, (Ju, Ju1) -> :($Ju = $Ju1))
                reduce!(steps, env, :Jureneg, :Jureneg1, (Ju, Ju1) -> :($Ju = $Ju1))
                reduce!(steps, env, :Juim, :Juim2, (Ju, Ju1) -> :($Ju = $Ju1))

                nothing
            end                     # LoopD

            apply!(steps, env, :Jure, :Jurepos, :Jureneg, (Jurepos, Jureneg) -> :($Jurepos - $Jureneg))
            merge!(steps, env, :Ju, :Jure, :Juim, Cplx(0) => Register(1))

            # TODO: Break ties to even?
            @assert σ ≥ 1
            apply!(steps, env, :Ju2, :Ju, Ju -> :(($Ju + Int32($(1 << (σ - 1)))) >> $σ))
            # apply!(steps, env, :Ju2, :Ju, Ju -> :($Ju))

            # Note: `cvs_pack_s16` saturates, so we don't need to clamp
            # apply!(steps, env, :Ju3, :Ju2, J -> :(clamp($J, (-Int32(0x7fff)):(+Int32(0x7fff)))))
            narrow!(steps, env, :Ju4, :Ju2, Register(1) => SIMD(4))
            @assert env[:Ju4] == let
                b = -1
                Layout(
                    Int32,
                    Dict(
                        Cplx(0) => SIMD(4),
                        Time(0) => Register(0),
                        Time(1) => Thread(0),
                        Time(2) => Thread(1),
                        Beam(0) => Thread(2),
                        Beam(1) => Thread(3),
                        Beam(2) => Thread(4),
                        Time(3) => LoopT2(0),
                        Time(4) => LoopT2(1),
                        Beam(3) => LoopB(0),
                        Dish′(7) => Warp(0),
                        Dish′(8) => Warp(1),
                        Beam(4) => Warp(2),     # since Wb = 6
                        Beam(5) => Warp(3),     # since Wb = 6
                        Beam(6) => Warp(4),     # since Wb = 6
                        Time(5) => LoopT1(0),
                        Time(6) => LoopT1(1),
                        [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                        Polr(0) => Block(b += 1),
                        [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
                    ),
                )
            end

            store!(steps, env, :Ju4, :Ju_shared, map_Ju_shared; align=4)

            nothing
        end                     # LoopB

        nothing
    end                         # LoopT2
    sync_threads!(steps, env)

    return nothing
end

# Step 3: reduce and quantize
function reduce_Ju!(steps::Vector{AbstractStep}, env::Environment)
    # Section 5, eqn (22)
    map_Ju10_registers = let
        b = -1
        Layout(
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
                Time(5) => LoopT1(0),
                Time(6) => LoopT1(1),
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Dish′(7) => Register(0),
                Dish′(8) => Register(1),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    load!(steps, env, :Ju10, map_Ju10_registers, :Ju_shared, map_Ju_shared; align=4)
    widen!(steps, env, :Ju11, :Ju10, SIMD(4) => Register(2))
    split!(steps, env, :Ju11a, :Ju11b, :Ju11, Register(0))
    #TODO apply!(steps, env, :Ju12, :Ju11a, :Ju11b, (Ju11a, Ju11b) -> :(add_sat($Ju11a, $Ju11b)))
    apply!(steps, env, :Ju12, :Ju11a, :Ju11b, (Ju11a, Ju11b) -> :($Ju11a + $Ju11b))
    split!(steps, env, :Ju12a, :Ju12b, :Ju12, Register(1))
    #TODO apply!(steps, env, :J, :Ju12a, :Ju12b, (Ju12a, Ju12b) -> :(add_sat($Ju12a, $Ju12b)))
    apply!(steps, env, :J, :Ju12a, :Ju12b, (Ju12a, Ju12b) -> :($Ju12a + $Ju12b))
    # Section 5, eqn. (24)
    map_J_registers = let
        b = -1
        @assert T1 == 128
        @assert T2 == 32
        Layout(
            Int32,
            Dict(
                Cplx(0) => Register(2),
                Time(0) => Thread(0),
                Time(1) => Thread(1),
                Time(2) => Thread(2),
                Time(3) => Register(3),
                Time(4) => Register(4),
                Time(5) => LoopT1(0),
                Time(6) => LoopT1(1),
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Beam(0) => Thread(3),
                Beam(1) => Thread(4),
                Beam(2) => Warp(0),
                Beam(3) => Warp(1),
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    @assert env[:J] == map_J_registers

    # TODO: Load in the beginning, save in a register?
    apply!(steps, env, :J2, :J, :s, (J, s) -> :(($J + (Int32(1) << ($s % UInt32 - UInt32(1)))) >> (s % UInt32)))
    # apply!(steps, env, :J2, :J, J -> :($J))

    # TODO: Try this: Shift values left by 4, rely on saturation when converting, then shift right and mask
    apply!(steps, env, :J2′, :J2, J -> :(clamp($J, (-Int32(0x7)):(+Int32(0x7)))))
    narrow3!(steps, env, :J3, :J2′, Register(2) => SIMD(2), Register(3) => SIMD(3), Register(4) => SIMD(4))
    # Section 5, eqn. (26)
    map_J3_registers = let
        b = -1
        Layout(
            Int32,
            Dict(
                Cplx(0) => SIMD(2),
                Time(0) => Thread(0),
                Time(1) => Thread(1),
                Time(2) => Thread(2),
                Time(3) => SIMD(3),
                Time(4) => SIMD(4),
                Time(5) => LoopT1(0),
                Time(6) => LoopT1(1),
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Beam(0) => Thread(3),
                Beam(1) => Thread(4),
                Beam(2) => Warp(0),
                Beam(3) => Warp(1),
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    @assert env[:J3] == map_J3_registers

    unselect!(steps, env, :Jper, :J3, [Time(5) => Register(0), Time(6) => Register(1)], :($loopIdxT1))
    # Section 5, eqn. (27), but Time(5:6) replaced by Time(3:4)
    map_Jper_registers = let
        b = -1
        Layout(
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
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Beam(0) => Thread(3),
                Beam(1) => Thread(4),
                Beam(2) => Warp(0),
                Beam(3) => Warp(1),
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    @assert env[:Jper] == map_Jper_registers

    return nothing
end

function write_J!(steps::Vector{AbstractStep}, env::Environment)
    map_Jper_registers = let
        b = -1
        Layout(
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
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Beam(0) => Thread(3),
                Beam(1) => Thread(4),
                Beam(2) => Warp(0),
                Beam(3) => Warp(1),
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    @assert env[:Jper] == map_Jper_registers

    permute!(steps, env, :Jper2, :Jper, Register(0), SIMD(3))
    permute!(steps, env, :Jper3, :Jper2, Register(0), Thread(0))
    permute!(steps, env, :Jper4, :Jper3, Register(0), SIMD(3))
    permute!(steps, env, :Jper5, :Jper4, Register(1), Thread(1))
    permute!(steps, env, :Jper6, :Jper5, Register(1), SIMD(4))
    permute!(steps, env, :Jper7, :Jper6, Register(0), Thread(2))
    permute!(steps, env, :Jstore, :Jper7, Register(1), Thread(0))

    map_Jstore_registers = let
        b = -1
        Layout(
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
                [Time(t) => LoopT(t - 7) for t in 7:(ceil(Int, log(2, T)) - 1)]...,
                Beam(0) => Thread(3),
                Beam(1) => Thread(4),
                Beam(2) => Warp(0),
                Beam(3) => Warp(1),
                Beam(4) => Warp(2),
                Beam(5) => Warp(3),
                Beam(6) => Warp(4),
                Polr(0) => Block(b += 1),
                [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log(2, F)) - 1)]...,
            ),
        )
    end
    @assert env[:Jstore] == map_Jstore_registers

    store!(steps, env, :Jstore, :J_mem, map_J_global; align=16)

    return nothing
end

function bb!(steps::Vector{AbstractStep}, env::Environment)
    load!(steps, env, :s, map_s_registers, :s_mem, map_s_global)
    read_A!(steps, env)
    @assert T % T1 == 0
    loop!(steps, env, loopIdxT, :(Int32(0):Int32($T ÷ $T1 - 1)), [Time(t) for t in 7:14]) do steps, env
        @assert T1 % T2 == 0
        @assert T1 ÷ T2 == 4
        loop!(steps, env, loopIdxT1, :(Int32(0):Int32($T1 ÷ $T2 - 1)), [Time(5), Time(6)]) do steps, env
            copy_E!(steps, env)
            multiply_A_E!(steps, env)
            reduce_Ju!(steps, env)
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

@assert D % 4 == 0
const E_shared_size = (D ÷ 4 + 1, T2)
const Ju_shared_size = (B + 4, T2, Wd)

const E_shared_length = prod(E_shared_size)
const Ju_shared_length = prod(Ju_shared_size)

const E_shared_offset = 0
const Ju_shared_offset = (E_shared_offset + E_shared_length + 31) & ~31

const shmem_length = (Ju_shared_offset + Ju_shared_length + 31) & ~31
const shmem_bytes = sizeof(Int32) * shmem_length

@eval function runsteps(A_mem, E_mem, s_mem, J_mem)
    E_shared = @cuDynamicSharedMem(Int4x8, $E_shared_size, $(sizeof(Int32) * E_shared_offset))
    @assert UInt(pointer(E_shared)) & 127 == 0
    Ju_shared = @cuDynamicSharedMem(Int16x2, $Ju_shared_size, $(sizeof(Int32) * Ju_shared_offset))
    @assert UInt(pointer(Ju_shared)) & 127 == 0
    $(declarations(bb_allsteps))
    $(code(bb_allsteps))
    return nothing
end

function runcuda()
    println("CHORD 8-bit baseband beamformer")
    println("J[t,p,f,b] = s[b,p,f] Σ[d] A[d,b,p,f] E[d,p,f,t]")

    Random.seed!(0)
    niters = 1
    nruns = 0
    for iter in 1:niters
        println("Iteration $iter:")
        println("    Setting up inputs...")

        # Cplx, Dish, Beam, Polr
        A_input = zeros(Int8, 2, nextpow(2, D), nextpow(2, B), 2)

        # Dish, Polr, Freq, Time
        E_input = zeros(Int4x2, nextpow(2, D), 2, nextpow(2, F), nextpow(2, T))

        # Beam, Polr, Freq
        s_input = zeros(Int32, nextpow(2, B), 2, nextpow(2, F))

        # Time, Polr, Freq, Beam
        J_input = zeros(Int4x2, nextpow(2, T), 2, nextpow(2, F), nextpow(2, B))

        # ibeam = 1
        # idish = 1
        # ifreq = 1
        # ipolr = 1
        # itime = 1

        ibeam = rand(1:B)
        idish = rand(1:D)
        ifreq = rand(1:F)
        ipolr = rand(1:2)
        itime = rand(1:T)
        println("    Choosing b=$ibeam d=$idish f=$ifreq p=$ipolr t=$itime...")

        aval = 0 + im * 0
        eval = 0 + im * 0
        sval = 0
        jval = 0 + im * 0
        while true
            aval = rand(-127:+127) + im * rand(-127:+127)
            eval = rand(-7:+7) + im * rand(-7:+7)
            sval = rand(σ:(σ + 2)) - σ
            jval = aval * eval
            jval = Complex((real(jval) + (1 << (σ - 1))) >> σ, (imag(jval) + (1 << (σ - 1))) >> σ)
            jval = Complex((real(jval) + (1 << (sval - 1))) >> sval, (imag(jval) + (1 << (sval - 1))) >> sval)
            abs(real(jval)) ≤ 7 && abs(imag(jval)) ≤ 7 && break
        end
        println("        Using a=$aval e=$eval s=$sval j=$jval...")

        A_input[1, idish, ibeam, ipolr] = real(aval)
        A_input[2, idish, ibeam, ipolr] = imag(aval)

        E_input[idish, ipolr, ifreq, itime] = Int4x2(Int32(real(eval)), Int32(imag(eval)))

        s_input[ibeam, ipolr, ifreq] = sval

        A_mem = reinterpret(Int8x4, reshape(A_input, :))
        E_mem = reinterpret(Int4x8, reshape(E_input, :))
        s_mem = reinterpret(Int32, reshape(s_input, :))
        J_mem = reinterpret(Int4x8, reshape(J_input, :))

        println("    Copying inputs to device...")
        A_mem = CuArray(A_mem)
        E_mem = CuArray(E_mem)
        s_mem = CuArray(s_mem)
        J_mem = CuArray(J_mem)

        println("    Compiling kernel...")
        nthreads = 32
        nwarps = Wb * Wd
        nblocks = 2 * F                 # Polr, Freq
        @assert shmem_bytes ≤ 99 * 1024 # NVIDIA A10 has 99 kB shared memory

        blocks_per_sm = 1
        # maxregs = 65536 ÷ (nthreads * nwarps * blocks_per_sm)
        kernel = @cuda launch = false minthreads = nthreads * nwarps blocks_per_sm = blocks_per_sm runsteps(
            A_mem, E_mem, s_mem, J_mem
        )

        println("    Running kernel...")
        attributes(kernel.fun)[CUDA.CU_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES] = shmem_bytes
        kernel(A_mem, E_mem, s_mem, J_mem; threads=(nthreads, nwarps), blocks=nblocks, shmem=shmem_bytes)
        synchronize()
        for run in 1:nruns
            stats = @timed begin
                kernel(A_mem, E_mem, s_mem, J_mem; threads=(nthreads, nwarps), blocks=nblocks, shmem=shmem_bytes)
                synchronize()
            end
            println("        run time: $(stats.time * 1.0e+6) μsec")
        end

        println("    Copying outputs from device...")
        J_mem = Array(J_mem)

        println("    Checking outputs...")
        J_output = reshape(reinterpret(Int4x2, J_mem), nextpow(2, T), 2, nextpow(2, F), nextpow(2, B))
        let
            errcount = 0
            for b in 1:B, f in 1:F, p in 1:2, t in 1:T
                want_jval = (b == ibeam && f == ifreq && p == ipolr && t == itime) ? jval : 0
                have_jval′ = convert(NTuple{2,Int32}, J_output[t, p, f, b])
                have_jval = have_jval′[1] + im * have_jval′[2]
                if have_jval ≠ want_jval
                    errcount += 1
                    if errcount ≤ 100
                        println("            J[$t,$p,$f,$b] = $have_jval   (want $want_jval)")
                    end
                end
            end
            println("        There are $errcount errors")
            @assert errcount == 0
        end
    end

    println("Done.")
    return nothing
end

# println(bb_allsteps)
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
