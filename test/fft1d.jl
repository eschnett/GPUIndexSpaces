using CUDA
using GPUIndexSpaces

################################################################################

const Cplx = Index{:Cplx}       # 1 bit (0:re, 1:im)
const Dish = Index{:Dish}       # 5 bits (only 4 during FT)
const Beam = Index{:Beam}       # 4 bits
const Spec = Index{:Spec}       # 4 bits
const PlMi = Index{:PlMi}       # 1 bit (0:+, 1:-)

# Layout of 1d FFT transformation matrix
const map_A_memory = Mapping(Dict([Dish(0) => SIMD(0);
                                   Dish(1) => SIMD(1);
                                   Dish(2) => Memory(0);
                                   Dish(3) => Memory(1);
                                   Beam(0) => Memory(2);
                                   Beam(1) => Memory(3);
                                   Beam(2) => Memory(4);
                                   Beam(3) => Memory(5);
                                   Cplx(0) => Memory(6)]))
const map_A_registers = Mapping(Dict([Dish(0) => SIMD(0);
                                      Dish(1) => SIMD(1);
                                      Dish(2) => Thread(0);
                                      Dish(3) => Thread(1);
                                      Beam(0) => Thread(2);
                                      Beam(1) => Thread(3);
                                      Beam(2) => Thread(4);
                                      Beam(3) => Register(0);
                                      Cplx(0) => Register(1)]))

# Layout of 1d FFT input matrix
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
    steps = AbstractStep[]

    step_load_A = load!(env, :A, map_A_registers, :A_mem, map_A_memory)
    # println(step_load_A)

    step_set_X = load!(env, :X, map_X_registers, :X_mem, map_X_memory)
    # println(step_set_X)

    set_split_Areim = split!(env, :Are, :Aim, :A, Cplx(0))
    # println(set_split_Areim)

    step_nodal2modal_X = nodal2modal!(env, :Xpm, :X, Dish(4) => PlMi(0))
    # println(step_nodal2modal_X)

    set_split_Xpm = split!(env, :Xp, :Xm, :Xpm, PlMi(0))
    # println(set_split_Xpm)

    set_split_Xpreim = split!(env, :Xpre, :Xpim, :Xp, Cplx(0))
    # println(set_split_Xpreim)

    set_split_Xmreim = split!(env, :Xmre, :Xmim, :Xm, Cplx(0))
    # println(set_split_Xmreim)

    # Real part of FT
    step_zero_Y0pre = constant!(env, :Y0pre, map_Ypre_registers, :(Int32(0)))
    # println(step_zero_Y0pre)

    step_multiply_pre = wmma_mma_row_col_m16n16k16_s8!(env, :Ypre, :Are, :Xpre, :Y0pre)
    # println(step_multiply_pre)

    step_zero_Y0mre = constant!(env, :Y0mre, map_Ypre_registers, :(Int32(0)))
    # println(step_zero_Y0mre)

    # Note omitted minus sign
    step_multiply_mre = wmma_mma_row_col_m16n16k16_s8!(env, :Ymre, :Aim, :Xpim, :Y0mre)
    # println(step_multiply_mre)

    # Imaginary part of FT
    step_zero_Y0pim = constant!(env, :Y0pim, map_Ypre_registers, :(Int32(0)))
    # println(step_zero_Y0pim)

    step_multiply_pim = wmma_mma_row_col_m16n16k16_s8!(env, :Ypim, :Aim, :Xpim, :Y0pim)
    # println(step_multiply_pim)

    step_zero_Y0mim = constant!(env, :Y0mim, map_Ypre_registers, :(Int32(0)))
    # println(step_zero_Y0mre)

    # Note omitted minus sign
    step_multiply_mim = wmma_mma_row_col_m16n16k16_s8!(env, :Ymim, :Are, :Xpim, :Y0mim)
    # println(step_multiply_mim)

    step_merge_Yp = merge!(env, :Yp, :Ypre, :Ypim, Cplx(0) => Register(3))
    # println(step_merge_Yp)

    step_merge_Ym = merge!(env, :Ym, :Ymre, :Ymim, Cplx(0) => Register(3))
    # println(step_merge_Ym)

    step_merge_Ypm = merge!(env, :Ypm, :Yp, :Ym, PlMi(0) => Register(4))
    # println(step_merge_Ypm)

    step_modal2nodal_Y = modal2nodal!(env, :Y, :Ypm, PlMi(0) => Beam(4))
    # println(step_modal2nodal_Y)

    step_store_Y = store!(env, :Y, :Y_mem, map_Y_memory)
    # println(step_store_Y)

    return Seq([step_load_A;
                step_set_X;
                set_split_Areim;
                step_nodal2modal_X;
                set_split_Xpm;
                set_split_Xpreim;
                set_split_Xmreim;
                step_zero_Y0pre;
                step_multiply_pre;
                step_zero_Y0mre;
                step_multiply_mre;
                step_zero_Y0pim;
                step_multiply_pim;
                step_zero_Y0mim;
                step_multiply_mim;
                step_merge_Yp;
                step_merge_Ym;
                step_merge_Ypm;
                step_modal2nodal_Y;
                step_store_Y])
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
    X_mem = Int32[0x01010101 for i in 1:(2^8)]
    println(A_mem .% UInt32)
    println(X_mem .% UInt32)
    A_mem = CuArray(A_mem)
    X_mem = CuArray(X_mem)
    Y_mem = CuArray{Int32}(undef, 2^10)
    @cuda blocks = 1 threads = (32, 1) runsteps(A_mem, X_mem, Y_mem)
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
    @device_code_sass runcuda()
end
