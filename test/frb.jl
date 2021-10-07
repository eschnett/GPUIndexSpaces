using CUDA
using GPUIndexSpaces

################################################################################

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Polr = Index{:Polr}       # 1 bit
const Dish = Index{:Dish}       # 9 bits (only 4 during FT)
const DishI = Index{:DishI}     # 5 bits
const DishJ = Index{:DishJ}     # 5 bits
const DishIJ = Index{:DishIJ}   # 10 bits
const Freq = Index{:Freq}       # 4 bits here (0 bits used)
const Time = Index{:Time}       # many bits here (3 bits used)
const BeamI = Index{:BeamI}     # 7 bits (using 4 during FT, 1 via FFT, 2 via loop)
const BeamJ = Index{:BeamJ}     # 7 bits (using 4 during FT, 1 via FFT, 2 via loop)
const PlMi = Index{:PlMi}       # 1 bit (0:+, 1:-)

################################################################################

# Layout of E in global memory
const map_E_global = Layout(Dict([Cplx(0) => SIMD(2)
                                  Polr(0) => SIMD(3)
                                  Dish(0) => SIMD(4)
                                  Dish(1) => Memory(0)
                                  Dish(2) => Memory(1)
                                  Dish(3) => Memory(2)
                                  Dish(4) => Memory(3)
                                  Dish(5) => Memory(4)
                                  Dish(6) => Memory(5)
                                  Dish(7) => Memory(6)
                                  Dish(8) => Memory(7)
                                  Freq(0) => Memory(8)
                                  Freq(1) => Memory(9)
                                  Freq(2) => Memory(10)
                                  Freq(3) => Memory(11)
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

# Layout of E in registers; see (48)
const map_E_registers = Layout(Dict([Cplx(0) => SIMD(2)
                                     Polr(0) => SIMD(3)
                                     Dish(0) => SIMD(4)
                                     Dish(1) => Thread(0)
                                     Dish(2) => Thread(1)
                                     Dish(3) => Thread(2)
                                     Dish(4) => Thread(3)
                                     Dish(5) => Thread(4)
                                     Dish(6) => Warp(0)
                                     Dish(7) => Warp(1)
                                     Dish(8) => Warp(2)
                                     Time(0) => Register(0)
                                     Time(1) => Warp(3)
                                     Time(2) => Warp(4)]))

const map_K_memory = Layout(Dict([Dish(0) => SIMD(4)
                                  Dish(1) => Memory(0)
                                  Dish(2) => Memory(1)
                                  Dish(3) => Memory(2)
                                  Dish(4) => Memory(3)
                                  Dish(5) => Memory(4)
                                  Dish(6) => Memory(5)
                                  Dish(7) => Memory(6)
                                  Dish(8) => Memory(7)]))
const map_K_registers = Layout(Dict([Dish(0) => SIMD(4)
                                     Dish(1) => Thread(0)
                                     Dish(2) => Thread(1)
                                     Dish(3) => Thread(2)
                                     Dish(4) => Thread(3)
                                     Dish(5) => Thread(4)
                                     Dish(6) => Warp(0)
                                     Dish(7) => Warp(1)
                                     Dish(8) => Warp(2)]))

# Layout of E in shared memory see (49) e.
const map_E_shared = Layout(Dict([Cplx(0) => SIMD(2)
                                  Polr(0) => SIMD(3)
                                  DishJ(0) => Memory(2)
                                  DishJ(1) => Memory(3)
                                  DishJ(2) => Memory(4)
                                  DishJ(3) => Memory(5)
                                  DishJ(4) => Memory(6)
                                  DishI(0) => Memory(7)
                                  DishI(1) => Memory(8)
                                  DishI(2) => Memory(9)
                                  DishI(3) => Memory(10)
                                  DishI(4) => Memory(11)
                                  Time(0) => SIMD(4)
                                  Time(1) => Memory(0)
                                  Time(2) => Memory(1)]))

# Layout of E to access the shared memory see (56)
const map_E′_registers = Layout(Dict([Cplx(0) => SIMD(2)
                                      Polr(0) => SIMD(3)
                                      DishJ(0) => Thread(2)
                                      DishJ(1) => Thread(3)
                                      DishJ(2) => Warp(2)
                                      DishJ(3) => Warp(3)
                                      DishJ(4) => Warp(4)
                                      DishI(0) => Register(0)
                                      DishI(1) => Thread(4)
                                      DishI(2) => Thread(0)
                                      DishI(3) => Thread(1)
                                      DishI(4) => Register(1)
                                      Time(0) => SIMD(4)
                                      Time(1) => Warp(0)
                                      Time(2) => Warp(1)]))

# Layout of Gin in registers see (60)
const map_Gin_registers = Layout(Dict([Cplx(0) => Register(2)
                                       Polr(0) => Thread(4)
                                       DishJ(0) => Thread(2)
                                       DishJ(1) => Thread(3)
                                       DishJ(2) => Warp(2)
                                       DishJ(3) => Warp(3)
                                       DishJ(4) => Warp(4)
                                       DishI(0) => SIMD(3)
                                       DishI(1) => SIMD(4)
                                       DishI(2) => Thread(0)
                                       DishI(3) => Thread(1)
                                       DishI(4) => Register(1)]))
# Layout of Gin in memory
const map_Gin_memory = Layout(Dict([Cplx(0) => Memory(5)
                                    Polr(0) => Memory(4)
                                    DishJ(0) => Memory(2)
                                    DishJ(1) => Memory(3)
                                    DishJ(2) => Memory(7)
                                    DishJ(3) => Memory(8)
                                    DishJ(4) => Memory(9)
                                    DishI(0) => SIMD(3)
                                    DishI(1) => SIMD(4)
                                    DishI(2) => Memory(0)
                                    DishI(3) => Memory(1)
                                    DishI(4) => Memory(6)]))

# Layout of Gmid in registers see (70)
const map_Gmid_registers = Layout(Dict([BeamI(0) => Thread(2)
                                        BeamI(1) => Thread(3)
                                        BeamI(2) => Thread(4)
                                        BeamI(3) => SIMD(3)
                                        BeamI(4) => SIMD(4)
                                        # BeamI(5) => Loop(0)
                                        # BeamI(6) => Loop(1)
                                        ]))
# Layout of Gmid in memory
const map_Gmid_memory = Layout(Dict([BeamI(0) => Memory(0 + 2)
                                     BeamI(1) => Memory(0 + 3)
                                     BeamI(2) => Memory(0 + 4)
                                     BeamI(3) => SIMD(3)
                                     BeamI(4) => SIMD(4)
                                     # BeamI(5) => Loop(0)
                                     # BeamI(6) => Loop(1)
                                     ]))

# Layout of 1d N-S FT transformation matrix
const map_Ans_registers = Layout(Dict([DishI(0) => SIMD(3)
                                       DishI(1) => SIMD(4)
                                       DishI(2) => Thread(0)
                                       DishI(3) => Thread(1)
                                       BeamI(0) => Thread(2)
                                       BeamI(1) => Thread(3)
                                       BeamI(2) => Thread(4)
                                       BeamI(3) => Register(0)
                                       Cplx(0) => Register(1)]))
const map_Ans_memory = Layout(Dict([DishI(0) => SIMD(3)
                                    DishI(1) => SIMD(4)
                                    DishI(2) => Memory(0)
                                    DishI(3) => Memory(1)
                                    BeamI(0) => Memory(2)
                                    BeamI(1) => Memory(3)
                                    BeamI(2) => Memory(4)
                                    BeamI(3) => Memory(5)
                                    Cplx(0) => Memory(6)]))

# Layout of C in first 1d Fourier transform in registers ([m,n])
const map_Fpre_registers = Layout(Dict([Polr(0) => Thread(1)
                                        BeamI(0) => Thread(2)
                                        BeamI(1) => Thread(3)
                                        BeamI(2) => Thread(4)
                                        BeamI(3) => Register(1)
                                        DishJ(0) => Register(0)
                                        DishJ(1) => Register(2)
                                        DishJ(2) => Warp(2)
                                        DishJ(3) => Warp(3)
                                        DishJ(4) => Warp(4)
                                        Time(0) => Thread(0)
                                        Time(1) => Warp(0)
                                        Time(2) => Warp(1)]))

# Layout of F̃ in shared memory
# TOOD: Use layout from secion 3.1
const map_F̃_shared = Layout(Dict([Cplx(0) => Memory(10 + 2)
                                   Polr(0) => Memory(0 + 1)
                                   BeamI(0) => Memory(0 + 2)
                                   BeamI(1) => Memory(0 + 3)
                                   BeamI(2) => Memory(0 + 4)
                                   BeamI(3) => Memory(10 + 0)
                                   BeamI(4) => Memory(10 + 1)
                                   DishJ(0) => SIMD(3)
                                   DishJ(1) => SIMD(4)
                                   DishJ(2) => Memory(5 + 2)
                                   DishJ(3) => Memory(5 + 3)
                                   DishJ(4) => Memory(5 + 4)
                                   Time(0) => Memory(0 + 0)
                                   Time(1) => Memory(5 + 0)
                                   Time(2) => Memory(5 + 1)]))

# Layout of F̃ in registers
const map_F̃_registers = Layout(Dict([Cplx(0) => Register(1)
                                      Polr(0) => Thread(4)
                                      BeamI(0) => Warp(0)
                                      BeamI(1) => Warp(1)
                                      BeamI(2) => Warp(2)
                                      BeamI(3) => Warp(3)
                                      BeamI(4) => Warp(4)
                                      DishJ(0) => SIMD(3)
                                      DishJ(1) => SIMD(4)
                                      DishJ(2) => Thread(0)
                                      DishJ(3) => Thread(1)
                                      DishJ(4) => Register(2)
                                      Time(0) => Thread(3)
                                      Time(1) => Thread(2)
                                      Time(2) => Register(0)]))

# Layout of 1d E-W FT transformation matrix
const map_Aew_registers = Layout(Dict([DishJ(0) => SIMD(3)
                                       DishJ(1) => SIMD(4)
                                       DishJ(2) => Thread(0)
                                       DishJ(3) => Thread(1)
                                       BeamJ(0) => Thread(2)
                                       BeamJ(1) => Thread(3)
                                       BeamJ(2) => Thread(4)
                                       BeamJ(3) => Register(0)
                                       Cplx(0) => Register(1)]))
const map_Aew_memory = Layout(Dict([DishJ(0) => SIMD(3)
                                    DishJ(1) => SIMD(4)
                                    DishJ(2) => Memory(0)
                                    DishJ(3) => Memory(1)
                                    BeamJ(0) => Memory(2)
                                    BeamJ(1) => Memory(3)
                                    BeamJ(2) => Memory(4)
                                    BeamJ(3) => Memory(5)
                                    Cplx(0) => Memory(6)]))

# Layout of C in second 1d Fourier transform in registers ([m,n])
const map_Jpre_registers = Layout(Dict([Polr(0) => Thread(1)
                                        BeamI(0) => Warp(0)
                                        BeamI(1) => Warp(1)
                                        BeamI(2) => Warp(2)
                                        BeamI(3) => Warp(3)
                                        BeamI(4) => Warp(4)
                                        BeamJ(0) => Thread(2)
                                        BeamJ(1) => Thread(3)
                                        BeamJ(2) => Thread(4)
                                        BeamJ(3) => Register(1)
                                        Time(0) => Thread(0)
                                        Time(1) => Register(0)
                                        Time(2) => Register(2)]))

# Layout of fI in global memory
const map_fI_memory = Layout(Dict([BeamI(0) => Memory(5 + 0)
                                   BeamI(1) => Memory(5 + 1)
                                   BeamI(2) => Memory(5 + 2)
                                   BeamI(3) => Memory(5 + 3)
                                   BeamI(4) => Memory(5 + 4)
                                   BeamJ(0) => Memory(0 + 2)
                                   BeamJ(1) => Memory(0 + 3)
                                   BeamJ(2) => Memory(0 + 4)
                                   BeamJ(3) => Memory(0 + 0)
                                   BeamJ(4) => Memory(0 + 1)]))

################################################################################

function zero_dishes!(steps::Vector{AbstractStep}, env::Environment)
    constant!(steps, env, :Ezero, map_E′_registers, 0)
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
    store!(steps, env, :E′d0, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:Kd0)
    store!(steps, env, :E′d1, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:Kd1)
    return nothing
end

function fourier1!(steps::Vector{AbstractStep}, env::Environment)
    # Load E
    load!(steps, env, :E0, map_E′_registers, :E_shared, map_E_shared)
    permute!(steps, env, :E1, :E0, Register(0), SIMD(3))   # (57)
    permute!(steps, env, :E2, :E1, Register(0), Thread(4)) # (58)
    permute!(steps, env, :E3, :E2, Register(0), SIMD(4))   # (59)
    @assert env[:E3] ==
            Layout(Dict(Cplx(0) => SIMD(2), Polr(0) => Thread(4), DishI(0) => SIMD(3), DishI(1) => SIMD(4), DishI(2) => Thread(0),
                        DishI(3) => Thread(1), DishI(4) => Register(1), DishJ(0) => Thread(2), DishJ(1) => Thread(3),
                        DishJ(2) => Warp(2), DishJ(3) => Warp(3), DishJ(4) => Warp(4), Time(0) => Register(0), Time(1) => Warp(0),
                        Time(2) => Warp(1)))
    widen!(steps, env, :E4, :E3, Cplx(0) => Register(2))

    # Load Gin
    load!(steps, env, :Gin0, map_Gin_registers, :Gin_mem, map_Gin_memory)

    # Apply input gains
    # TODO: Use a sparse matrix tensor core multiplication instead
    # TODO: As alternative, keep values as `int8` and multiply two at a time
    widen2!(steps, env, :Gin1, :Gin0, SIMD(3) => Register(3), SIMD(4) => Register(4))
    widen2!(steps, env, :E5, :E4, SIMD(3) => Register(3), SIMD(4) => Register(4))
    split!(steps, env, :Ginre, :Ginim, :Gin1, Cplx(0))
    split!(steps, env, :Ere, :Eim, :E5, Cplx(0))
    apply!(steps, env, :Ẽre, :Ere, :Eim, :Ginre, :Ginim, (Ere, Eim, Gre, Gim) -> :(($Gre * $Ere - $Gim * $Eim) >> 0x04))
    apply!(steps, env, :Ẽim, :Ere, :Eim, :Ginre, :Ginim, (Ere, Eim, Gre, Gim) -> :(($Gre * $Eim + $Gim * $Ere) >> 0x04))
    merge!(steps, env, :Ẽ0, :Ẽre, :Ẽim, Cplx(0) => Register(2))
    narrow2!(steps, env, :Ẽ1, :Ẽ0, Register(3) => SIMD(3), Register(4) => SIMD(4))

    permute!(steps, env, :Ẽ2, :Ẽ1, Register(1), Register(2)) # (63)
    @assert env[:Ẽ2] == Layout(Dict(Cplx(0) => Register(1), Polr(0) => Thread(4), DishI(0) => SIMD(3), DishI(1) => SIMD(4),
                        DishI(2) => Thread(0), DishI(3) => Thread(1), DishI(4) => Register(2), DishJ(0) => Thread(2),
                        DishJ(1) => Thread(3), DishJ(2) => Warp(2), DishJ(3) => Warp(3), DishJ(4) => Warp(4),
                        Time(0) => Register(0), Time(1) => Warp(0), Time(2) => Warp(1)))
    permute!(steps, env, :Ẽ3, :Ẽ2, Register(0), Thread(3)) # (64)

    # Load A
    # TODO: Load from shared memory
    load!(steps, env, :A, map_Ans_registers, :Ans_mem, map_Ans_memory)

    # Fourier transform
    # fourier!(steps, env, :F, :A, :Ẽ3)
    begin
        split!(steps, env, :Are, :Aim, :A, Cplx(0))
        addsub!(steps, env, :Epm, :Ẽ3, DishI(4) => PlMi(0))
        split!(steps, env, :Ep, :Em, :Epm, PlMi(0))
        split!(steps, env, :Epre, :Epim, :Ep, Cplx(0))
        split!(steps, env, :Emre, :Emim, :Em, Cplx(0))

        # Y-plus
        constant!(steps, env, :F0pre, map_Fpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fpre, :Are, :Epre, :F0pre)
        constant!(steps, env, :F0pim, map_Fpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fpim, :Are, :Epim, :F0pim)

        # Y-minus
        constant!(steps, env, :F0mre, map_Fpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fmre′, :Aim, :Emim, :F0mre)
        apply!(steps, env, :Fmre, :Fmre′, expr -> :(-$expr))
        constant!(steps, env, :F0mim, map_Fpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Fmim, :Aim, :Emre, :F0mim)

        # Merge output
        merge!(steps, env, :Fp, :Fpre, :Fpim, Cplx(0) => Register(4))
        merge!(steps, env, :Fm, :Fmre, :Fmim, Cplx(0) => Register(4))
        merge!(steps, env, :Fpm, :Fp, :Fm, PlMi(0) => Register(3))
        addsub!(steps, env, :F, :Fpm, PlMi(0) => BeamI(4))
    end
    # (69)
    @assert env[:F] == Layout(Dict(Cplx(0) => Register(4), Polr(0) => Thread(1), BeamI(0) => Thread(2), BeamI(1) => Thread(3),
                        BeamI(2) => Thread(4), BeamI(3) => Register(1), BeamI(4) => Register(3), DishJ(0) => Register(0),
                        DishJ(1) => Register(2), DishJ(2) => Warp(2), DishJ(3) => Warp(3), DishJ(4) => Warp(4),
                        Time(0) => Thread(0), Time(1) => Warp(0), Time(2) => Warp(1)))

    # Load Gmid
    load!(steps, env, :Gmid0, map_Gmid_registers, :Gmid_mem, map_Gmid_memory)

    # Apply midpoint gains
    # TODO: Use a sparse matrix tensor core multiplication instead?
    # TODO: Use vectorized `Float16` multiplication instead?
    widen2!(steps, env, :Gmid1, :Gmid0, SIMD(3) => Register(1), SIMD(4) => Register(3))
    apply!(steps, env, :F̃0, :F, :Gmid1, (F, G) -> :(max(-63, min(63, ($F * $G) >> 0x0c))))
    narrow2!(steps, env, :F̃1, :F̃0, Register(0) => SIMD(3), Register(2) => SIMD(4))
    move!(steps, env, :F̃2, :F̃1, Register(1) => Register(0))
    move!(steps, env, :F̃3, :F̃2, Register(3) => Register(1))
    move!(steps, env, :F̃4, :F̃3, Register(4) => Register(2))
    # (72)
    @assert env[:F̃4] == Layout(Dict(Cplx(0) => Register(2), Polr(0) => Thread(1), BeamI(0) => Thread(2), BeamI(1) => Thread(3),
                        BeamI(2) => Thread(4), BeamI(3) => Register(0), BeamI(4) => Register(1), DishJ(0) => SIMD(3),
                        DishJ(1) => SIMD(4), DishJ(2) => Warp(2), DishJ(3) => Warp(3), DishJ(4) => Warp(4), Time(0) => Thread(0),
                        Time(1) => Warp(0), Time(2) => Warp(1)))

    # Store F̃
    store!(steps, env, :F̃4, :F̃_shared, map_F̃_shared)

    return nothing
end

function fourier2!(steps::Vector{AbstractStep}, env::Environment)
    # Load F̃
    load!(steps, env, :F̃, map_F̃_registers, :F̃_shared, map_F̃_shared)

    # Load A
    # TODO: Load from shared memory
    load!(steps, env, :A, map_Aew_registers, :Aew_mem, map_Aew_memory)

    # Fourier transform
    # fourier!(steps, env, :J, :A, :F̃)
    begin
        split!(steps, env, :Are, :Aim, :A, Cplx(0))
        addsub!(steps, env, :F̃pm, :F̃, DishJ(4) => PlMi(0))
        split!(steps, env, :F̃p, :F̃m, :F̃pm, PlMi(0))
        split!(steps, env, :F̃pre, :F̃pim, :F̃p, Cplx(0))
        split!(steps, env, :F̃mre, :F̃mim, :F̃m, Cplx(0))

        # Y-plus
        # TODO: Convert half of the results to `Float32` early, the other half late, to use both the FP32 and INT cores?
        constant!(steps, env, :J0pre, map_Jpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jpre, :Are, :F̃pre, :J0pre)
        apply!(steps, env, :fJpre, :Jpre, J -> :(Float32($J)))
        constant!(steps, env, :J0pim, map_Jpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jpim, :Are, :F̃pim, :J0pim)
        apply!(steps, env, :fJpim, :Jpim, J -> :(Float32($J)))

        # Y-minus
        constant!(steps, env, :J0mre, map_Jpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jmre′, :Aim, :F̃mim, :J0mre)
        # apply!(steps, env, :Jmre, :Jmre′, J -> :(-$J))
        apply!(steps, env, :fJmre, :Jmre′, J -> :(-Float32($J)))
        constant!(steps, env, :J0mim, map_Jpre_registers, 0)
        wmma_mma_row_col_m16n16k16_s8!(steps, env, :Jmim, :Aim, :F̃mre, :J0mim)
        apply!(steps, env, :fJmim, :Jmim, J -> :(Float32($J)))

        # Merge output
        merge!(steps, env, :fJp, :fJpre, :fJpim, Cplx(0) => Register(4))
        merge!(steps, env, :fJm, :fJmre, :fJmim, Cplx(0) => Register(4))
        merge!(steps, env, :fJpm, :fJp, :fJm, PlMi(0) => Register(3))
        addsub!(steps, env, :fJ, :fJpm, PlMi(0) => BeamJ(4))
    end
    # (81)
    @assert env[:fJ] ==
            Layout(Dict(Cplx(0) => Register(4), Polr(0) => Thread(1), BeamI(0) => Warp(0), BeamI(1) => Warp(1), BeamI(2) => Warp(2),
                        BeamI(3) => Warp(3), BeamI(4) => Warp(4), BeamJ(0) => Thread(2), BeamJ(1) => Thread(3),
                        BeamJ(2) => Thread(4), BeamJ(3) => Register(1), BeamJ(4) => Register(3), Time(0) => Thread(0),
                        Time(1) => Register(0), Time(2) => Register(2)))

    # Calculate intensities
    apply!(steps, env, :fI1, :fJ, J -> :($J * $J))
    split!(steps, env, :fI1a, :fI1b, :fI1, Cplx(0))
    apply!(steps, env, :fI2, :fI1a, :fI1b, (Ja, Jb) -> :($Ja + $Jb))
    split!(steps, env, :fI2a, :fI2b, :fI2, Time(1))
    apply!(steps, env, :fI3, :fI2a, :fI2b, (Ja, Jb) -> :($Ja + $Jb))
    split!(steps, env, :fI3a, :fI3b, :fI3, Time(2))
    apply!(steps, env, :fI4, :fI3a, :fI3b, (Ja, Jb) -> :($Ja + $Jb))
    # (82), but using Register(1) and Register(3)
    @assert env[:fI4] ==
            Layout(Dict(Polr(0) => Thread(1), BeamI(0) => Warp(0), BeamI(1) => Warp(1), BeamI(2) => Warp(2), BeamI(3) => Warp(3),
                        BeamI(4) => Warp(4), BeamJ(0) => Thread(2), BeamJ(1) => Thread(3), BeamJ(2) => Thread(4),
                        BeamJ(3) => Register(1), BeamJ(4) => Register(3), Time(0) => Thread(0)))
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
    @assert env[:fI8] ==
            Layout(Dict(BeamI(0) => Warp(0), BeamI(1) => Warp(1), BeamI(2) => Warp(2), BeamI(3) => Warp(3), BeamI(4) => Warp(4),
                        BeamJ(0) => Thread(2), BeamJ(1) => Thread(3), BeamJ(2) => Thread(4), BeamJ(3) => Thread(0),
                        BeamJ(4) => Thread(1)))

    # Store fI8
    store!(steps, env, :fI8, :fI_mem, map_fI_memory)

    return nothing
end

################################################################################

steps = AbstractStep[]
env = Environment()

# zero_dishes!(steps, env)
# grid_dishes!(steps, env)
# fourier1!(steps, env)
fourier2!(steps, env)

allsteps = Seq(steps)
println(allsteps)

################################################################################

@eval function runsteps(K_mem, E_mem, E_shared, Gin_mem, Gmid_mem, Ans_mem, Aew_mem, F̃_shared, fI_mem)
    $(code(allsteps))
    return nothing
end

function runcuda()
    K_mem = reinterpret(Int32, Int16[4 + round(Int, sqrt(2) * ij) for ij in 0:511])
    E_mem = Int32[0x01010101 for i in 1:(2^27)]
    Gin_mem = Int32[0x02020202 for i in 1:(2^10)]
    Gmid_mem = Int32[0x02020202 for i in 1:(2^5)]
    Ans_mem = Int32[0x03030303 for i in 1:(2^7)]
    Aew_mem = Int32[0x04040404 for i in 1:(2^7)]

    K_mem = CuArray(K_mem)
    E_mem = CuArray(E_mem)
    Gin_mem = CuArray(Gin_mem)
    Gmid_mem = CuArray(Gmid_mem)
    E_shared = CuArray{Int32}(undef, 2^12)
    Ans_mem = CuArray(Ans_mem)
    Aew_mem = CuArray(Aew_mem)
    F̃_shared = CuArray{Int32}(undef, 2^13)
    fI_mem = CuArray{Float32}(undef, 2^10)

    kernel = @cuda launch = false maxregs = 64 runsteps(K_mem, E_mem, E_shared, Gin_mem, Gmid_mem, Ans_mem, Aew_mem, F̃_shared,
                                                        fI_mem)
    kernel(K_mem, E_mem, E_shared, Gin_mem, Gmid_mem, Ans_mem, Aew_mem, F̃_shared, fI_mem; threads=(32, 32), blocks=1)
    synchronize()

    E_shared = Array(E_shared)
    println(E_shared[1:32] .% UInt32)

    F̃_shared = Array(F̃_shared)
    println(F̃_shared[1:32] .% UInt32)

    fI_mem = Array(fI_mem)
    println(fI_mem[1:32])

    return nothing
end

if CUDA.functional()
    # @device_code_warntype runcuda()
    # @device_code_llvm runcuda()
    # @device_code_ptx runcuda()
    @device_code_sass runcuda()
end
