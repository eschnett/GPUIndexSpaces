# { Load from memory; Load from memory; Split variable; div2; addsub; Split variable; Split variable; Split variable; Set to constant; WMMA::mma 16x16x16; Set to constant; WMMA::mma 16x16x16; Set to constant; WMMA::mma 16x16x16; Set to constant; WMMA::mma 16x16x16; Join variables; Join variables; addsub; addsub; Join variables; Store to memory }
#     Inputs: 
#     Outputs: A, X, Are, Aim, X′, Xpm, Xp, Xm, Xpre, Xpim, Xmre, Xmim, Y0pre, Ypre, Y0mre, Ymre, Y0pim, Ypim, Y0mim, Ymim, Ypmre, Ypmim, Yre, Yim, Y
#         A:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.0
#             Cplx.0 => Register.1
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#         X:
#             Cplx.0 => Register.2
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Dish.4 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Are:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.0
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#         Aim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.0
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#         X′:
#             Cplx.0 => Register.2
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Dish.4 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xpm:
#             Cplx.0 => Register.2
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             PlMi.0 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xp:
#             Cplx.0 => Register.2
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xm:
#             Cplx.0 => Register.2
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xpre:
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xpim:
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xmre:
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Xmim:
#             Dish.0 => SIMD.0
#             Dish.1 => SIMD.1
#             Dish.2 => Thread.0
#             Dish.3 => Thread.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.2
#             Spec.2 => Thread.3
#             Spec.3 => Thread.4
#         Y0pre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ypre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Y0mre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ymre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Y0pim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ypim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Y0mim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ymim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ypmre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             PlMi.0 => Register.4
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Ypmim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             PlMi.0 => Register.4
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Yre:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Beam.4 => Register.4
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Yim:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Beam.4 => Register.4
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
#         Y:
#             Beam.0 => Thread.2
#             Beam.1 => Thread.3
#             Beam.2 => Thread.4
#             Beam.3 => Register.1
#             Beam.4 => Register.4
#             Cplx.0 => Register.3
#             Spec.0 => Register.0
#             Spec.1 => Thread.0
#             Spec.2 => Thread.1
#             Spec.3 => Register.2
begin
    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:240 =#
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:611 =#
        @inbounds A0 = A_mem[1 + ((threadIdx()).x - 1) % Int32]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds A1 = A_mem[1 + (((threadIdx()).x - 1) % Int32 + 32)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds A2 = A_mem[1 + (((threadIdx()).x - 1) % Int32 + 64)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds A3 = A_mem[1 + (((threadIdx()).x - 1) % Int32 + 96)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:611 =#
        @inbounds X0 = X_mem[1 + ((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X1 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + 8)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X2 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + 4)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X3 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + (4 + 8))]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X4 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + 128)]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X5 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + (8 + 128))]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X6 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + (4 + 128))]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
        @inbounds X7 = X_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x02) + (4 + 8 + 128))]        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:604 =#
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:353 =#
        Are0 = A0
        Are1 = A1
        Aim0 = A2
        Aim1 = A3
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:822 =#
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′0 = bitmerge(X0 >>> 0x01, X0, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′1 = bitmerge(X1 >>> 0x01, X1, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′2 = bitmerge(X2 >>> 0x01, X2, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′3 = bitmerge(X3 >>> 0x01, X3, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′4 = bitmerge(X4 >>> 0x01, X4, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′5 = bitmerge(X5 >>> 0x01, X5, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′6 = bitmerge(X6 >>> 0x01, X6, 0x7f7f7f7f)
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:809 =#
            X′7 = bitmerge(X7 >>> 0x01, X7, 0x7f7f7f7f)
        end
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:886 =#
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:870 =#
            Xpm0 = X′0 + X′2
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:871 =#
            Xpm2 = X′0 - X′2
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:870 =#
            Xpm1 = X′1 + X′3
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:871 =#
            Xpm3 = X′1 - X′3
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:870 =#
            Xpm4 = X′4 + X′6
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:871 =#
            Xpm6 = X′4 - X′6
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:870 =#
            Xpm5 = X′5 + X′7
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:871 =#
            Xpm7 = X′5 - X′7
        end
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:353 =#
        Xp0 = Xpm0
        Xp1 = Xpm1
        Xm0 = Xpm2
        Xm1 = Xpm3
        Xp4 = Xpm4
        Xp5 = Xpm5
        Xm4 = Xpm6
        Xm5 = Xpm7
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:353 =#
        Xpre0 = Xp0
        Xpre1 = Xp1
        Xpim0 = Xp4
        Xpim1 = Xp5
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:353 =#
        Xmre0 = Xm0
        Xmre1 = Xm1
        Xmim0 = Xm4
        Xmim1 = Xm5
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:295 =#
        Y0pre0 = 0 % Int32
        Y0pre1 = 0 % Int32
        Y0pre2 = 0 % Int32
        Y0pre3 = 0 % Int32
        Y0pre4 = 0 % Int32
        Y0pre5 = 0 % Int32
        Y0pre6 = 0 % Int32
        Y0pre7 = 0 % Int32
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:982 =#
        A_frag = (Are0 % UInt32, Are1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:983 =#
        B_frag = (Xpre0 % UInt32, Xpre1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:984 =#
        C_frag = (Y0pre0, Y0pre1, Y0pre2, Y0pre3, Y0pre4, Y0pre5, Y0pre6, Y0pre7)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:985 =#
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:986 =#
        (Ypre0, Ypre1, Ypre2, Ypre3, Ypre4, Ypre5, Ypre6, Ypre7) = D_frag
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:295 =#
        Y0mre0 = 0 % Int32
        Y0mre1 = 0 % Int32
        Y0mre2 = 0 % Int32
        Y0mre3 = 0 % Int32
        Y0mre4 = 0 % Int32
        Y0mre5 = 0 % Int32
        Y0mre6 = 0 % Int32
        Y0mre7 = 0 % Int32
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:982 =#
        A_frag = (Aim0 % UInt32, Aim1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:983 =#
        B_frag = (Xpim0 % UInt32, Xpim1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:984 =#
        C_frag = (Y0mre0, Y0mre1, Y0mre2, Y0mre3, Y0mre4, Y0mre5, Y0mre6, Y0mre7)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:985 =#
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:986 =#
        (Ymre0, Ymre1, Ymre2, Ymre3, Ymre4, Ymre5, Ymre6, Ymre7) = D_frag
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:295 =#
        Y0pim0 = 0 % Int32
        Y0pim1 = 0 % Int32
        Y0pim2 = 0 % Int32
        Y0pim3 = 0 % Int32
        Y0pim4 = 0 % Int32
        Y0pim5 = 0 % Int32
        Y0pim6 = 0 % Int32
        Y0pim7 = 0 % Int32
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:982 =#
        A_frag = (Aim0 % UInt32, Aim1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:983 =#
        B_frag = (Xpre0 % UInt32, Xpre1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:984 =#
        C_frag = (Y0pim0, Y0pim1, Y0pim2, Y0pim3, Y0pim4, Y0pim5, Y0pim6, Y0pim7)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:985 =#
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:986 =#
        (Ypim0, Ypim1, Ypim2, Ypim3, Ypim4, Ypim5, Ypim6, Ypim7) = D_frag
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:295 =#
        Y0mim0 = 0 % Int32
        Y0mim1 = 0 % Int32
        Y0mim2 = 0 % Int32
        Y0mim3 = 0 % Int32
        Y0mim4 = 0 % Int32
        Y0mim5 = 0 % Int32
        Y0mim6 = 0 % Int32
        Y0mim7 = 0 % Int32
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:982 =#
        A_frag = (Are0 % UInt32, Are1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:983 =#
        B_frag = (Xpim0 % UInt32, Xpim1 % UInt32)::NTuple{2,UInt32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:984 =#
        C_frag = (Y0mim0, Y0mim1, Y0mim2, Y0mim3, Y0mim4, Y0mim5, Y0mim6, Y0mim7)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:985 =#
        D_frag = WMMA.llvm_wmma_mma_row_col_m16n16k16_s8(A_frag, B_frag, C_frag)::NTuple{8,Int32}
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:986 =#
        (Ymim0, Ymim1, Ymim2, Ymim3, Ymim4, Ymim5, Ymim6, Ymim7) = D_frag
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:387 =#
        Ypmre0 = Ypre0
        Ypmre1 = Ypre1
        Ypmre2 = Ypre2
        Ypmre3 = Ypre3
        Ypmre4 = Ypre4
        Ypmre5 = Ypre5
        Ypmre6 = Ypre6
        Ypmre7 = Ypre7
        Ypmre16 = Ymre0
        Ypmre17 = Ymre1
        Ypmre18 = Ymre2
        Ypmre19 = Ymre3
        Ypmre20 = Ymre4
        Ypmre21 = Ymre5
        Ypmre22 = Ymre6
        Ypmre23 = Ymre7
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:387 =#
        Ypmim0 = Ypim0
        Ypmim1 = Ypim1
        Ypmim2 = Ypim2
        Ypmim3 = Ypim3
        Ypmim4 = Ypim4
        Ypmim5 = Ypim5
        Ypmim6 = Ypim6
        Ypmim7 = Ypim7
        Ypmim16 = Ymim0
        Ypmim17 = Ymim1
        Ypmim18 = Ymim2
        Ypmim19 = Ymim3
        Ypmim20 = Ymim4
        Ypmim21 = Ymim5
        Ypmim22 = Ymim6
        Ypmim23 = Ymim7
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:886 =#
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre0 = Ypmre0 + Ypmre16
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre16 = Ypmre0 + Ypmre16
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre1 = Ypmre1 + Ypmre17
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre17 = Ypmre1 + Ypmre17
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre2 = Ypmre2 + Ypmre18
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre18 = Ypmre2 + Ypmre18
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre3 = Ypmre3 + Ypmre19
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre19 = Ypmre3 + Ypmre19
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre4 = Ypmre4 + Ypmre20
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre20 = Ypmre4 + Ypmre20
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre5 = Ypmre5 + Ypmre21
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre21 = Ypmre5 + Ypmre21
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre6 = Ypmre6 + Ypmre22
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre22 = Ypmre6 + Ypmre22
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yre7 = Ypmre7 + Ypmre23
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yre23 = Ypmre7 + Ypmre23
        end
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:886 =#
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim0 = Ypmim0 + Ypmim16
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim16 = Ypmim0 - Ypmim16
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim1 = Ypmim1 + Ypmim17
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim17 = Ypmim1 - Ypmim17
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim2 = Ypmim2 + Ypmim18
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim18 = Ypmim2 - Ypmim18
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim3 = Ypmim3 + Ypmim19
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim19 = Ypmim3 - Ypmim19
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim4 = Ypmim4 + Ypmim20
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim20 = Ypmim4 - Ypmim20
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim5 = Ypmim5 + Ypmim21
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim21 = Ypmim5 - Ypmim21
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim6 = Ypmim6 + Ypmim22
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim22 = Ypmim6 - Ypmim22
        end
        begin
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:860 =#
            Yim7 = Ypmim7 + Ypmim23
            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:861 =#
            Yim23 = Ypmim7 - Ypmim23
        end
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:387 =#
        Y0 = Yre0
        Y1 = Yre1
        Y2 = Yre2
        Y3 = Yre3
        Y4 = Yre4
        Y5 = Yre5
        Y6 = Yre6
        Y7 = Yre7
        Y8 = Yim0
        Y9 = Yim1
        Y10 = Yim2
        Y11 = Yim3
        Y12 = Yim4
        Y13 = Yim5
        Y14 = Yim6
        Y15 = Yim7
        Y16 = Yre16
        Y17 = Yre17
        Y18 = Yre18
        Y19 = Yre19
        Y20 = Yre20
        Y21 = Yre21
        Y22 = Yre22
        Y23 = Yre23
        Y24 = Yim16
        Y25 = Yim17
        Y26 = Yim18
        Y27 = Yim19
        Y28 = Yim20
        Y29 = Yim21
        Y30 = Yim22
        Y31 = Yim23
    end
    begin
        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:676 =#
        @inbounds Y_mem[1 + (((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07)] = Y0        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 64)] = Y1        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 8)] = Y2        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (8 + 64))] = Y3        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 512)] = Y4        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (64 + 512))] = Y5        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (8 + 512))] = Y6        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (8 + 64 + 512))] = Y7        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 32)] = Y8        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (32 + 64))] = Y9        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 40)] = Y10        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (40 + 64))] = Y11        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (32 + 512))] = Y12        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (32 + 64 + 512))] = Y13        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (40 + 512))] = Y14        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (40 + 64 + 512))] = Y15        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + 16)] = Y16        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 64))] = Y17        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 8))] = Y18        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 8 + 64))] = Y19        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 512))] = Y20        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 64 + 512))] = Y21        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 8 + 512))] = Y22        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 8 + 64 + 512))] = Y23        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 32))] = Y24        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 32 + 64))] = Y25        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 40))] = Y26        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 40 + 64))] = Y27        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 32 + 512))] = Y28        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 32 + 64 + 512))] = Y29        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 40 + 512))] = Y30        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
        @inbounds Y_mem[1 + ((((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x07) + (16 + 40 + 64 + 512))] = Y31        #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:669 =#
    end
end
