using BenchmarkTools
using CUDA
using GPUIndexSpaces

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Dish = Index{:Dish}       # 9 bits
const Freq = Index{:Freq}       # 8 bits
const Polr = Index{:Polr}       # 1 bit
const Time = Index{:Time}       # 15 bits

# Layout of E in global memory
# One time sample corresponds to 1.7 μs
const map_E_global = Layout(
    Int32,
    Dict(
        Cplx(0) => SIMD(2),
        Polr(0) => SIMD(3),
        Dish(0) => SIMD(4),
        Dish(1) => Memory(0),
        Dish(2) => Memory(1),
        Dish(3) => Memory(2),
        Dish(4) => Memory(3),
        Dish(5) => Memory(4),
        Dish(6) => Memory(5),
        Dish(7) => Memory(6),
        Dish(8) => Memory(7),
        Freq(0) => Memory(8),
        Freq(1) => Memory(9),
        Freq(2) => Memory(10),
        Freq(3) => Memory(11),
        Freq(4) => Memory(12),
        Freq(5) => Memory(13),
        Freq(6) => Memory(14),
        Freq(7) => Memory(15),
        Time(0) => Memory(16),
        Time(1) => Memory(17),
        Time(2) => Memory(18),
        Time(3) => Memory(19),
        Time(4) => Memory(20),
        Time(5) => Memory(21),
        Time(6) => Memory(22),
        Time(7) => Memory(23),
        Time(8) => Memory(24),
        Time(9) => Memory(25),
        Time(10) => Memory(26),
        Time(11) => Memory(27),
        Time(12) => Memory(28),
        Time(13) => Memory(29),
        Time(14) => Memory(30),
    ),
)

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
    ),
)

const map_Esum_global = Layout(
    Float32,
    Dict(
        Cplx(0) => Memory(0),
        Polr(0) => Memory(1),
        Dish(0) => Memory(2),
        Dish(1) => Memory(3),
        Dish(2) => Memory(4),
        Dish(3) => Memory(5),
        Dish(4) => Memory(6),
        Dish(5) => Memory(7),
        Dish(6) => Memory(8),
        Dish(7) => Memory(9),
        Dish(8) => Memory(10),
        Freq(0) => Memory(11),
        Freq(1) => Memory(12),
        Freq(2) => Memory(13),
        Freq(3) => Memory(14),
        Freq(4) => Memory(15),
        Freq(5) => Memory(16),
        Freq(6) => Memory(17),
        Freq(7) => Memory(18),
    ),
)

const map_Esum_registers = Layout(
    Float32,
    Dict(
        Cplx(0) => Thread(0),
        Polr(0) => Thread(1),
        Dish(0) => Thread(2),
        Dish(1) => Thread(3),
        Dish(2) => Thread(4),
        Dish(3) => Register(0),
        Dish(4) => Register(1),
        Dish(5) => Register(2),
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
    ),
)

function accumulate!(steps::Vector{AbstractStep}, env::Environment)
    constant!(steps, env, :Esum_zero, map_Esum_registers, Float32(0))
    store!(steps, env, :Esum_zero, :Esum_global, map_Esum_global)
    loop!(steps, env, :loopIdx1, :(Int32(0):($(Int32(2^15 - 1)))), [Time(i) for i in 0:14]) do steps, env
        load!(steps, env, :E, map_E_registers, :E_global, map_E_global)
        widen!(steps, env, :E1, :E, SIMD(2) => Register(0))
        widen2!(steps, env, :E2, :E1, SIMD(3) => Register(1), SIMD(4) => Register(2))
        apply!(steps, env, :Esum, :E2, E -> :(Float32($E)); newtype=Float32)
        store!(steps, env, :Esum, :Esum_global, map_Esum_global; operator=:(+=), ignore=Set(Time(i) for i in 0:14))
        nothing
    end
    return nothing
end

avg_steps = AbstractStep[]
avg_env = Environment()
accumulate!(avg_steps, avg_env)
avg_allsteps = Seq(avg_steps)
println(avg_allsteps)

@eval function runsteps(E_global, Esum_global)
    $(code(avg_allsteps))
    return nothing
end

function runcuda()
    npolarizations = 2
    ndishes = 512
    nfrequencies = 256

    E_global = zeros(Int8, npolarizations, ndishes, nfrequencies, 32768)
    E_global = reinterpret(Int4x8, reshape(E_global, :))
    E_global = CuArray(E_global)
    Esum_global = CuArray{Float32}(undef, npolarizations * ndishes * nfrequencies)

    nthreads = 32
    nwarps = 8
    nblocks = nfrequencies
    shmem = 0

    # sm_86
    @assert shmem ≤ 99 * 1024   # NVIDIA A10 has 99 kB shared memory

    kernel = @cuda launch = false blocks_per_sm = 1 maxregs = 32768 ÷ nwarps runsteps(E_global, Esum_global)
    attributes(kernel.fun)[CUDA.CU_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES] = shmem
    kernel(E_global, Esum_global; threads=(nthreads, nwarps), blocks=nblocks, shmem=shmem)
    synchronize()

    return nothing
end

if CUDA.functional()
    # @device_code_lowered runcuda()
    # @device_code_typed runcuda()
    # @device_code_warntype runcuda()
    @device_code_llvm runcuda()
    @device_code_ptx runcuda()
    @device_code_sass runcuda()
    # runcuda()
end
