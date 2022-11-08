# CHORD floating-point FRB beamformer

using CUDA
using GPUIndexSpaces

# Kernel parameters

# Full CHORD:

# time samples
const ts = 27.3                 # μsec
const T = 32768 ÷ 16            # ???
const Tds = 40                  #  downsampling factor
const Touter_step = 48
const Tinner_step = 4

@assert Touter_step % Tinner_step == 0

# number of dishes
const D = 512
const M = 24
const N = 24
@assert M * N ≥ D

# frequency channels
const F = 256                   # per GPU, upchannelized

# blocks
const B = 1                     # blocks (per SM)

# warps
const W = 24                    # warps (per block)

# Define physical indices

const Cplx = Index{:Cplx}
const Dish = Index{:Dish}
const Polr = Index{:Polr}
const Freq = Index{:Freq}

const TimeOuter = Index{:TimeOuter}
const TimeInnerHi = Index{:TimeInnerHi}
const TimeInnerLo = Index{:TimeInnerLo}
const Time = Index{:Time}

const LoopTimeOuter = Loop1
const LoopTimeInnerHi = Loop2
const LoopTimeInnerLo = Loop3
const LoopTime = Loop4
const loopIdxTimeOuter = :loopIdx1
const loopIdxTimeInnerHi = :loopIdx2
const loopIdxTimeInnerLo = :loopIdx3
const loopIdxTime = :loopIdx4

################################################################################

# Define global memory layouts

# Electric field array E
const map_E_global = let
    m = m2 = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(2),
            Dish(0) => SIMD(3),
            Dish(1) => SIMD(4),
            [Dish(d) => Memory(m += 1) for d in 2:(ceil(Int, log2(D)) - 1)]...,
            Polr(0) => Memory(m += 1),
            [Freq(f) => Memory(m += 1) for f in 0:(ceil(Int, log2(F)) - 1)]...,
            # [Time(t) => Memory(m += 1) for t in 0:(ceil(Int, log2(T)) - 1)]...,
            Time(0) => Memory(m += 1),
            Time(1) => Memory(m += 1),
            TimeInnerLo(0) => Memory(m += 1),
            TimeInnerLo(1) => Memory(m += 1),
            TimeInnerLo(2) => Memory(m += 1),
            TimeInnerHi(0) => Memory2(m2 += 1),
            [TimeOuter(t) => Memory2(m2 += 1) for t in 0:(ceil(Int, log2(cld(T, Touter_step))) - 1)]...,
        ),
    )
end

const map_d_global = nothing

const map_W_global = nothing

# See section 4.5
const map_Fsh1_shared = let
    b = -1
    Layout(
        Int32,
        Dict(
            Cplx(0) => SIMD(4),
            Dish(0) => Memory(0),
            Dish(1) => Memory(1),
            Dish(2) => Memory(2),
            Dish(3) => Memory2(0),
            Dish(4) => Memory2(1),
            Dish(5) => Memory2(2),
            Dish(6) => Memory2(3),
            Dish(7) => Memory2(4),
            Dish(8) => Memory2(5),
            Polr(0) => SIMD(2),
            [Freq(f) => Block(b += 1) for f in 0:(ceil(Int, log2(F)) - 1)]...,
            Time(0) => Memory3(0),
            Time(1) => Memory3(1),
            TimeInnerLo(0) => Memory3(2),
            TimeInnerLo(1) => Memory3(3),
            TimeInnerLo(2) => Memory3(4),
            TimeInnerHi(0) => SIMD(3),
            [TimeOuter(t) => LoopTimeOuter(t) for t in 0:(ceil(Int, log2(cld(T, Touter_step))) - 1)]...,
        ),
    )
end

const map_I_global = nothing

const map_I_registers = let
    Layout(Float32, Dict(
        Cplx(0) => SIMD(4),
        #TODO DishM(0) => nothing,
        #TODO DishM(1) => nothing,
        #TODO DishM(2) => nothing,
        #TODO DishM(3) => nothing,
        #TODO DishM(4) => nothing,
        #TODO DishM(5) => nothing,
        #TODO DishN(0) => nothing,
        #TODO DishN(1) => nothing,
        #TODO DishN(2) => nothing,
        #TODO DishN(3) => nothing,
        #TODO DishN(4) => nothing,
        #TODO DishN(5) => nothing,
        #TODO SlowTime() => nothing,
    ))
end

################################################################################

function copy_global_memory_to_fsh1!(steps::Vector{AbstractStep}, env::Environment)
    map_E_registers = let
        # See section 4.6
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
                Dish(7) => Thread(3),
                Dish(8) => Register(3), # or loop
                Polr(0) => Thread(4),
                Time(0) => Warp(0),
                Time(1) => Warp(1),
                TimeInnerLo(0) => Warp(2),
                TimeInnerLo(1) => Warp(3),
                TimeInnerLo(2) => Warp(4),
                TimeInnerHi(0) => Register(2),
                [TimeOuter(t) => LoopTimeOuter(t) for t in 0:(ceil(Int, log2(cld(T, Touter_step))) - 1)]...,
            ),
        )
    end
    load!(steps, env, :E0, map_E_registers, :E_mem, map_E_global; align=16)
    permute!(steps, env, :E1, :E0, Dish(3), Polr(0))
    # E -> F shuffle
    permute!(steps, env, :E2, :E1, Polr(0) => SIMD(2))
    permute!(steps, env, :E3, :E2, TimeInnerHi(0) => SIMD(3))
    permute!(steps, env, :E4, :E3, Cplx(0) => SIMD(4))
    store!(steps, env, :E4, :Fsh1_shared, map_Fsh1_shared)

    return nothing
end

function frbf!(steps::Vector{AbstractStep}, env::Environment)
    constant!(steps, env, :I_running, map_I_registers, 0.0f0)
    #TODO code!(steps, env, :(t_running = Int32(0)))
    loop!(
        steps,
        env,
        loopIdxTimeOuter,
        :(Int32(0):Int32($Touter_step):(Int32($T) - 1)),
        [TimeOuter(t) for t in 0:(ceil(Int, log2(cld(T, Touter_step))) - 1)],
    ) do steps, env
        copy_global_memory_to_fsh1!(steps, env)
        sync_threads!(steps, env)

        # TimeInner will loop from TimeOuter to TimeOuter + TimeOuterStep
        # Time will loop from TimeInner to TimeInner + TimeInnerStep

        return nothing
    end
    return nothing
end

const frbf_steps = AbstractStep[]
const frbf_env = Environment()
frbf!(frbf_steps, frbf_env)
const frbf_allsteps = Seq(frbf_steps)

################################################################################

@eval function runsteps(E_mem_mem)
    $(declarations(frbf_allsteps))
    $(code(frbf_allsteps))
    return nothing
end

println(frbf_allsteps)
