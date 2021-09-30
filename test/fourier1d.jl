using CUDA
using GPUIndexSpaces

################################################################################

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Dish = Index{:Dish}       # 5 bits (only 4 during FT)
const Beam = Index{:Beam}       # 4 bits
const Spec = Index{:Spec}       # 4 bits
const PlMi = Index{:PlMi}       # 1 bit (0:+, 1:-)

# Layout of 1d FT transformation matrix
const map_A_registers = Mapping(Dict([Dish(0) => SIMD(0);
                                      Dish(1) => SIMD(1);
                                      Dish(2) => Thread(0);
                                      Dish(3) => Thread(1);
                                      Beam(0) => Thread(2);
                                      Beam(1) => Thread(3);
                                      Beam(2) => Thread(4);
                                      Beam(3) => Register(0);
                                      Cplx(0) => Register(1)]))
const map_A_memory = Mapping(Dict([Dish(0) => SIMD(0);
                                   Dish(1) => SIMD(1);
                                   Dish(2) => Memory(0);
                                   Dish(3) => Memory(1);
                                   Beam(0) => Memory(2);
                                   Beam(1) => Memory(3);
                                   Beam(2) => Memory(4);
                                   Beam(3) => Memory(5);
                                   Cplx(0) => Memory(6)]))

# Layout of 1d FT input matrix
const map_X_registers = Mapping(Dict([Cplx(0) => Register(2);
                                      Dish(0) => SIMD(0);
                                      Dish(1) => SIMD(1);
                                      Dish(2) => Thread(0);
                                      Dish(3) => Thread(1);
                                      Dish(4) => Register(1);
                                      Spec(0) => Register(0);
                                      Spec(1) => Thread(2);
                                      Spec(2) => Thread(3);
                                      Spec(3) => Thread(4)]))
const map_X_memory = Mapping(Dict([Dish(0) => SIMD(0);
                                   Dish(1) => SIMD(1);
                                   Dish(2) => Memory(0);
                                   Dish(3) => Memory(1);
                                   Dish(4) => Memory(2);
                                   Spec(0) => Memory(3);
                                   Spec(1) => Memory(4);
                                   Spec(2) => Memory(5);
                                   Spec(3) => Memory(6);
                                   Cplx(0) => Memory(7)]))

# Layout of C in registers ([m,n])
const map_Ypre_registers = Mapping(Dict([Spec(0) => Register(0);
                                         Spec(1) => Thread(0);
                                         Spec(2) => Thread(1);
                                         Spec(3) => Register(2);
                                         Beam(0) => Thread(2);
                                         Beam(1) => Thread(3);
                                         Beam(2) => Thread(4);
                                         Beam(3) => Register(1)]))
const map_Y_memory = Mapping(Dict([Beam(0) => Memory(0);
                                   Beam(1) => Memory(1);
                                   Beam(2) => Memory(2);
                                   Beam(3) => Memory(3);
                                   Beam(4) => Memory(4);
                                   Cplx(0) => Memory(5);
                                   Spec(0) => Memory(6);
                                   Spec(1) => Memory(7);
                                   Spec(2) => Memory(8);
                                   Spec(3) => Memory(9)]))

################################################################################

"""
    fourier!

1d Fourier transform

Algorithm:

    # Convert to 7 bits
    X >>= 1
    
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
    steps = AbstractStep[load!(env, :A, map_A_registers, :A_mem, map_A_memory);
                         load!(env, :X, map_X_registers, :X_mem, map_X_memory);

                         # Split inputs
                         split!(env, :Are, :Aim, :A, Cplx(0));
                         div2!(env, :X′, :X)
                         addsub!(env, :Xpm, :X′, Dish(4) => PlMi(0));
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
                         addsub!(env, :Y, :Ypm, PlMi(0) => Beam(4));

                         # Store output
                         store!(env, :Y, :Y_mem, map_Y_memory)]
    return Seq(steps)
end

################################################################################

env = Environment()
allsteps = fourier!(env, :Y, :A, :X)
println(allsteps)

################################################################################

@eval function runsteps(A_mem, X_mem, Y_mem)
    $(code(allsteps))
    return nothing
end

function runcuda()
    A_mem = Int32[0x01010101 for i in 1:(2^7)]
    X_mem = Int32[0x02020202 for i in 1:(2^8)]
    println(A_mem .% UInt32)
    println(X_mem .% UInt32)
    A_mem = CuArray(A_mem)
    X_mem = CuArray(X_mem)
    Y_mem = CuArray{Int32}(undef, 2^10)
    # kernel = @cuda blocks = 1 threads = (32, 1) maxregs=32 launch=false runsteps(A_mem, X_mem, Y_mem)
    kernel = @cuda launch = false maxregs = 32 runsteps(A_mem, X_mem, Y_mem)
    kernel(A_mem, X_mem, Y_mem; threads=(32, 1), blocks=1)
    synchronize()
    Y_mem = Array(Y_mem)
    println(Y_mem .% UInt32)
    return nothing
end

if CUDA.functional()
    # @device_code_warntype
    # @device_code_llvm
    # @device_code_ptx
    # @device_code_sass
    runcuda()
end
