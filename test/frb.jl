using CUDA
using GPUIndexSpaces

################################################################################

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Polr = Index{:Polr}       # 1 bit
const Dish = Index{:Dish}       # 9 bits (only 4 during FT)
const DishI = Index{:DishI}     # 5 bits
const DishJ = Index{:DishI}     # 5 bits
const DishIJ = Index{:DishIJ}   # 10 bits
const Freq = Index{:Freq}       # 4 bits here (0 bits used)
const Time = Index{:Time}       # many bits here (3 bits used)
const Beam = Index{:Beam}       # 4 bits
const Spec = Index{:Spec}       # 4 bits
const PlMi = Index{:PlMi}       # 1 bit (0:+, 1:-)

################################################################################

# Layout of E in global memory
const map_E_global = Mapping(Dict([Cplx(0) => SIMD(0);
                                   Polr(0) => SIMD(1);
                                   Dish(0) => SIMD(2);
                                   Dish(1) => Memory(0);
                                   Dish(2) => Memory(1);
                                   Dish(3) => Memory(2);
                                   Dish(4) => Memory(3);
                                   Dish(5) => Memory(4);
                                   Dish(6) => Memory(5);
                                   Dish(7) => Memory(6);
                                   Dish(8) => Memory(7);
                                   Freq(0) => Memory(8);
                                   Freq(1) => Memory(9);
                                   Freq(2) => Memory(10);
                                   Freq(3) => Memory(11);
                                   Time(0) => Memory(12);
                                   Time(1) => Memory(13);
                                   Time(2) => Memory(14);
                                   Time(3) => Memory(15);
                                   Time(4) => Memory(16);
                                   Time(5) => Memory(17);
                                   Time(6) => Memory(18);
                                   Time(7) => Memory(19);
                                   Time(8) => Memory(20);
                                   Time(9) => Memory(21);
                                   Time(10) => Memory(22);
                                   Time(11) => Memory(23);
                                   Time(12) => Memory(24);
                                   Time(13) => Memory(25);
                                   Time(14) => Memory(26)]))

# Layout of E in registers; see (48)
const map_E_registers = Mapping(Dict([Cplx(0) => SIMD(0);
                                      Polr(0) => SIMD(1);
                                      Dish(0) => SIMD(2);
                                      Dish(1) => Thread(0);
                                      Dish(2) => Thread(1);
                                      Dish(3) => Thread(2);
                                      Dish(4) => Thread(3);
                                      Dish(5) => Thread(4);
                                      Dish(6) => Warp(0);
                                      Dish(7) => Warp(1);
                                      Dish(8) => Warp(2);
                                      Time(0) => Register(0);
                                      Time(1) => Warp(3);
                                      Time(2) => Warp(4)]))

const map_K_memory = Mapping(Dict([Dish(0) => SIMD(0);
                                   Dish(1) => Memory(0);
                                   Dish(2) => Memory(1);
                                   Dish(3) => Memory(2);
                                   Dish(4) => Memory(3);
                                   Dish(5) => Memory(4);
                                   Dish(6) => Memory(5);
                                   Dish(7) => Memory(6);
                                   Dish(8) => Memory(7)]))
const map_K_registers = Mapping(Dict([Dish(0) => SIMD(0);
                                      Dish(1) => Thread(0);
                                      Dish(2) => Thread(1);
                                      Dish(3) => Thread(2);
                                      Dish(4) => Thread(3);
                                      Dish(5) => Thread(4);
                                      Dish(6) => Warp(0);
                                      Dish(7) => Warp(1);
                                      Dish(8) => Warp(2)]))

# Layout of E in shared memory; see (49) e.
const map_E_shared = Mapping(Dict([Cplx(0) => SIMD(0);
                                   Polr(0) => SIMD(1);
                                   DishJ(0) => Memory(2);
                                   DishJ(1) => Memory(3);
                                   DishJ(2) => Memory(4);
                                   DishJ(3) => Memory(5);
                                   DishJ(4) => Memory(6);
                                   DishI(0) => Memory(7);
                                   DishI(1) => Memory(8);
                                   DishI(2) => Memory(9);
                                   DishI(3) => Memory(10);
                                   DishI(4) => Memory(11);
                                   Time(0) => SIMD(2);
                                   Time(1) => Memory(0);
                                   Time(2) => Memory(1)]))

# Layout of E to access the shared memory; see (56)
const map_E′_registers = Mapping(Dict([Cplx(0) => SIMD(0);
                                       Polr(0) => SIMD(1);
                                       DishJ(0) => Thread(2);
                                       DishJ(1) => Thread(3);
                                       DishJ(2) => Warp(2);
                                       DishJ(3) => Warp(3);
                                       DishJ(4) => Warp(4);
                                       DishI(0) => Register(0);
                                       DishI(1) => Thread(4);
                                       DishI(2) => Thread(0);
                                       DishI(3) => Thread(1);
                                       DishI(4) => Register(1);
                                       Time(0) => SIMD(2);
                                       Time(1) => Warp(0);
                                       Time(2) => Warp(1)]))

# Layout of Gin in registers; see (60)
const map_Gin_registers = Mapping(Dict([Cplx(0) => Register(0);
                                        Polr(0) => Thread(4);
                                        DishJ(0) => Thread(2);
                                        DishJ(1) => Thread(3);
                                        DishJ(2) => Warp(0); #=???=#
                                        DishJ(3) => Warp(1); #=???=#
                                        DishJ(4) => Warp(2); #=???=#
                                        DishI(0) => SIMD(0);
                                        DishI(1) => SIMD(1);
                                        DishI(2) => Thread(0);
                                        DishI(3) => Thread(1);
                                        DishI(4) => Register(1)]))
# Layout of Gin in memory
const map_Gin_memory = Mapping(Dict([Cplx(0) => Memory(5);
                                     Polr(0) => Memory(4);
                                     DishJ(0) => Memory(2);
                                     DishJ(1) => Memory(3);
                                     DishJ(2) => Memory(7); #=???=#
                                     DishJ(3) => Memory(8); #=???=#
                                     DishJ(4) => Memory(9); #=???=#
                                     DishI(0) => SIMD(0);
                                     DishI(1) => SIMD(1);
                                     DishI(2) => Memory(0);
                                     DishI(3) => Memory(1);
                                     DishI(4) => Memory(6)]))

################################################################################

function zero_dishes!(env::Environment)
    steps = AbstractStep[constant!(env, :Ezero, map_E′_registers, 0);
                         store!(env, :Ezero, :E_shared, map_E_shared)]
    return Seq(steps)
end

function grid_dishes!(env::Environment)
    steps = AbstractStep[load!(env, :E, map_E_registers, :E_mem, map_E_global);
                         permute!(env, :E′, :E, Register(0), SIMD(2));
                         load!(env, :K, map_K_registers, :K_mem, map_K_memory);
                         convert_int16_to_int32!(env, :Kd, :K, Dish(0) => Register(0))
                         split!(env, :Kd0, :Kd1, :Kd, Dish(0))
                         split!(env, :E′d0, :E′d1, :E′, Dish(0));
                         store!(env, :E′d0, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:Kd0);
                         store!(env, :E′d1, :E_shared, map_E_shared; ignore=Set(Dish(d) for d in 1:8), offset=:Kd1)]
    return Seq(steps)
end

function fourier1!(env::Environment)
    steps = AbstractStep[
                         # Load E
                         load!(env, :E, map_E′_registers, :E_shared, map_E_shared);
                         convert_int4_to_int8!(env, :E′, :E, SIMD(0) => Register(2));

                         # Load Gin
                         load!(env, :Gin, map_Gin_registers, :Gin_memory, map_Gin_shared);

                         # Apply gains
                         # TODO: Use a sparse matrix multiplication instead
                         convert_int8_to_int32!(env, :Gin″, :Gin);
                         convert_int8_to_int32!(env, :E″, E′);
                         split!(env, :Ere, :Eim, :E″, Cplx(0));
                         split!(env, :Gre, :Gim, :G″, Cplx(0));
                         apply!(env, :Ẽre, :Gre, :Gim, :Ere, :Eim, (Gre, Gim, Ere, Eim) -> :(($Gre * $Ere - $Gim * $Eim) >> 0x04));
                         apply!(env, :Ẽim, :Gre, :Gim, :Ere, :Eim, (Gre, Gim, Ere, Eim) -> :(($Gre * $Eim + $Gim * $Ere) >> 0x04));
                         merge!(env, :Ẽ, :Ẽre, :Ẽim, Cplx(0) => Register(2));
                         convert_int32_to_int8!(env, :Ẽ, :Ẽ′);

                         # Temporary store
                         store!(env, :Ẽ′, :Ẽ_shared, map_Ẽ_shared)]
    return Seq(steps)
end

"""
    fourier!

1d Fourier transform

Algorithm:
    
    # Convert to spectral representation
    Xpm[PlMi(0)=0] = X[Dish(4)=0] + X[Dish(4)=1]
    Xpm[PlMi(0)=1] = X[Dish(4)=0] - X[Dish(4)=1]
    
    Are = real(exp(i k x))
    Aim = imag(exp(i k x))
    
    # Multiply
    # Note: Combine the negation with the subtraction below
    Ypm[PlMi(0)=0, Cplx(0)=0] =   Are * Xpm[PlMi(0)=0, Cplx(0)=0]
    Ypm[PlMi(0)=0, Cplx(0)=1] =   Are * Xpm[PlMi(0)=0, Cplx(0)=1]
    Ypm[PlMi(0)=1, Cplx(0)=0] = - Aim * Xpm[PlMi(0)=1, Cplx(0)=1]
    Ypm[PlMi(0)=1, Cplx(0)=1] =   Aim * Xpm[PlMi(0)=1, Cplx(0)=0]
    
    # Convert to nodal representation
    Y[Dish(4)=0] = Ypm[PlMi(0)=0] + Ypm[PlMi(0)=1]
    Y[Dish(4)=1] = Ypm[PlMi(0)=0] - Ypm[PlMi(0)=1]
"""
function fourier!(env::Environment, Y::Symbol, A::Symbol, X::Symbol) # cplx::Cplx
    steps = AbstractStep[
                         # Split inputs
                         split!(env, :Are, :Aim, A, Cplx(0));
                         addsub!(env, :Xpm, X, Dish(4) => PlMi(0));
                         split!(env, :Xp, :Xm, :Xpm, PlMi(0));
                         split!(env, :Xpre, :Xpim, :Xp, Cplx(0));
                         split!(env, :Xmre, :Xmim, :Xm, Cplx(0));

                         # Y-plus
                         constant!(env, :Y0pre, map_Ypre_registers, 0);
                         wmma_mma_row_col_m16n16k16_s8!(env, :Ypre, :Are, :Xpre, :Y0pre);
                         constant!(env, :Y0pim, map_Ypre_registers, 0);
                         wmma_mma_row_col_m16n16k16_s8!(env, :Ypim, :Are, :Xpim, :Y0pim);

                         # Y-minus
                         constant!(env, :Y0mre, map_Ypre_registers, 0);
                         wmma_mma_row_col_m16n16k16_s8!(env, :Ymre′, :Aim, :Xmim, :Y0mre);
                         apply!(env, :Ymre, :Ymre′, expr -> :(-$expr));
                         constant!(env, :Y0mim, map_Ypre_registers, 0);
                         wmma_mma_row_col_m16n16k16_s8!(env, :Ymim, :Aim, :Xmre, :Y0mim);

                         # Merge output
                         merge!(env, :Yp, :Ypre, :Ypim, Cplx(0) => Register(3));
                         merge!(env, :Ym, :Ymre, :Ymim, Cplx(0) => Register(3));
                         merge!(env, :Ypm, :Yp, :Ym, PlMi(0) => Register(4));
                         addsub!(env, Y, :Ypm, PlMi(0) => Beam(4))]
    return Seq(steps)
end

################################################################################

env = Environment()
# allsteps = zero_dishes!(env)
# allsteps = grid_dishes!(env)
allsteps = fourier1!(env)
# allsteps = fourier!(env, :Y, :A, :X)
println(allsteps)

################################################################################

@eval function runsteps(K_mem, E_mem, E_shared)
    $(code(allsteps))
    return nothing
end

function runcuda()
    K_mem = reinterpret(Int32, Int16[4 + round(Int, sqrt(2) * ij) for ij in 0:511])
    E_mem = Int32[0x01010101 for i in 1:(2^27)]
    println(E_mem[1:32] .% UInt32)
    K_mem = CuArray(K_mem)
    E_mem = CuArray(E_mem)
    E_shared = CuArray{Int32}(undef, 2^12)
    kernel = @cuda launch = false maxregs = 32 runsteps(K_mem, E_mem, E_shared)
    kernel(K_mem, E_mem, E_shared; threads=(32, 32), blocks=1)
    synchronize()
    E_shared = Array(E_shared)
    println(E_shared[1:32] .% UInt32)
    return nothing
end

if CUDA.functional()
    # @device_code_warntype
    # @device_code_llvm
    # @device_code_ptx
    # @device_code_sass
    @device_code_sass runcuda()
end
