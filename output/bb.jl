# { Load from memory; Load from memory; Permute Register(0) and SIMD(4); Permute Register(0) and SIMD(3); Permute Thread(2) and Register(2); loop }
#     Inputs: []
#     Outputs: [A, A0, A10, A11, A2, A3, Aim, Are, E0, E2, E2im, E2re, Ecopy, J, J2, J2′, J3, Jper, Jper2, Jper3, Jper4, Jper5, Jper6, Jper7, Jstore, Ju, Ju10, Ju11, Ju2, Ju4, Juim, Juim1, Juim2, Jure, Jureneg, Jureneg1, Jurepos, Jurepos1, s]
#         A::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Register(2)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         A0::Int32
#             Beam(0) => Register(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => SIMD(3)
#             Dish(0) => SIMD(4)
#             Dish(1) => Register(0)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(2)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         A10::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Register(2)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         A11::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         A2::Int32
#             Beam(0) => Register(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => SIMD(3)
#             Dish(0) => Register(0)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(2)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         A3::Int32
#             Beam(0) => Register(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(2)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         Aim::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         Are::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#         E0::Int32
#             Cplx(0) => SIMD(2)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Loop5(0)
#             Dish(3) => Loop5(1)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         E2::Int32
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Loop5(0)
#             Dish(3) => Loop5(1)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         E2im::Int32
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Loop5(0)
#             Dish(3) => Loop5(1)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         E2re::Int32
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Loop5(0)
#             Dish(3) => Loop5(1)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ecopy::Int32
#             Cplx(0) => SIMD(2)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(0)
#             Dish(3) => Register(1)
#             Dish(4) => Thread(0)
#             Dish(5) => Thread(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Thread(3)
#             Time(1) => Thread(4)
#             Time(2) => Register(2)
#             Time(3) => Thread(2)
#             Time(4) => Warp(0)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         J::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         J2::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         J2′::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         J3::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => SIMD(3)
#             Time(4) => SIMD(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => SIMD(3)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Register(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper2::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(0)
#             Time(4) => SIMD(4)
#             Time(5) => SIMD(3)
#             Time(6) => Register(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper3::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Register(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => SIMD(3)
#             Time(6) => Register(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper4::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => SIMD(3)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Register(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper5::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => SIMD(3)
#             Time(1) => Register(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Thread(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper6::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => Register(1)
#             Time(5) => Register(0)
#             Time(6) => Thread(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jper7::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Register(0)
#             Time(3) => Thread(0)
#             Time(4) => Register(1)
#             Time(5) => Thread(2)
#             Time(6) => Thread(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jstore::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Register(0)
#             Time(3) => Register(1)
#             Time(4) => Thread(0)
#             Time(5) => Thread(2)
#             Time(6) => Thread(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ju::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ju10::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => SIMD(4)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ju11::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ju2::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => Register(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Ju4::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Cplx(0) => SIMD(4)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Juim::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Juim1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Juim2::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jure::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jureneg::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jureneg1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jurepos::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         Jurepos1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Warp(0)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Warp(1)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#             Time(7) => Loop1(0)
#             Time(8) => Loop1(1)
#             Time(9) => Loop1(2)
#             Time(10) => Loop1(3)
#             Time(11) => Loop1(4)
#             Time(12) => Loop1(5)
#             Time(13) => Loop1(6)
#             Time(14) => Loop1(7)
#         s::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Freq(0) => Block(0)
#             Freq(1) => Block(1)
#             Freq(2) => Block(2)
#             Freq(3) => Block(3)
#             Freq(4) => Block(4)
#             Freq(5) => Block(5)
#             Freq(6) => Block(6)
#             Freq(7) => Block(7)
#             Freq(8) => Block(8)
#             Freq(9) => Block(9)
#             Polr(0) => Register(5)
#     Unused: []
begin
    begin end
    begin end
    begin end
    begin end
    begin end
    begin
        begin
            begin end
            begin end
            begin end
            begin
                begin end
                begin end
                begin end
                begin end
                begin
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                    begin end
                end
                begin end
                begin end
                begin end
                begin end
                begin end
            end
            begin end
            begin end
            begin end
            begin end
            begin end
            begin end
            begin end
            begin
                Jper_0 = zero(Int4x8)
                Jper_1 = zero(Int4x8)
                Jper_2 = zero(Int4x8)
                Jper_3 = zero(Int4x8)
                Jper_32 = zero(Int4x8)
                Jper_33 = zero(Int4x8)
                Jper_34 = zero(Int4x8)
                Jper_35 = zero(Int4x8)
            end
        end
        begin end
        begin end
        begin end
        begin end
        begin end
        begin end
        begin end
        begin end
    end
end
begin
    begin
        s_0 = @inbounds(
            s_mem[(((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x05 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1]::Int32
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2013 =#
        s_32 = @inbounds(
            s_mem[(((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x05 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + 16 % Int32) + 1]::Int32
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2013 =#
    end
    begin
        (A0_0, A0_1, A0_2, A0_3) = unsafe_load4_global(
            A_mem,
            (
                ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x0a +
                ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x08 +
                ((((threadIdx()).x - Int32(1)) % Int32) & 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1b) << 0x03)
            ) + 1,
        )::NTuple{4,Int8x4}
        (A0_4, A0_5, A0_6, A0_7) = unsafe_load4_global(
            A_mem,
            (
                ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x0a +
                ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x08 +
                ((((threadIdx()).x - Int32(1)) % Int32) & 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1b) << 0x03) +
                32 % Int32
            ) + 1,
        )::NTuple{4,Int8x4}
    end
    begin
        begin
            A2_0 = GPUIndexSpaces.get_lo16(A0_0, A0_1)
            A2_1 = GPUIndexSpaces.get_hi16(A0_0, A0_1)
        end
        begin
            A2_2 = GPUIndexSpaces.get_lo16(A0_2, A0_3)
            A2_3 = GPUIndexSpaces.get_hi16(A0_2, A0_3)
        end
        begin
            A2_4 = GPUIndexSpaces.get_lo16(A0_4, A0_5)
            A2_5 = GPUIndexSpaces.get_hi16(A0_4, A0_5)
        end
        begin
            A2_6 = GPUIndexSpaces.get_lo16(A0_6, A0_7)
            A2_7 = GPUIndexSpaces.get_hi16(A0_6, A0_7)
        end
    end
    begin
        begin
            A3_0 = GPUIndexSpaces.get_lo8(A2_0, A2_1)
            A3_1 = GPUIndexSpaces.get_hi8(A2_0, A2_1)
        end
        begin
            A3_2 = GPUIndexSpaces.get_lo8(A2_2, A2_3)
            A3_3 = GPUIndexSpaces.get_hi8(A2_2, A2_3)
        end
        begin
            A3_4 = GPUIndexSpaces.get_lo8(A2_4, A2_5)
            A3_5 = GPUIndexSpaces.get_hi8(A2_4, A2_5)
        end
        begin
            A3_6 = GPUIndexSpaces.get_lo8(A2_6, A2_7)
            A3_7 = GPUIndexSpaces.get_hi8(A2_6, A2_7)
        end
    end
    begin
        begin
            mask = 0x00000004
            isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
        end
        begin
            A_0 = A3_0
            A_4 = A3_4
            src = if isthread1
                A3_0
            else
                A3_4
            end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_0 = dst
            else
                A_4 = dst
            end
        end
        begin
            A_1 = A3_1
            A_5 = A3_5
            src = if isthread1
                A3_1
            else
                A3_5
            end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_1 = dst
            else
                A_5 = dst
            end
        end
        begin
            A_2 = A3_2
            A_6 = A3_6
            src = if isthread1
                A3_2
            else
                A3_6
            end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_2 = dst
            else
                A_6 = dst
            end
        end
        begin
            A_3 = A3_3
            A_7 = A3_7
            src = if isthread1
                A3_3
            else
                A3_7
            end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_3 = dst
            else
                A_7 = dst
            end
        end
    end
    for loopIdx1 in Int32(0):Int32(32768 ÷ 128 - 1)
        for loopIdx2 in Int32(0):Int32(128 ÷ 32 - 1)
            begin
                (Ecopy_0, Ecopy_1, Ecopy_2, Ecopy_3) = unsafe_load4_global(
                    E_mem,
                    (
                        ((loopIdx2 % Int32) & 0x03) << 0x14 +
                        ((loopIdx1 % Int32) & 0xff) << 0x16 +
                        ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x05 +
                        (
                            ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 +
                            ((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x13
                        ) +
                        (
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x0c +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x10
                        )
                    ) + 1,
                )::NTuple{4,Int4x8}
                (Ecopy_4, Ecopy_5, Ecopy_6, Ecopy_7) = unsafe_load4_global(
                    E_mem,
                    (
                        ((loopIdx2 % Int32) & 0x03) << 0x14 +
                        ((loopIdx1 % Int32) & 0xff) << 0x16 +
                        ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x05 +
                        (
                            ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 +
                            ((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x13
                        ) +
                        (
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x0c +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x10
                        ) +
                        131072 % Int32
                    ) + 1,
                )::NTuple{4,Int4x8}
            end
            begin
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01)) + 1,
                ] = Ecopy_0                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 1 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01)) + 1,
                ] = Ecopy_1                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 2 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01)) + 1,
                ] = Ecopy_2                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 3 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01)) + 1,
                ] = Ecopy_3                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01) + 4 % Int32) + 1,
                ] = Ecopy_4                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 1 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01) + 4 % Int32) + 1,
                ] = Ecopy_5                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 2 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01) + 4 % Int32) + 1,
                ] = Ecopy_6                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
                @inbounds E_shared[
                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02 + 3 % Int32) + 0) + 1,
                    (((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x04 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01) + 4 % Int32) + 1,
                ] = Ecopy_7                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2119 =#
            end
            sync_threads()
            begin
                begin
                    loopIdx3 = 0
                    begin
                        loopIdx4 = 0
                        begin
                            begin
                                if loopIdx4 == 0x0000000000000000
                                    A10_0 = A_0
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_1 = A_1
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_2 = A_2
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_3 = A_3
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_4 = A_4
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_5 = A_5
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_6 = A_6
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_7 = A_7
                                end
                            end
                            begin
                                Jurepos_0 = Int32(0)::Int32
                                Jurepos_1 = Int32(0)::Int32
                            end
                            begin
                                Jureneg_0 = Int32(0)::Int32
                                Jureneg_1 = Int32(0)::Int32
                            end
                            begin
                                Juim_0 = Int32(0)::Int32
                                Juim_1 = Int32(0)::Int32
                            end
                            begin
                                begin
                                    loopIdx5 = 0
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 1
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 2
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 3
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                            end
                            begin
                                Jure_0 = (Jurepos_0 - Jureneg_0)::Int32
                                Jure_1 = (Jurepos_1 - Jureneg_1)::Int32
                            end
                            begin
                                Ju_0 = Jure_0
                                Ju_1 = Jure_1
                                Ju_2 = Juim_0
                                Ju_3 = Juim_1
                            end
                            begin
                                Ju2_0 = ((Ju_0 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_1 = ((Ju_1 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_2 = ((Ju_2 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_3 = ((Ju_3 + Int32(2)) >> UInt32(2))::Int32
                            end
                            begin
                                Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                            end
                            begin
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_0                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_1                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 1
                    begin
                        loopIdx4 = 0
                        begin
                            begin
                                if loopIdx4 == 0x0000000000000000
                                    A10_0 = A_0
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_1 = A_1
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_2 = A_2
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_3 = A_3
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_4 = A_4
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_5 = A_5
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_6 = A_6
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_7 = A_7
                                end
                            end
                            begin
                                Jurepos_0 = Int32(0)::Int32
                                Jurepos_1 = Int32(0)::Int32
                            end
                            begin
                                Jureneg_0 = Int32(0)::Int32
                                Jureneg_1 = Int32(0)::Int32
                            end
                            begin
                                Juim_0 = Int32(0)::Int32
                                Juim_1 = Int32(0)::Int32
                            end
                            begin
                                begin
                                    loopIdx5 = 0
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 1
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 2
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 3
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                            end
                            begin
                                Jure_0 = (Jurepos_0 - Jureneg_0)::Int32
                                Jure_1 = (Jurepos_1 - Jureneg_1)::Int32
                            end
                            begin
                                Ju_0 = Jure_0
                                Ju_1 = Jure_1
                                Ju_2 = Juim_0
                                Ju_3 = Juim_1
                            end
                            begin
                                Ju2_0 = ((Ju_0 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_1 = ((Ju_1 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_2 = ((Ju_2 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_3 = ((Ju_3 + Int32(2)) >> UInt32(2))::Int32
                            end
                            begin
                                Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                            end
                            begin
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_0                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_1                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 2
                    begin
                        loopIdx4 = 0
                        begin
                            begin
                                if loopIdx4 == 0x0000000000000000
                                    A10_0 = A_0
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_1 = A_1
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_2 = A_2
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_3 = A_3
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_4 = A_4
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_5 = A_5
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_6 = A_6
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_7 = A_7
                                end
                            end
                            begin
                                Jurepos_0 = Int32(0)::Int32
                                Jurepos_1 = Int32(0)::Int32
                            end
                            begin
                                Jureneg_0 = Int32(0)::Int32
                                Jureneg_1 = Int32(0)::Int32
                            end
                            begin
                                Juim_0 = Int32(0)::Int32
                                Juim_1 = Int32(0)::Int32
                            end
                            begin
                                begin
                                    loopIdx5 = 0
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 1
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 2
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 3
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                            end
                            begin
                                Jure_0 = (Jurepos_0 - Jureneg_0)::Int32
                                Jure_1 = (Jurepos_1 - Jureneg_1)::Int32
                            end
                            begin
                                Ju_0 = Jure_0
                                Ju_1 = Jure_1
                                Ju_2 = Juim_0
                                Ju_3 = Juim_1
                            end
                            begin
                                Ju2_0 = ((Ju_0 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_1 = ((Ju_1 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_2 = ((Ju_2 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_3 = ((Ju_3 + Int32(2)) >> UInt32(2))::Int32
                            end
                            begin
                                Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                            end
                            begin
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_0                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_1                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 3
                    begin
                        loopIdx4 = 0
                        begin
                            begin
                                if loopIdx4 == 0x0000000000000000
                                    A10_0 = A_0
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_1 = A_1
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_2 = A_2
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_3 = A_3
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_4 = A_4
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_5 = A_5
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_6 = A_6
                                end
                                if loopIdx4 == 0x0000000000000000
                                    A10_7 = A_7
                                end
                            end
                            begin
                                Jurepos_0 = Int32(0)::Int32
                                Jurepos_1 = Int32(0)::Int32
                            end
                            begin
                                Jureneg_0 = Int32(0)::Int32
                                Jureneg_1 = Int32(0)::Int32
                            end
                            begin
                                Juim_0 = Int32(0)::Int32
                                Juim_1 = Int32(0)::Int32
                            end
                            begin
                                begin
                                    loopIdx5 = 0
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 1
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 2
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                                begin
                                    loopIdx5 = 3
                                    begin
                                        begin
                                            if loopIdx5 == 0x0000000000000000
                                                A11_0 = A10_0
                                            end
                                            if loopIdx5 == 0x0000000000000000
                                                A11_1 = A10_1
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_0 = A10_2
                                            end
                                            if loopIdx5 == 0x0000000000000001
                                                A11_1 = A10_3
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_0 = A10_4
                                            end
                                            if loopIdx5 == 0x0000000000000002
                                                A11_1 = A10_5
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_0 = A10_6
                                            end
                                            if loopIdx5 == 0x0000000000000003
                                                A11_1 = A10_7
                                            end
                                        end
                                        begin
                                            Are = A11_0
                                            Aim = A11_1
                                        end
                                        E0 = @inbounds(
                                            E_shared[
                                                ((loopIdx5 % Int32) & 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x02) + 1,
                                                (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 1,
                                            ]::Int4x8
                                        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2011 =#
                                        (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E0)
                                        begin
                                            E2re = E2_0
                                            E2im = E2_1
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Jurepos_0, Jurepos_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jurepos1_0, Jurepos1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Jureneg_0, Jureneg_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Jureneg1_0, Jureneg1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Are::Int8x4
                                            B_frag = E2im::Int8x4
                                            C_frag = (Juim_0, Juim_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim1_0, Juim1_1) = D_frag
                                        end
                                        begin
                                            A_frag = Aim::Int8x4
                                            B_frag = E2re::Int8x4
                                            C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                            D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                            (Juim2_0, Juim2_1) = D_frag
                                        end
                                        begin
                                            Jurepos_0 = Jurepos1_0
                                            Jurepos_1 = Jurepos1_1
                                        end
                                        begin
                                            Jureneg_0 = Jureneg1_0
                                            Jureneg_1 = Jureneg1_1
                                        end
                                        begin
                                            Juim_0 = Juim2_0
                                            Juim_1 = Juim2_1
                                        end
                                    end
                                end
                            end
                            begin
                                Jure_0 = (Jurepos_0 - Jureneg_0)::Int32
                                Jure_1 = (Jurepos_1 - Jureneg_1)::Int32
                            end
                            begin
                                Ju_0 = Jure_0
                                Ju_1 = Jure_1
                                Ju_2 = Juim_0
                                Ju_3 = Juim_1
                            end
                            begin
                                Ju2_0 = ((Ju_0 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_1 = ((Ju_1 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_2 = ((Ju_2 + Int32(2)) >> UInt32(2))::Int32
                                Ju2_3 = ((Ju_3 + Int32(2)) >> UInt32(2))::Int32
                            end
                            begin
                                Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                            end
                            begin
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_0                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                                @inbounds Ju_shared[
                                    ((((((threadIdx()).y - Int32(1)) % Int32) & 0x01) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02) + 0) + 1,
                                    (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32) + 1,
                                    ((((threadIdx()).y - Int32(1)) % Int32) & 0x02) >>> 0x01 + 1,
                                ] = Ju4_1                                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2117 =#
                            end
                        end
                    end
                end
            end
            sync_threads()
            begin
                Ju10_0 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        (((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 1,
                        0x00 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_8 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32) + 1,
                        0x00 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_16 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32) + 1,
                        0x00 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_24 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32) + 1,
                        0x00 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_32 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        (((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 1,
                        1 % Int32 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_40 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32) + 1,
                        1 % Int32 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_48 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32) + 1,
                        1 % Int32 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
                Ju10_56 = @inbounds(
                    Ju_shared[
                        (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03) + 1,
                        ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32) + 1,
                        1 % Int32 + 1,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2009 =#
            end
            begin
                (Ju11_0, Ju11_4) = convert(NTuple{2,Int32}, Ju10_0)
                (Ju11_8, Ju11_12) = convert(NTuple{2,Int32}, Ju10_8)
                (Ju11_16, Ju11_20) = convert(NTuple{2,Int32}, Ju10_16)
                (Ju11_24, Ju11_28) = convert(NTuple{2,Int32}, Ju10_24)
                (Ju11_32, Ju11_36) = convert(NTuple{2,Int32}, Ju10_32)
                (Ju11_40, Ju11_44) = convert(NTuple{2,Int32}, Ju10_40)
                (Ju11_48, Ju11_52) = convert(NTuple{2,Int32}, Ju10_48)
                (Ju11_56, Ju11_60) = convert(NTuple{2,Int32}, Ju10_56)
            end
            begin
                J_0 = Ju11_0::Int32
                J_4 = Ju11_4::Int32
                J_8 = Ju11_8::Int32
                J_12 = Ju11_12::Int32
                J_16 = Ju11_16::Int32
                J_20 = Ju11_20::Int32
                J_24 = Ju11_24::Int32
                J_28 = Ju11_28::Int32
                J_32 = Ju11_32::Int32
                J_36 = Ju11_36::Int32
                J_40 = Ju11_40::Int32
                J_44 = Ju11_44::Int32
                J_48 = Ju11_48::Int32
                J_52 = Ju11_52::Int32
                J_56 = Ju11_56::Int32
                J_60 = Ju11_60::Int32
            end
            begin
                J2_0 = ((J_0 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_4 = ((J_4 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_8 = ((J_8 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_12 = ((J_12 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_16 = ((J_16 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_20 = ((J_20 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_24 = ((J_24 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_28 = ((J_28 + Int32(1) << (s_0 % UInt32 - UInt32(1))) >> (s_0 % UInt32))::Int32
                J2_32 = ((J_32 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_36 = ((J_36 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_40 = ((J_40 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_44 = ((J_44 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_48 = ((J_48 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_52 = ((J_52 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_56 = ((J_56 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
                J2_60 = ((J_60 + Int32(1) << (s_32 % UInt32 - UInt32(1))) >> (s_32 % UInt32))::Int32
            end
            begin
                J2′_0 = clamp(J2_0, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_4 = clamp(J2_4, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_8 = clamp(J2_8, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_12 = clamp(J2_12, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_16 = clamp(J2_16, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_20 = clamp(J2_20, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_24 = clamp(J2_24, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_28 = clamp(J2_28, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_32 = clamp(J2_32, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_36 = clamp(J2_36, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_40 = clamp(J2_40, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_44 = clamp(J2_44, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_48 = clamp(J2_48, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_52 = clamp(J2_52, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_56 = clamp(J2_56, (-(Int32(0x07))):+(Int32(0x07)))::Int32
                J2′_60 = clamp(J2_60, (-(Int32(0x07))):+(Int32(0x07)))::Int32
            end
            begin
                J3_0 = Int4x8(J2′_0, J2′_4, J2′_8, J2′_12, J2′_16, J2′_20, J2′_24, J2′_28)
                J3_32 = Int4x8(J2′_32, J2′_36, J2′_40, J2′_44, J2′_48, J2′_52, J2′_56, J2′_60)
            end
            begin
                if loopIdx2 == 0x0000000000000000
                    Jper_0 = J3_0
                end
                if loopIdx2 == 0x0000000000000001
                    Jper_1 = J3_0
                end
                if loopIdx2 == 0x0000000000000002
                    Jper_2 = J3_0
                end
                if loopIdx2 == 0x0000000000000003
                    Jper_3 = J3_0
                end
                if loopIdx2 == 0x0000000000000000
                    Jper_32 = J3_32
                end
                if loopIdx2 == 0x0000000000000001
                    Jper_33 = J3_32
                end
                if loopIdx2 == 0x0000000000000002
                    Jper_34 = J3_32
                end
                if loopIdx2 == 0x0000000000000003
                    Jper_35 = J3_32
                end
            end
        end
        begin
            begin
                Jper2_0 = GPUIndexSpaces.get_lo8(Jper_0, Jper_1)
                Jper2_1 = GPUIndexSpaces.get_hi8(Jper_0, Jper_1)
            end
            begin
                Jper2_2 = GPUIndexSpaces.get_lo8(Jper_2, Jper_3)
                Jper2_3 = GPUIndexSpaces.get_hi8(Jper_2, Jper_3)
            end
            begin
                Jper2_32 = GPUIndexSpaces.get_lo8(Jper_32, Jper_33)
                Jper2_33 = GPUIndexSpaces.get_hi8(Jper_32, Jper_33)
            end
            begin
                Jper2_34 = GPUIndexSpaces.get_lo8(Jper_34, Jper_35)
                Jper2_35 = GPUIndexSpaces.get_hi8(Jper_34, Jper_35)
            end
        end
        begin
            begin
                mask = 0x00000001
                isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
            end
            begin
                Jper3_0 = Jper2_0
                Jper3_1 = Jper2_1
                src = if isthread1
                    Jper2_0
                else
                    Jper2_1
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper3_0 = dst
                else
                    Jper3_1 = dst
                end
            end
            begin
                Jper3_2 = Jper2_2
                Jper3_3 = Jper2_3
                src = if isthread1
                    Jper2_2
                else
                    Jper2_3
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper3_2 = dst
                else
                    Jper3_3 = dst
                end
            end
            begin
                Jper3_32 = Jper2_32
                Jper3_33 = Jper2_33
                src = if isthread1
                    Jper2_32
                else
                    Jper2_33
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper3_32 = dst
                else
                    Jper3_33 = dst
                end
            end
            begin
                Jper3_34 = Jper2_34
                Jper3_35 = Jper2_35
                src = if isthread1
                    Jper2_34
                else
                    Jper2_35
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper3_34 = dst
                else
                    Jper3_35 = dst
                end
            end
        end
        begin
            begin
                Jper4_0 = GPUIndexSpaces.get_lo8(Jper3_0, Jper3_1)
                Jper4_1 = GPUIndexSpaces.get_hi8(Jper3_0, Jper3_1)
            end
            begin
                Jper4_2 = GPUIndexSpaces.get_lo8(Jper3_2, Jper3_3)
                Jper4_3 = GPUIndexSpaces.get_hi8(Jper3_2, Jper3_3)
            end
            begin
                Jper4_32 = GPUIndexSpaces.get_lo8(Jper3_32, Jper3_33)
                Jper4_33 = GPUIndexSpaces.get_hi8(Jper3_32, Jper3_33)
            end
            begin
                Jper4_34 = GPUIndexSpaces.get_lo8(Jper3_34, Jper3_35)
                Jper4_35 = GPUIndexSpaces.get_hi8(Jper3_34, Jper3_35)
            end
        end
        begin
            begin
                mask = 0x00000002
                isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
            end
            begin
                Jper5_0 = Jper4_0
                Jper5_2 = Jper4_2
                src = if isthread1
                    Jper4_0
                else
                    Jper4_2
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper5_0 = dst
                else
                    Jper5_2 = dst
                end
            end
            begin
                Jper5_1 = Jper4_1
                Jper5_3 = Jper4_3
                src = if isthread1
                    Jper4_1
                else
                    Jper4_3
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper5_1 = dst
                else
                    Jper5_3 = dst
                end
            end
            begin
                Jper5_32 = Jper4_32
                Jper5_34 = Jper4_34
                src = if isthread1
                    Jper4_32
                else
                    Jper4_34
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper5_32 = dst
                else
                    Jper5_34 = dst
                end
            end
            begin
                Jper5_33 = Jper4_33
                Jper5_35 = Jper4_35
                src = if isthread1
                    Jper4_33
                else
                    Jper4_35
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper5_33 = dst
                else
                    Jper5_35 = dst
                end
            end
        end
        begin
            begin
                Jper6_0 = GPUIndexSpaces.get_lo16(Jper5_0, Jper5_2)
                Jper6_2 = GPUIndexSpaces.get_hi16(Jper5_0, Jper5_2)
            end
            begin
                Jper6_1 = GPUIndexSpaces.get_lo16(Jper5_1, Jper5_3)
                Jper6_3 = GPUIndexSpaces.get_hi16(Jper5_1, Jper5_3)
            end
            begin
                Jper6_32 = GPUIndexSpaces.get_lo16(Jper5_32, Jper5_34)
                Jper6_34 = GPUIndexSpaces.get_hi16(Jper5_32, Jper5_34)
            end
            begin
                Jper6_33 = GPUIndexSpaces.get_lo16(Jper5_33, Jper5_35)
                Jper6_35 = GPUIndexSpaces.get_hi16(Jper5_33, Jper5_35)
            end
        end
        begin
            begin
                mask = 0x00000004
                isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
            end
            begin
                Jper7_0 = Jper6_0
                Jper7_1 = Jper6_1
                src = if isthread1
                    Jper6_0
                else
                    Jper6_1
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper7_0 = dst
                else
                    Jper7_1 = dst
                end
            end
            begin
                Jper7_2 = Jper6_2
                Jper7_3 = Jper6_3
                src = if isthread1
                    Jper6_2
                else
                    Jper6_3
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper7_2 = dst
                else
                    Jper7_3 = dst
                end
            end
            begin
                Jper7_32 = Jper6_32
                Jper7_33 = Jper6_33
                src = if isthread1
                    Jper6_32
                else
                    Jper6_33
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper7_32 = dst
                else
                    Jper7_33 = dst
                end
            end
            begin
                Jper7_34 = Jper6_34
                Jper7_35 = Jper6_35
                src = if isthread1
                    Jper6_34
                else
                    Jper6_35
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jper7_34 = dst
                else
                    Jper7_35 = dst
                end
            end
        end
        begin
            begin
                mask = 0x00000001
                isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
            end
            begin
                Jstore_0 = Jper7_0
                Jstore_2 = Jper7_2
                src = if isthread1
                    Jper7_0
                else
                    Jper7_2
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jstore_0 = dst
                else
                    Jstore_2 = dst
                end
            end
            begin
                Jstore_1 = Jper7_1
                Jstore_3 = Jper7_3
                src = if isthread1
                    Jper7_1
                else
                    Jper7_3
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jstore_1 = dst
                else
                    Jstore_3 = dst
                end
            end
            begin
                Jstore_32 = Jper7_32
                Jstore_34 = Jper7_34
                src = if isthread1
                    Jper7_32
                else
                    Jper7_34
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jstore_32 = dst
                else
                    Jstore_34 = dst
                end
            end
            begin
                Jstore_33 = Jper7_33
                Jstore_35 = Jper7_35
                src = if isthread1
                    Jper7_33
                else
                    Jper7_35
                end
                src′ = src.val::UInt32
                dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
                dst = (Int4x8)(dst′)::Int4x8
                if isthread1
                    Jstore_33 = dst
                else
                    Jstore_35 = dst
                end
            end
        end
        begin
            unsafe_store4_global!(
                J_mem,
                (
                    (
                        ((loopIdx1 % Int32) & 0xff) << 0x05 +
                        ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x0e +
                        ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x1a +
                        (
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x02 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x02) << 0x03 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x15
                        )
                    ) + 0
                ) + 1,
                (Jstore_0, Jstore_1, Jstore_2, Jstore_3),
            )
            unsafe_store4_global!(
                J_mem,
                (
                    (
                        ((loopIdx1 % Int32) & 0xff) << 0x05 +
                        ((((blockIdx()).x - Int32(1)) % Int32) & 0x03ff) << 0x0e +
                        ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x1a +
                        (
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x02 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x02) << 0x03 +
                            ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x15
                        ) +
                        8192 % Int32
                    ) + 0
                ) + 1,
                (Jstore_32, Jstore_33, Jstore_34, Jstore_35),
            )
        end
    end
end
