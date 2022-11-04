# { Load from memory; Load from memory; Permute Register(0) and SIMD(4); Permute Register(0) and SIMD(3); Permute Thread(1) and Register(2); Permute Thread(2) and Register(3); loop }
#     Inputs: []
#     Outputs: [A, A0, A10, A11, A2, A3, A4, Aim, Are, E0, E2, E2im, E2re, Ecopy, J, J2, J2′, J3, Jper, Jper2, Jper3, Jper4, Jper5, Jper6, Jper7, Jstore, Ju, Ju10, Ju11, Ju11a, Ju11b, Ju12, Ju12a, Ju12b, Ju2, Ju4, Juim, Juim1, Juim2, Jure, Jureneg, Jureneg1, Jurepos, Jurepos1, s]
#         A::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Register(2)
#             Dish(4) => Register(3)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A0::Int32
#             Beam(0) => Register(3)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(3)
#             Dish(0) => SIMD(4)
#             Dish(1) => Register(0)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(1)
#             Dish(4) => Thread(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Register(2)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A10::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Register(2)
#             Dish(4) => Register(3)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A11::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A2::Int32
#             Beam(0) => Register(3)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(3)
#             Dish(0) => Register(0)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(1)
#             Dish(4) => Thread(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Register(2)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A3::Int32
#             Beam(0) => Register(3)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Thread(1)
#             Dish(4) => Thread(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Register(2)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         A4::Int32
#             Beam(0) => Register(3)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Register(1)
#             Dish(3) => Register(2)
#             Dish(4) => Thread(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         Aim::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         Are::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#         E0::Int32
#             Cplx(0) => SIMD(2)
#             Dish(0) => SIMD(3)
#             Dish(1) => SIMD(4)
#             Dish(2) => Loop5(0)
#             Dish(3) => Loop5(1)
#             Dish(4) => Loop5(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Dish(4) => Loop5(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Dish(4) => Loop5(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Dish(4) => Loop5(2)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Dish(6) => Thread(2)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#             Time(0) => Thread(3)
#             Time(1) => Thread(4)
#             Time(2) => Warp(2)
#             Time(3) => Warp(3)
#             Time(4) => Warp(4)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(4)
#             Dish(7) => Register(0)
#             Dish(8) => Register(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish(7) => Register(0)
#             Dish(8) => Register(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#         Ju11a::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish(8) => Register(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#         Ju11b::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish(8) => Register(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#         Ju12::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish(8) => Register(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#         Ju12a::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#         Ju12b::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
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
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Freq(0) => Block(1)
#             Freq(1) => Block(2)
#             Freq(2) => Block(3)
#             Freq(3) => Block(4)
#             Freq(4) => Block(5)
#             Freq(5) => Block(6)
#             Polr(0) => Block(0)
#     Unused: []
begin
    begin
    end
    begin
    end
    begin
    end
    begin
    end
    begin
    end
    begin
    end
    begin
        begin
            begin
            end
            begin
            end
            begin
            end
            begin
                begin
                end
                begin
                end
                begin
                end
                begin
                end
                begin
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                    begin
                    end
                end
                begin
                end
                begin
                end
                begin
                end
                begin
                end
                begin
                end
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            begin
                Jper_0 = zero(Int4x8)
                Jper_1 = zero(Int4x8)
                Jper_2 = zero(Int4x8)
                Jper_3 = zero(Int4x8)
            end
        end
        begin
        end
        begin
        end
        begin
        end
        begin
        end
        begin
        end
        begin
        end
        begin
        end
        begin
        end
    end
end
begin
    s = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2012 =# @inbounds(s_mem[1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x7f) << 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03)]::Int32)
    begin
        (A0_0, A0_1, A0_2, A0_3) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06)))::NTuple{4, Int8x4}
        (A0_4, A0_5, A0_6, A0_7) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + 32 % Int32))::NTuple{4, Int8x4}
        (A0_8, A0_9, A0_10, A0_11) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + 256 % Int32))::NTuple{4, Int8x4}
        (A0_12, A0_13, A0_14, A0_15) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + (32 + 256)))::NTuple{4, Int8x4}
        (A0_16, A0_17, A0_18, A0_19) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + 2048 % Int32))::NTuple{4, Int8x4}
        (A0_20, A0_21, A0_22, A0_23) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + (32 + 2048)))::NTuple{4, Int8x4}
        (A0_24, A0_25, A0_26, A0_27) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + (256 + 2048)))::NTuple{4, Int8x4}
        (A0_28, A0_29, A0_30, A0_31) = unsafe_load4_global(A_mem, 1 + (((((blockIdx()).x - Int32(1)) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x06) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x04 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x06) + (32 + 256 + 2048)))::NTuple{4, Int8x4}
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
        begin
            A2_8 = GPUIndexSpaces.get_lo16(A0_8, A0_9)
            A2_9 = GPUIndexSpaces.get_hi16(A0_8, A0_9)
        end
        begin
            A2_10 = GPUIndexSpaces.get_lo16(A0_10, A0_11)
            A2_11 = GPUIndexSpaces.get_hi16(A0_10, A0_11)
        end
        begin
            A2_12 = GPUIndexSpaces.get_lo16(A0_12, A0_13)
            A2_13 = GPUIndexSpaces.get_hi16(A0_12, A0_13)
        end
        begin
            A2_14 = GPUIndexSpaces.get_lo16(A0_14, A0_15)
            A2_15 = GPUIndexSpaces.get_hi16(A0_14, A0_15)
        end
        begin
            A2_16 = GPUIndexSpaces.get_lo16(A0_16, A0_17)
            A2_17 = GPUIndexSpaces.get_hi16(A0_16, A0_17)
        end
        begin
            A2_18 = GPUIndexSpaces.get_lo16(A0_18, A0_19)
            A2_19 = GPUIndexSpaces.get_hi16(A0_18, A0_19)
        end
        begin
            A2_20 = GPUIndexSpaces.get_lo16(A0_20, A0_21)
            A2_21 = GPUIndexSpaces.get_hi16(A0_20, A0_21)
        end
        begin
            A2_22 = GPUIndexSpaces.get_lo16(A0_22, A0_23)
            A2_23 = GPUIndexSpaces.get_hi16(A0_22, A0_23)
        end
        begin
            A2_24 = GPUIndexSpaces.get_lo16(A0_24, A0_25)
            A2_25 = GPUIndexSpaces.get_hi16(A0_24, A0_25)
        end
        begin
            A2_26 = GPUIndexSpaces.get_lo16(A0_26, A0_27)
            A2_27 = GPUIndexSpaces.get_hi16(A0_26, A0_27)
        end
        begin
            A2_28 = GPUIndexSpaces.get_lo16(A0_28, A0_29)
            A2_29 = GPUIndexSpaces.get_hi16(A0_28, A0_29)
        end
        begin
            A2_30 = GPUIndexSpaces.get_lo16(A0_30, A0_31)
            A2_31 = GPUIndexSpaces.get_hi16(A0_30, A0_31)
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
        begin
            A3_8 = GPUIndexSpaces.get_lo8(A2_8, A2_9)
            A3_9 = GPUIndexSpaces.get_hi8(A2_8, A2_9)
        end
        begin
            A3_10 = GPUIndexSpaces.get_lo8(A2_10, A2_11)
            A3_11 = GPUIndexSpaces.get_hi8(A2_10, A2_11)
        end
        begin
            A3_12 = GPUIndexSpaces.get_lo8(A2_12, A2_13)
            A3_13 = GPUIndexSpaces.get_hi8(A2_12, A2_13)
        end
        begin
            A3_14 = GPUIndexSpaces.get_lo8(A2_14, A2_15)
            A3_15 = GPUIndexSpaces.get_hi8(A2_14, A2_15)
        end
        begin
            A3_16 = GPUIndexSpaces.get_lo8(A2_16, A2_17)
            A3_17 = GPUIndexSpaces.get_hi8(A2_16, A2_17)
        end
        begin
            A3_18 = GPUIndexSpaces.get_lo8(A2_18, A2_19)
            A3_19 = GPUIndexSpaces.get_hi8(A2_18, A2_19)
        end
        begin
            A3_20 = GPUIndexSpaces.get_lo8(A2_20, A2_21)
            A3_21 = GPUIndexSpaces.get_hi8(A2_20, A2_21)
        end
        begin
            A3_22 = GPUIndexSpaces.get_lo8(A2_22, A2_23)
            A3_23 = GPUIndexSpaces.get_hi8(A2_22, A2_23)
        end
        begin
            A3_24 = GPUIndexSpaces.get_lo8(A2_24, A2_25)
            A3_25 = GPUIndexSpaces.get_hi8(A2_24, A2_25)
        end
        begin
            A3_26 = GPUIndexSpaces.get_lo8(A2_26, A2_27)
            A3_27 = GPUIndexSpaces.get_hi8(A2_26, A2_27)
        end
        begin
            A3_28 = GPUIndexSpaces.get_lo8(A2_28, A2_29)
            A3_29 = GPUIndexSpaces.get_hi8(A2_28, A2_29)
        end
        begin
            A3_30 = GPUIndexSpaces.get_lo8(A2_30, A2_31)
            A3_31 = GPUIndexSpaces.get_hi8(A2_30, A2_31)
        end
    end
    begin
        begin
            mask = 0x00000002
            isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
        end
        begin
            A4_0 = A3_0
            A4_4 = A3_4
            src = if isthread1
                    A3_0
                else
                    A3_4
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_0 = dst
            else
                A4_4 = dst
            end
        end
        begin
            A4_1 = A3_1
            A4_5 = A3_5
            src = if isthread1
                    A3_1
                else
                    A3_5
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_1 = dst
            else
                A4_5 = dst
            end
        end
        begin
            A4_2 = A3_2
            A4_6 = A3_6
            src = if isthread1
                    A3_2
                else
                    A3_6
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_2 = dst
            else
                A4_6 = dst
            end
        end
        begin
            A4_3 = A3_3
            A4_7 = A3_7
            src = if isthread1
                    A3_3
                else
                    A3_7
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_3 = dst
            else
                A4_7 = dst
            end
        end
        begin
            A4_8 = A3_8
            A4_12 = A3_12
            src = if isthread1
                    A3_8
                else
                    A3_12
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_8 = dst
            else
                A4_12 = dst
            end
        end
        begin
            A4_9 = A3_9
            A4_13 = A3_13
            src = if isthread1
                    A3_9
                else
                    A3_13
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_9 = dst
            else
                A4_13 = dst
            end
        end
        begin
            A4_10 = A3_10
            A4_14 = A3_14
            src = if isthread1
                    A3_10
                else
                    A3_14
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_10 = dst
            else
                A4_14 = dst
            end
        end
        begin
            A4_11 = A3_11
            A4_15 = A3_15
            src = if isthread1
                    A3_11
                else
                    A3_15
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_11 = dst
            else
                A4_15 = dst
            end
        end
        begin
            A4_16 = A3_16
            A4_20 = A3_20
            src = if isthread1
                    A3_16
                else
                    A3_20
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_16 = dst
            else
                A4_20 = dst
            end
        end
        begin
            A4_17 = A3_17
            A4_21 = A3_21
            src = if isthread1
                    A3_17
                else
                    A3_21
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_17 = dst
            else
                A4_21 = dst
            end
        end
        begin
            A4_18 = A3_18
            A4_22 = A3_22
            src = if isthread1
                    A3_18
                else
                    A3_22
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_18 = dst
            else
                A4_22 = dst
            end
        end
        begin
            A4_19 = A3_19
            A4_23 = A3_23
            src = if isthread1
                    A3_19
                else
                    A3_23
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_19 = dst
            else
                A4_23 = dst
            end
        end
        begin
            A4_24 = A3_24
            A4_28 = A3_28
            src = if isthread1
                    A3_24
                else
                    A3_28
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_24 = dst
            else
                A4_28 = dst
            end
        end
        begin
            A4_25 = A3_25
            A4_29 = A3_29
            src = if isthread1
                    A3_25
                else
                    A3_29
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_25 = dst
            else
                A4_29 = dst
            end
        end
        begin
            A4_26 = A3_26
            A4_30 = A3_30
            src = if isthread1
                    A3_26
                else
                    A3_30
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_26 = dst
            else
                A4_30 = dst
            end
        end
        begin
            A4_27 = A3_27
            A4_31 = A3_31
            src = if isthread1
                    A3_27
                else
                    A3_31
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A4_27 = dst
            else
                A4_31 = dst
            end
        end
    end
    begin
        begin
            mask = 0x00000004
            isthread1 = (((threadIdx()).x - Int32(1)) % Int32) & mask ≠ 0
        end
        begin
            A_0 = A4_0
            A_8 = A4_8
            src = if isthread1
                    A4_0
                else
                    A4_8
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_0 = dst
            else
                A_8 = dst
            end
        end
        begin
            A_1 = A4_1
            A_9 = A4_9
            src = if isthread1
                    A4_1
                else
                    A4_9
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_1 = dst
            else
                A_9 = dst
            end
        end
        begin
            A_2 = A4_2
            A_10 = A4_10
            src = if isthread1
                    A4_2
                else
                    A4_10
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_2 = dst
            else
                A_10 = dst
            end
        end
        begin
            A_3 = A4_3
            A_11 = A4_11
            src = if isthread1
                    A4_3
                else
                    A4_11
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_3 = dst
            else
                A_11 = dst
            end
        end
        begin
            A_4 = A4_4
            A_12 = A4_12
            src = if isthread1
                    A4_4
                else
                    A4_12
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_4 = dst
            else
                A_12 = dst
            end
        end
        begin
            A_5 = A4_5
            A_13 = A4_13
            src = if isthread1
                    A4_5
                else
                    A4_13
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_5 = dst
            else
                A_13 = dst
            end
        end
        begin
            A_6 = A4_6
            A_14 = A4_14
            src = if isthread1
                    A4_6
                else
                    A4_14
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_6 = dst
            else
                A_14 = dst
            end
        end
        begin
            A_7 = A4_7
            A_15 = A4_15
            src = if isthread1
                    A4_7
                else
                    A4_15
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_7 = dst
            else
                A_15 = dst
            end
        end
        begin
            A_16 = A4_16
            A_24 = A4_24
            src = if isthread1
                    A4_16
                else
                    A4_24
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_16 = dst
            else
                A_24 = dst
            end
        end
        begin
            A_17 = A4_17
            A_25 = A4_25
            src = if isthread1
                    A4_17
                else
                    A4_25
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_17 = dst
            else
                A_25 = dst
            end
        end
        begin
            A_18 = A4_18
            A_26 = A4_26
            src = if isthread1
                    A4_18
                else
                    A4_26
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_18 = dst
            else
                A_26 = dst
            end
        end
        begin
            A_19 = A4_19
            A_27 = A4_27
            src = if isthread1
                    A4_19
                else
                    A4_27
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_19 = dst
            else
                A_27 = dst
            end
        end
        begin
            A_20 = A4_20
            A_28 = A4_28
            src = if isthread1
                    A4_20
                else
                    A4_28
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_20 = dst
            else
                A_28 = dst
            end
        end
        begin
            A_21 = A4_21
            A_29 = A4_29
            src = if isthread1
                    A4_21
                else
                    A4_29
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_21 = dst
            else
                A_29 = dst
            end
        end
        begin
            A_22 = A4_22
            A_30 = A4_30
            src = if isthread1
                    A4_22
                else
                    A4_30
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_22 = dst
            else
                A_30 = dst
            end
        end
        begin
            A_23 = A4_23
            A_31 = A4_31
            src = if isthread1
                    A4_23
                else
                    A4_31
                end
            src′ = src.val::UInt32
            dst′ = shfl_xor_sync(0xffffffff, src′, mask)::UInt32
            dst = (Int8x4)(dst′)::Int8x4
            if isthread1
                A_23 = dst
            else
                A_31 = dst
            end
        end
    end
    for loopIdx1 = Int32(0):Int32(32768 ÷ 128 - 1)
        for loopIdx2 = Int32(0):Int32(128 ÷ 32 - 1)
            (Ecopy_0, Ecopy_1, Ecopy_2, Ecopy_3) = unsafe_load4_global(E_mem, 1 + (((loopIdx2 % Int32) & 0x03) << 0x13 + ((loopIdx1 % Int32) & 0xff) << 0x15 + ((((blockIdx()).x - Int32(1)) % Int32) & 0x7f) << 0x07 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x0e) + (((((threadIdx()).x - Int32(1)) % Int32) & 0x07) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x0b)))::NTuple{4, Int4x8}
            begin
                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2116 =# @inbounds E_shared[1 + 0 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07) << 0x02), 1 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03)] = Ecopy_0
                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2116 =# @inbounds E_shared[1 + 0 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07) << 0x02 + 1 % Int32), 1 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03)] = Ecopy_1
                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2116 =# @inbounds E_shared[1 + 0 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07) << 0x02 + 2 % Int32), 1 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03)] = Ecopy_2
                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2116 =# @inbounds E_shared[1 + 0 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07) << 0x02 + 3 % Int32), 1 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03)] = Ecopy_3
            end
            sync_threads()
            begin
                begin
                    loopIdx3 = 0
                    begin
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                        begin
                            loopIdx4 = 1
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 1
                    begin
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                        begin
                            loopIdx4 = 1
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 2
                    begin
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                        begin
                            loopIdx4 = 1
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                    end
                end
                begin
                    loopIdx3 = 3
                    begin
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                        begin
                            loopIdx4 = 1
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
                                    if loopIdx4 == 0x0000000000000000
                                        A10_8 = A_8
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_9 = A_9
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_10 = A_10
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_11 = A_11
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_12 = A_12
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_13 = A_13
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_14 = A_14
                                    end
                                    if loopIdx4 == 0x0000000000000000
                                        A10_15 = A_15
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_0 = A_16
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_1 = A_17
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_2 = A_18
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_3 = A_19
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_4 = A_20
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_5 = A_21
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_6 = A_22
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_7 = A_23
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_8 = A_24
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_9 = A_25
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_10 = A_26
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_11 = A_27
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_12 = A_28
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_13 = A_29
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_14 = A_30
                                    end
                                    if loopIdx4 == 0x0000000000000001
                                        A10_15 = A_31
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 4
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 5
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 6
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                        loopIdx5 = 7
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
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_0 = A10_8
                                                end
                                                if loopIdx5 == 0x0000000000000004
                                                    A11_1 = A10_9
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_0 = A10_10
                                                end
                                                if loopIdx5 == 0x0000000000000005
                                                    A11_1 = A10_11
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_0 = A10_12
                                                end
                                                if loopIdx5 == 0x0000000000000006
                                                    A11_1 = A10_13
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_0 = A10_14
                                                end
                                                if loopIdx5 == 0x0000000000000007
                                                    A11_1 = A10_15
                                                end
                                            end
                                            begin
                                                Are = A11_0
                                                Aim = A11_1
                                            end
                                            E0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2010 =# @inbounds(E_shared[1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x03), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02)]::Int4x8)
                                            (E2_0, E2_1) = convert(NTuple{2, Int8x4}, E0)
                                            begin
                                                E2re = E2_0
                                                E2im = E2_1
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Jurepos_0, Jurepos_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jurepos1_0, Jurepos1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Jureneg_0, Jureneg_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Jureneg1_0, Jureneg1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Are::Int8x4
                                                B_frag = E2im::Int8x4
                                                C_frag = (Juim_0, Juim_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
                                                (Juim1_0, Juim1_1) = D_frag
                                            end
                                            begin
                                                A_frag = Aim::Int8x4
                                                B_frag = E2re::Int8x4
                                                C_frag = (Juim1_0, Juim1_1)::NTuple{2, Int32}
                                                D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2, Int32}
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
                                    Ju2_0 = ((Ju_0 + Int32(4)) >> 3)::Int32
                                    Ju2_1 = ((Ju_1 + Int32(4)) >> 3)::Int32
                                    Ju2_2 = ((Ju_2 + Int32(4)) >> 3)::Int32
                                    Ju2_3 = ((Ju_3 + Int32(4)) >> 3)::Int32
                                end
                                begin
                                    Ju4_0 = Int16x2(Ju2_0, Ju2_2)
                                    Ju4_1 = Int16x2(Ju2_1, Ju2_3)
                                end
                                begin
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_0
                                    #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2114 =# @inbounds Ju_shared[1 + 0 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x1c) >>> 0x02), 1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x03) << 0x01 + 1 % Int32), 1 + (((threadIdx()).y - Int32(1)) % Int32) & 0x03] = Ju4_1
                                end
                            end
                        end
                    end
                end
            end
            sync_threads()
            begin
                Ju10_0 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + (((threadIdx()).x - Int32(1)) % Int32) & 0x07, 1 + 0x00]::Int16x2)
                Ju10_1 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + (((threadIdx()).x - Int32(1)) % Int32) & 0x07, 1 + 1 % Int32]::Int16x2)
                Ju10_2 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + (((threadIdx()).x - Int32(1)) % Int32) & 0x07, 1 + 2 % Int32]::Int16x2)
                Ju10_3 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + (((threadIdx()).x - Int32(1)) % Int32) & 0x07, 1 + 3 % Int32]::Int16x2)
                Ju10_8 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32), 1 + 0x00]::Int16x2)
                Ju10_9 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32), 1 + 1 % Int32]::Int16x2)
                Ju10_10 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32), 1 + 2 % Int32]::Int16x2)
                Ju10_11 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 8 % Int32), 1 + 3 % Int32]::Int16x2)
                Ju10_16 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32), 1 + 0x00]::Int16x2)
                Ju10_17 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32), 1 + 1 % Int32]::Int16x2)
                Ju10_18 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32), 1 + 2 % Int32]::Int16x2)
                Ju10_19 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 16 % Int32), 1 + 3 % Int32]::Int16x2)
                Ju10_24 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32), 1 + 0x00]::Int16x2)
                Ju10_25 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32), 1 + 1 % Int32]::Int16x2)
                Ju10_26 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32), 1 + 2 % Int32]::Int16x2)
                Ju10_27 = #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:2008 =# @inbounds(Ju_shared[1 + (((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) >>> 0x03), 1 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x07 + 24 % Int32), 1 + 3 % Int32]::Int16x2)
            end
            begin
                (Ju11_0, Ju11_4) = convert(NTuple{2, Int32}, Ju10_0)
                (Ju11_1, Ju11_5) = convert(NTuple{2, Int32}, Ju10_1)
                (Ju11_2, Ju11_6) = convert(NTuple{2, Int32}, Ju10_2)
                (Ju11_3, Ju11_7) = convert(NTuple{2, Int32}, Ju10_3)
                (Ju11_8, Ju11_12) = convert(NTuple{2, Int32}, Ju10_8)
                (Ju11_9, Ju11_13) = convert(NTuple{2, Int32}, Ju10_9)
                (Ju11_10, Ju11_14) = convert(NTuple{2, Int32}, Ju10_10)
                (Ju11_11, Ju11_15) = convert(NTuple{2, Int32}, Ju10_11)
                (Ju11_16, Ju11_20) = convert(NTuple{2, Int32}, Ju10_16)
                (Ju11_17, Ju11_21) = convert(NTuple{2, Int32}, Ju10_17)
                (Ju11_18, Ju11_22) = convert(NTuple{2, Int32}, Ju10_18)
                (Ju11_19, Ju11_23) = convert(NTuple{2, Int32}, Ju10_19)
                (Ju11_24, Ju11_28) = convert(NTuple{2, Int32}, Ju10_24)
                (Ju11_25, Ju11_29) = convert(NTuple{2, Int32}, Ju10_25)
                (Ju11_26, Ju11_30) = convert(NTuple{2, Int32}, Ju10_26)
                (Ju11_27, Ju11_31) = convert(NTuple{2, Int32}, Ju10_27)
            end
            begin
                Ju11a_0 = Ju11_0
                Ju11b_0 = Ju11_1
                Ju11a_2 = Ju11_2
                Ju11b_2 = Ju11_3
                Ju11a_4 = Ju11_4
                Ju11b_4 = Ju11_5
                Ju11a_6 = Ju11_6
                Ju11b_6 = Ju11_7
                Ju11a_8 = Ju11_8
                Ju11b_8 = Ju11_9
                Ju11a_10 = Ju11_10
                Ju11b_10 = Ju11_11
                Ju11a_12 = Ju11_12
                Ju11b_12 = Ju11_13
                Ju11a_14 = Ju11_14
                Ju11b_14 = Ju11_15
                Ju11a_16 = Ju11_16
                Ju11b_16 = Ju11_17
                Ju11a_18 = Ju11_18
                Ju11b_18 = Ju11_19
                Ju11a_20 = Ju11_20
                Ju11b_20 = Ju11_21
                Ju11a_22 = Ju11_22
                Ju11b_22 = Ju11_23
                Ju11a_24 = Ju11_24
                Ju11b_24 = Ju11_25
                Ju11a_26 = Ju11_26
                Ju11b_26 = Ju11_27
                Ju11a_28 = Ju11_28
                Ju11b_28 = Ju11_29
                Ju11a_30 = Ju11_30
                Ju11b_30 = Ju11_31
            end
            begin
                Ju12_0 = (Ju11a_0 + Ju11b_0)::Int32
                Ju12_2 = (Ju11a_2 + Ju11b_2)::Int32
                Ju12_4 = (Ju11a_4 + Ju11b_4)::Int32
                Ju12_6 = (Ju11a_6 + Ju11b_6)::Int32
                Ju12_8 = (Ju11a_8 + Ju11b_8)::Int32
                Ju12_10 = (Ju11a_10 + Ju11b_10)::Int32
                Ju12_12 = (Ju11a_12 + Ju11b_12)::Int32
                Ju12_14 = (Ju11a_14 + Ju11b_14)::Int32
                Ju12_16 = (Ju11a_16 + Ju11b_16)::Int32
                Ju12_18 = (Ju11a_18 + Ju11b_18)::Int32
                Ju12_20 = (Ju11a_20 + Ju11b_20)::Int32
                Ju12_22 = (Ju11a_22 + Ju11b_22)::Int32
                Ju12_24 = (Ju11a_24 + Ju11b_24)::Int32
                Ju12_26 = (Ju11a_26 + Ju11b_26)::Int32
                Ju12_28 = (Ju11a_28 + Ju11b_28)::Int32
                Ju12_30 = (Ju11a_30 + Ju11b_30)::Int32
            end
            begin
                Ju12a_0 = Ju12_0
                Ju12b_0 = Ju12_2
                Ju12a_4 = Ju12_4
                Ju12b_4 = Ju12_6
                Ju12a_8 = Ju12_8
                Ju12b_8 = Ju12_10
                Ju12a_12 = Ju12_12
                Ju12b_12 = Ju12_14
                Ju12a_16 = Ju12_16
                Ju12b_16 = Ju12_18
                Ju12a_20 = Ju12_20
                Ju12b_20 = Ju12_22
                Ju12a_24 = Ju12_24
                Ju12b_24 = Ju12_26
                Ju12a_28 = Ju12_28
                Ju12b_28 = Ju12_30
            end
            begin
                J_0 = (Ju12a_0 + Ju12b_0)::Int32
                J_4 = (Ju12a_4 + Ju12b_4)::Int32
                J_8 = (Ju12a_8 + Ju12b_8)::Int32
                J_12 = (Ju12a_12 + Ju12b_12)::Int32
                J_16 = (Ju12a_16 + Ju12b_16)::Int32
                J_20 = (Ju12a_20 + Ju12b_20)::Int32
                J_24 = (Ju12a_24 + Ju12b_24)::Int32
                J_28 = (Ju12a_28 + Ju12b_28)::Int32
            end
            begin
                J2_0 = ((J_0 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_4 = ((J_4 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_8 = ((J_8 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_12 = ((J_12 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_16 = ((J_16 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_20 = ((J_20 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_24 = ((J_24 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
                J2_28 = ((J_28 + Int32(1) << (s % UInt32 - UInt32(1))) >> (s % UInt32))::Int32
            end
            begin
                J2′_0 = clamp(J2_0, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_4 = clamp(J2_4, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_8 = clamp(J2_8, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_12 = clamp(J2_12, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_16 = clamp(J2_16, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_20 = clamp(J2_20, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_24 = clamp(J2_24, -(Int32(0x07)):+(Int32(0x07)))::Int32
                J2′_28 = clamp(J2_28, -(Int32(0x07)):+(Int32(0x07)))::Int32
            end
            J3 = Int4x8(J2′_0, J2′_4, J2′_8, J2′_12, J2′_16, J2′_20, J2′_24, J2′_28)
            begin
                if loopIdx2 == 0x0000000000000000
                    Jper_0 = J3
                end
                if loopIdx2 == 0x0000000000000001
                    Jper_1 = J3
                end
                if loopIdx2 == 0x0000000000000002
                    Jper_2 = J3
                end
                if loopIdx2 == 0x0000000000000003
                    Jper_3 = J3
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
        end
        unsafe_store4_global!(J_mem, 1 + 0 + (((loopIdx1 % Int32) & 0xff) << 0x05 + ((((blockIdx()).x - Int32(1)) % Int32) & 0x7f) << 0x0d + ((((threadIdx()).y - Int32(1)) % Int32) & 0x1f) << 0x16 + (((((threadIdx()).x - Int32(1)) % Int32) & 0x04) << 0x01 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x01) << 0x02 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x02) << 0x03 + ((((threadIdx()).x - Int32(1)) % Int32) & 0x18) << 0x11)), (Jstore_0, Jstore_1, Jstore_2, Jstore_3))
    end
end

