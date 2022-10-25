# { Load from memory; Rename indices Dict{Index{:Dish}, Index{:Dish′}}(Dish(4) => Dish′(6), Dish(2) => Dish′(4), Dish(5) => Dish′(2), Dish(6) => Dish′(3), Dish(1) => Dish′(1), Dish(3) => Dish′(5), Dish(0) => Dish′(0), Dish(7) => Dish′(7), Dish(8) => Dish′(8)); Permute Register(0) and SIMD(4); Permute Register(0) and SIMD(3); loop }
#     Inputs: []
#     Outputs: [A, A0, A1, A10, A11, A2, Aim, Are, E0, E1, E2, E2im, E2re, Ecopy, J, J2, J2′, J3, Jper, Jper2, Jper3, Jper4, Jper5, Jper6, Jper7, Jstore, Ju, Ju0, Ju1, Ju10, Ju11, Ju11a, Ju11b, Ju12, Ju12a, Ju12b, Ju2, Ju4, Juim, Juim1, Jure, Jure1, Jure2]
#         A::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Register(1)
#             Dish′(5) => Register(2)
#             Dish′(6) => Register(3)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         A0::Int32
#             Beam(0) => Thread(2)
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
#             Dish(3) => Register(2)
#             Dish(4) => Register(3)
#             Dish(5) => Thread(0)
#             Dish(6) => Thread(1)
#             Dish(7) => Warp(0)
#             Dish(8) => Warp(1)
#             Polr(0) => Block(0)
#         A1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(3)
#             Dish′(0) => SIMD(4)
#             Dish′(1) => Register(0)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Register(1)
#             Dish′(5) => Register(2)
#             Dish′(6) => Register(3)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         A10::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Register(1)
#             Dish′(5) => Register(2)
#             Dish′(6) => Register(3)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         A11::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(0)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         A2::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Register(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(3)
#             Dish′(0) => Register(0)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Register(1)
#             Dish′(5) => Register(2)
#             Dish′(6) => Register(3)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         Aim::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#         Are::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
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
#             Polr(0) => Block(0)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         E1::Int32
#             Cplx(0) => SIMD(2)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Loop5(0)
#             Dish′(5) => Loop5(1)
#             Dish′(6) => Loop5(2)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         E2::Int32
#             Cplx(0) => Register(0)
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Loop5(0)
#             Dish′(5) => Loop5(1)
#             Dish′(6) => Loop5(2)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         E2im::Int32
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Loop5(0)
#             Dish′(5) => Loop5(1)
#             Dish′(6) => Loop5(2)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         E2re::Int32
#             Dish′(0) => SIMD(3)
#             Dish′(1) => SIMD(4)
#             Dish′(2) => Thread(0)
#             Dish′(3) => Thread(1)
#             Dish′(4) => Loop5(0)
#             Dish′(5) => Loop5(1)
#             Dish′(6) => Loop5(2)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(2)
#             Time(1) => Thread(3)
#             Time(2) => Thread(4)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
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
#             Polr(0) => Block(0)
#             Time(0) => Thread(3)
#             Time(1) => Thread(4)
#             Time(2) => Warp(2)
#             Time(3) => Warp(3)
#             Time(4) => Warp(4)
#             Time(5) => Loop2(0)
#             Time(6) => Loop2(1)
#         J::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         J2::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         J2′::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         J3::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => SIMD(3)
#             Time(4) => SIMD(4)
#         Jper::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => SIMD(3)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Register(1)
#         Jper2::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(0)
#             Time(4) => SIMD(4)
#             Time(5) => SIMD(3)
#             Time(6) => Register(1)
#         Jper3::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => SIMD(3)
#             Time(6) => Register(1)
#         Jper4::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => SIMD(3)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Register(1)
#         Jper5::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => SIMD(3)
#             Time(1) => Register(1)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => SIMD(4)
#             Time(5) => Register(0)
#             Time(6) => Thread(1)
#         Jper6::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Thread(2)
#             Time(3) => Thread(0)
#             Time(4) => Register(1)
#             Time(5) => Register(0)
#             Time(6) => Thread(1)
#         Jper7::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Register(0)
#             Time(3) => Thread(0)
#             Time(4) => Register(1)
#             Time(5) => Thread(2)
#             Time(6) => Thread(1)
#         Jstore::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(2)
#             Polr(0) => Block(0)
#             Time(0) => SIMD(3)
#             Time(1) => SIMD(4)
#             Time(2) => Register(0)
#             Time(3) => Register(1)
#             Time(4) => Thread(0)
#             Time(5) => Thread(2)
#             Time(6) => Thread(1)
#         Ju::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Ju0::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Ju1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Ju10::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(4)
#             Dish′(7) => Register(0)
#             Dish′(8) => Register(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju11::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish′(7) => Register(0)
#             Dish′(8) => Register(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju11a::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish′(8) => Register(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju11b::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish′(8) => Register(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju12::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Dish′(8) => Register(1)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju12a::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju12b::Int32
#             Beam(0) => Thread(3)
#             Beam(1) => Thread(4)
#             Beam(2) => Warp(0)
#             Beam(3) => Warp(1)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(2)
#             Polr(0) => Block(0)
#             Time(0) => Thread(0)
#             Time(1) => Thread(1)
#             Time(2) => Thread(2)
#             Time(3) => Register(3)
#             Time(4) => Register(4)
#         Ju2::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => Register(1)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Ju4::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Cplx(0) => SIMD(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Juim::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Juim1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Jure::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Jure1::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#         Jure2::Int32
#             Beam(0) => Thread(2)
#             Beam(1) => Thread(3)
#             Beam(2) => Thread(4)
#             Beam(3) => Loop4(0)
#             Beam(4) => Warp(2)
#             Beam(5) => Warp(3)
#             Beam(6) => Warp(4)
#             Dish′(7) => Warp(0)
#             Dish′(8) => Warp(1)
#             Polr(0) => Block(0)
#             Time(0) => Register(0)
#             Time(1) => Thread(0)
#             Time(2) => Thread(1)
#             Time(3) => Loop3(0)
#             Time(4) => Loop3(1)
#     Unused: []
begin
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
                    begin end
                    begin end
                end
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
            begin end
            begin end
            begin end
            begin
                Jper_0 = zero(Int4x8)
                Jper_1 = zero(Int4x8)
                Jper_2 = zero(Int4x8)
                Jper_3 = zero(Int4x8)
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
        A0_0 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_1 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 1 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_2 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 2 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_3 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 3 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_4 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 4 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_5 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 5 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_6 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 6 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_7 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 7 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_8 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 8 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_9 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 9 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_10 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 10 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_11 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 11 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_12 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 12 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_13 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 13 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_14 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 14 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_15 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 15 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_16 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + 2048 % Int32)]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_17 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (1 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_18 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (2 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_19 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (3 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_20 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (4 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_21 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (5 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_22 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (6 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_23 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (7 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_24 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (8 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_25 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (9 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_26 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (10 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_27 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (11 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_28 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (12 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_29 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (13 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_30 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (14 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
        A0_31 = @inbounds(
            A_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x0f + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x06 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x0a) + (((((threadIdx()).x - 1) % Int32) & 0x03) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x1c) << 0x06) + (15 + 2048))]::Int8x4
        ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
    end
    begin
        A1_0 = A0_0
        A1_1 = A0_1
        A1_2 = A0_2
        A1_3 = A0_3
        A1_4 = A0_4
        A1_5 = A0_5
        A1_6 = A0_6
        A1_7 = A0_7
        A1_8 = A0_8
        A1_9 = A0_9
        A1_10 = A0_10
        A1_11 = A0_11
        A1_12 = A0_12
        A1_13 = A0_13
        A1_14 = A0_14
        A1_15 = A0_15
        A1_16 = A0_16
        A1_17 = A0_17
        A1_18 = A0_18
        A1_19 = A0_19
        A1_20 = A0_20
        A1_21 = A0_21
        A1_22 = A0_22
        A1_23 = A0_23
        A1_24 = A0_24
        A1_25 = A0_25
        A1_26 = A0_26
        A1_27 = A0_27
        A1_28 = A0_28
        A1_29 = A0_29
        A1_30 = A0_30
        A1_31 = A0_31
    end
    begin
        begin
            A2_0 = GPUIndexSpaces.get_lo16(A1_0, A1_1)
            A2_1 = GPUIndexSpaces.get_hi16(A1_0, A1_1)
        end
        begin
            A2_2 = GPUIndexSpaces.get_lo16(A1_2, A1_3)
            A2_3 = GPUIndexSpaces.get_hi16(A1_2, A1_3)
        end
        begin
            A2_4 = GPUIndexSpaces.get_lo16(A1_4, A1_5)
            A2_5 = GPUIndexSpaces.get_hi16(A1_4, A1_5)
        end
        begin
            A2_6 = GPUIndexSpaces.get_lo16(A1_6, A1_7)
            A2_7 = GPUIndexSpaces.get_hi16(A1_6, A1_7)
        end
        begin
            A2_8 = GPUIndexSpaces.get_lo16(A1_8, A1_9)
            A2_9 = GPUIndexSpaces.get_hi16(A1_8, A1_9)
        end
        begin
            A2_10 = GPUIndexSpaces.get_lo16(A1_10, A1_11)
            A2_11 = GPUIndexSpaces.get_hi16(A1_10, A1_11)
        end
        begin
            A2_12 = GPUIndexSpaces.get_lo16(A1_12, A1_13)
            A2_13 = GPUIndexSpaces.get_hi16(A1_12, A1_13)
        end
        begin
            A2_14 = GPUIndexSpaces.get_lo16(A1_14, A1_15)
            A2_15 = GPUIndexSpaces.get_hi16(A1_14, A1_15)
        end
        begin
            A2_16 = GPUIndexSpaces.get_lo16(A1_16, A1_17)
            A2_17 = GPUIndexSpaces.get_hi16(A1_16, A1_17)
        end
        begin
            A2_18 = GPUIndexSpaces.get_lo16(A1_18, A1_19)
            A2_19 = GPUIndexSpaces.get_hi16(A1_18, A1_19)
        end
        begin
            A2_20 = GPUIndexSpaces.get_lo16(A1_20, A1_21)
            A2_21 = GPUIndexSpaces.get_hi16(A1_20, A1_21)
        end
        begin
            A2_22 = GPUIndexSpaces.get_lo16(A1_22, A1_23)
            A2_23 = GPUIndexSpaces.get_hi16(A1_22, A1_23)
        end
        begin
            A2_24 = GPUIndexSpaces.get_lo16(A1_24, A1_25)
            A2_25 = GPUIndexSpaces.get_hi16(A1_24, A1_25)
        end
        begin
            A2_26 = GPUIndexSpaces.get_lo16(A1_26, A1_27)
            A2_27 = GPUIndexSpaces.get_hi16(A1_26, A1_27)
        end
        begin
            A2_28 = GPUIndexSpaces.get_lo16(A1_28, A1_29)
            A2_29 = GPUIndexSpaces.get_hi16(A1_28, A1_29)
        end
        begin
            A2_30 = GPUIndexSpaces.get_lo16(A1_30, A1_31)
            A2_31 = GPUIndexSpaces.get_hi16(A1_30, A1_31)
        end
    end
    begin
        begin
            A_0 = GPUIndexSpaces.get_lo8(A2_0, A2_1)
            A_1 = GPUIndexSpaces.get_hi8(A2_0, A2_1)
        end
        begin
            A_2 = GPUIndexSpaces.get_lo8(A2_2, A2_3)
            A_3 = GPUIndexSpaces.get_hi8(A2_2, A2_3)
        end
        begin
            A_4 = GPUIndexSpaces.get_lo8(A2_4, A2_5)
            A_5 = GPUIndexSpaces.get_hi8(A2_4, A2_5)
        end
        begin
            A_6 = GPUIndexSpaces.get_lo8(A2_6, A2_7)
            A_7 = GPUIndexSpaces.get_hi8(A2_6, A2_7)
        end
        begin
            A_8 = GPUIndexSpaces.get_lo8(A2_8, A2_9)
            A_9 = GPUIndexSpaces.get_hi8(A2_8, A2_9)
        end
        begin
            A_10 = GPUIndexSpaces.get_lo8(A2_10, A2_11)
            A_11 = GPUIndexSpaces.get_hi8(A2_10, A2_11)
        end
        begin
            A_12 = GPUIndexSpaces.get_lo8(A2_12, A2_13)
            A_13 = GPUIndexSpaces.get_hi8(A2_12, A2_13)
        end
        begin
            A_14 = GPUIndexSpaces.get_lo8(A2_14, A2_15)
            A_15 = GPUIndexSpaces.get_hi8(A2_14, A2_15)
        end
        begin
            A_16 = GPUIndexSpaces.get_lo8(A2_16, A2_17)
            A_17 = GPUIndexSpaces.get_hi8(A2_16, A2_17)
        end
        begin
            A_18 = GPUIndexSpaces.get_lo8(A2_18, A2_19)
            A_19 = GPUIndexSpaces.get_hi8(A2_18, A2_19)
        end
        begin
            A_20 = GPUIndexSpaces.get_lo8(A2_20, A2_21)
            A_21 = GPUIndexSpaces.get_hi8(A2_20, A2_21)
        end
        begin
            A_22 = GPUIndexSpaces.get_lo8(A2_22, A2_23)
            A_23 = GPUIndexSpaces.get_hi8(A2_22, A2_23)
        end
        begin
            A_24 = GPUIndexSpaces.get_lo8(A2_24, A2_25)
            A_25 = GPUIndexSpaces.get_hi8(A2_24, A2_25)
        end
        begin
            A_26 = GPUIndexSpaces.get_lo8(A2_26, A2_27)
            A_27 = GPUIndexSpaces.get_hi8(A2_26, A2_27)
        end
        begin
            A_28 = GPUIndexSpaces.get_lo8(A2_28, A2_29)
            A_29 = GPUIndexSpaces.get_hi8(A2_28, A2_29)
        end
        begin
            A_30 = GPUIndexSpaces.get_lo8(A2_30, A2_31)
            A_31 = GPUIndexSpaces.get_hi8(A2_30, A2_31)
        end
    end
    for loopIdx1 in Int32(0):Int32(128 ÷ 128 - 1)
        for loopIdx2 in Int32(0):Int32(128 ÷ 32 - 1)
            begin
                Ecopy_0 = @inbounds(
                    E_mem[1 + (((loopIdx2 % Int32) & 0x03) << 0x0d + ((((blockIdx()).x - 1) % Int32) & 0x01) << 0x07 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x08) + (((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) << 0x05))]::Int4x8
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
                Ecopy_1 = @inbounds(
                    E_mem[1 + (((loopIdx2 % Int32) & 0x03) << 0x0d + ((((blockIdx()).x - 1) % Int32) & 0x01) << 0x07 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x08) + (((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) << 0x05) + 1 % Int32)]::Int4x8
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
                Ecopy_2 = @inbounds(
                    E_mem[1 + (((loopIdx2 % Int32) & 0x03) << 0x0d + ((((blockIdx()).x - 1) % Int32) & 0x01) << 0x07 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x08) + (((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) << 0x05) + 2 % Int32)]::Int4x8
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
                Ecopy_3 = @inbounds(
                    E_mem[1 + (((loopIdx2 % Int32) & 0x03) << 0x0d + ((((blockIdx()).x - 1) % Int32) & 0x01) << 0x07 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x08) + (((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) << 0x05) + 3 % Int32)]::Int4x8
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1822 =#
            end
            begin
                @inbounds E_shared[
                    1 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02) + 0,
                    1 + ((((threadIdx()).y - 1) % Int32) & 0x1c + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                ] = Ecopy_0                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1876 =#
                @inbounds E_shared[
                    1 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + 1 % Int32) + 0,
                    1 + ((((threadIdx()).y - 1) % Int32) & 0x1c + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                ] = Ecopy_1                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1876 =#
                @inbounds E_shared[
                    1 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + 2 % Int32) + 0,
                    1 + ((((threadIdx()).y - 1) % Int32) & 0x1c + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                ] = Ecopy_2                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1876 =#
                @inbounds E_shared[
                    1 + (((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x07) << 0x02 + 3 % Int32) + 0,
                    1 + ((((threadIdx()).y - 1) % Int32) & 0x1c + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                ] = Ecopy_3                #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1876 =#
            end
            sync_threads()
            for loopIdx3 in Int32(0):Int32(32 ÷ 8 - 1)
                begin
                    loopIdx4 = 0
                    begin
                        begin
                            if loopIdx4 == 0
                                A10_0 = A_0
                            end
                            if loopIdx4 == 0
                                A10_1 = A_1
                            end
                            if loopIdx4 == 0
                                A10_2 = A_2
                            end
                            if loopIdx4 == 0
                                A10_3 = A_3
                            end
                            if loopIdx4 == 0
                                A10_4 = A_4
                            end
                            if loopIdx4 == 0
                                A10_5 = A_5
                            end
                            if loopIdx4 == 0
                                A10_6 = A_6
                            end
                            if loopIdx4 == 0
                                A10_7 = A_7
                            end
                            if loopIdx4 == 0
                                A10_8 = A_8
                            end
                            if loopIdx4 == 0
                                A10_9 = A_9
                            end
                            if loopIdx4 == 0
                                A10_10 = A_10
                            end
                            if loopIdx4 == 0
                                A10_11 = A_11
                            end
                            if loopIdx4 == 0
                                A10_12 = A_12
                            end
                            if loopIdx4 == 0
                                A10_13 = A_13
                            end
                            if loopIdx4 == 0
                                A10_14 = A_14
                            end
                            if loopIdx4 == 0
                                A10_15 = A_15
                            end
                            if loopIdx4 == 1
                                A10_0 = A_16
                            end
                            if loopIdx4 == 1
                                A10_1 = A_17
                            end
                            if loopIdx4 == 1
                                A10_2 = A_18
                            end
                            if loopIdx4 == 1
                                A10_3 = A_19
                            end
                            if loopIdx4 == 1
                                A10_4 = A_20
                            end
                            if loopIdx4 == 1
                                A10_5 = A_21
                            end
                            if loopIdx4 == 1
                                A10_6 = A_22
                            end
                            if loopIdx4 == 1
                                A10_7 = A_23
                            end
                            if loopIdx4 == 1
                                A10_8 = A_24
                            end
                            if loopIdx4 == 1
                                A10_9 = A_25
                            end
                            if loopIdx4 == 1
                                A10_10 = A_26
                            end
                            if loopIdx4 == 1
                                A10_11 = A_27
                            end
                            if loopIdx4 == 1
                                A10_12 = A_28
                            end
                            if loopIdx4 == 1
                                A10_13 = A_29
                            end
                            if loopIdx4 == 1
                                A10_14 = A_30
                            end
                            if loopIdx4 == 1
                                A10_15 = A_31
                            end
                        end
                        begin
                            Ju_0 = Int32(0)::Int32
                            Ju_1 = Int32(0)::Int32
                            Ju_2 = Int32(0)::Int32
                            Ju_3 = Int32(0)::Int32
                        end
                        begin
                            begin
                                loopIdx5 = 0
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 1
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 2
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 3
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 4
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 5
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 6
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 7
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
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
                            @inbounds Ju_shared[
                                1 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02) + 0,
                                1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x01),
                                1 + (((threadIdx()).y - 1) % Int32) & 0x03,
                            ] = Ju4_0                            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1874 =#
                            @inbounds Ju_shared[
                                1 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02) + 0,
                                1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x01 + 1 % Int32),
                                1 + (((threadIdx()).y - 1) % Int32) & 0x03,
                            ] = Ju4_1                            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1874 =#
                        end
                    end
                end
                begin
                    loopIdx4 = 1
                    begin
                        begin
                            if loopIdx4 == 0
                                A10_0 = A_0
                            end
                            if loopIdx4 == 0
                                A10_1 = A_1
                            end
                            if loopIdx4 == 0
                                A10_2 = A_2
                            end
                            if loopIdx4 == 0
                                A10_3 = A_3
                            end
                            if loopIdx4 == 0
                                A10_4 = A_4
                            end
                            if loopIdx4 == 0
                                A10_5 = A_5
                            end
                            if loopIdx4 == 0
                                A10_6 = A_6
                            end
                            if loopIdx4 == 0
                                A10_7 = A_7
                            end
                            if loopIdx4 == 0
                                A10_8 = A_8
                            end
                            if loopIdx4 == 0
                                A10_9 = A_9
                            end
                            if loopIdx4 == 0
                                A10_10 = A_10
                            end
                            if loopIdx4 == 0
                                A10_11 = A_11
                            end
                            if loopIdx4 == 0
                                A10_12 = A_12
                            end
                            if loopIdx4 == 0
                                A10_13 = A_13
                            end
                            if loopIdx4 == 0
                                A10_14 = A_14
                            end
                            if loopIdx4 == 0
                                A10_15 = A_15
                            end
                            if loopIdx4 == 1
                                A10_0 = A_16
                            end
                            if loopIdx4 == 1
                                A10_1 = A_17
                            end
                            if loopIdx4 == 1
                                A10_2 = A_18
                            end
                            if loopIdx4 == 1
                                A10_3 = A_19
                            end
                            if loopIdx4 == 1
                                A10_4 = A_20
                            end
                            if loopIdx4 == 1
                                A10_5 = A_21
                            end
                            if loopIdx4 == 1
                                A10_6 = A_22
                            end
                            if loopIdx4 == 1
                                A10_7 = A_23
                            end
                            if loopIdx4 == 1
                                A10_8 = A_24
                            end
                            if loopIdx4 == 1
                                A10_9 = A_25
                            end
                            if loopIdx4 == 1
                                A10_10 = A_26
                            end
                            if loopIdx4 == 1
                                A10_11 = A_27
                            end
                            if loopIdx4 == 1
                                A10_12 = A_28
                            end
                            if loopIdx4 == 1
                                A10_13 = A_29
                            end
                            if loopIdx4 == 1
                                A10_14 = A_30
                            end
                            if loopIdx4 == 1
                                A10_15 = A_31
                            end
                        end
                        begin
                            Ju_0 = Int32(0)::Int32
                            Ju_1 = Int32(0)::Int32
                            Ju_2 = Int32(0)::Int32
                            Ju_3 = Int32(0)::Int32
                        end
                        begin
                            begin
                                loopIdx5 = 0
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 1
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 2
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 3
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 4
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 5
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 6
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
                            begin
                                loopIdx5 = 7
                                begin
                                    begin
                                        if loopIdx5 == 0
                                            A11_0 = A10_0
                                        end
                                        if loopIdx5 == 0
                                            A11_1 = A10_1
                                        end
                                        if loopIdx5 == 1
                                            A11_0 = A10_2
                                        end
                                        if loopIdx5 == 1
                                            A11_1 = A10_3
                                        end
                                        if loopIdx5 == 2
                                            A11_0 = A10_4
                                        end
                                        if loopIdx5 == 2
                                            A11_1 = A10_5
                                        end
                                        if loopIdx5 == 3
                                            A11_0 = A10_6
                                        end
                                        if loopIdx5 == 3
                                            A11_1 = A10_7
                                        end
                                        if loopIdx5 == 4
                                            A11_0 = A10_8
                                        end
                                        if loopIdx5 == 4
                                            A11_1 = A10_9
                                        end
                                        if loopIdx5 == 5
                                            A11_0 = A10_10
                                        end
                                        if loopIdx5 == 5
                                            A11_1 = A10_11
                                        end
                                        if loopIdx5 == 6
                                            A11_0 = A10_12
                                        end
                                        if loopIdx5 == 6
                                            A11_1 = A10_13
                                        end
                                        if loopIdx5 == 7
                                            A11_0 = A10_14
                                        end
                                        if loopIdx5 == 7
                                            A11_1 = A10_15
                                        end
                                    end
                                    begin
                                        Are = A11_0
                                        Aim = A11_1
                                    end
                                    E0 = @inbounds(
                                        E_shared[
                                            1 + ((loopIdx5 % Int32) & 0x07 + ((((threadIdx()).y - 1) % Int32) & 0x03) << 0x05 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x03),
                                            1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02),
                                        ]::Int4x8
                                    ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1820 =#
                                    E1 = E0
                                    (E2_0, E2_1) = convert(NTuple{2,Int8x4}, E1)
                                    begin
                                        E2re = E2_0
                                        E2im = E2_1
                                    end
                                    begin
                                        Ju0_0 = Int32(0)::Int32
                                        Ju0_1 = Int32(0)::Int32
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure1_0, Jure1_1) = D_frag
                                    end
                                    begin
                                        Jure2_0 = (-Jure1_0)::Int32
                                        Jure2_1 = (-Jure1_1)::Int32
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Jure2_0, Jure2_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Jure_0, Jure_1) = D_frag
                                    end
                                    begin
                                        A_frag = Are::Int8x4
                                        B_frag = E2im::Int8x4
                                        C_frag = (Ju0_0, Ju0_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim1_0, Juim1_1) = D_frag
                                    end
                                    begin
                                        A_frag = Aim::Int8x4
                                        B_frag = E2re::Int8x4
                                        C_frag = (Juim1_0, Juim1_1)::NTuple{2,Int32}
                                        D_frag = mma_m8n8k16(A_frag, B_frag, C_frag)::NTuple{2,Int32}
                                        (Juim_0, Juim_1) = D_frag
                                    end
                                    begin
                                        Ju1_0 = Jure_0
                                        Ju1_1 = Jure_1
                                        Ju1_2 = Juim_0
                                        Ju1_3 = Juim_1
                                    end
                                    begin
                                        Ju_0 += Ju1_0
                                        Ju_1 += Ju1_1
                                        Ju_2 += Ju1_2
                                        Ju_3 += Ju1_3
                                    end
                                end
                            end
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
                            @inbounds Ju_shared[
                                1 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02) + 0,
                                1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x01),
                                1 + (((threadIdx()).y - 1) % Int32) & 0x03,
                            ] = Ju4_0                            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1874 =#
                            @inbounds Ju_shared[
                                1 + (((loopIdx4 % Int32) & 0x01) << 0x03 + ((((threadIdx()).y - 1) % Int32) & 0x1c) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1c) >>> 0x02) + 0,
                                1 + (((loopIdx3 % Int32) & 0x03) << 0x03 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x01 + 1 % Int32),
                                1 + (((threadIdx()).y - 1) % Int32) & 0x03,
                            ] = Ju4_1                            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1874 =#
                        end
                    end
                end
            end
            sync_threads()
            begin
                Ju10_0 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + (((threadIdx()).x - 1) % Int32) & 0x07,
                        1 + 0x00,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_1 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + (((threadIdx()).x - 1) % Int32) & 0x07,
                        1 + 1 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_2 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + (((threadIdx()).x - 1) % Int32) & 0x07,
                        1 + 2 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_3 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + (((threadIdx()).x - 1) % Int32) & 0x07,
                        1 + 3 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_8 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 8 % Int32),
                        1 + 0x00,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_9 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 8 % Int32),
                        1 + 1 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_10 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 8 % Int32),
                        1 + 2 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_11 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 8 % Int32),
                        1 + 3 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_16 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 16 % Int32),
                        1 + 0x00,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_17 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 16 % Int32),
                        1 + 1 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_18 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 16 % Int32),
                        1 + 2 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_19 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 16 % Int32),
                        1 + 3 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_24 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 24 % Int32),
                        1 + 0x00,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_25 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 24 % Int32),
                        1 + 1 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_26 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 24 % Int32),
                        1 + 2 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
                Ju10_27 = @inbounds(
                    Ju_shared[
                        1 + (((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x18) >>> 0x03),
                        1 + ((((threadIdx()).x - 1) % Int32) & 0x07 + 24 % Int32),
                        1 + 3 % Int32,
                    ]::Int16x2
                ) #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1818 =#
            end
            begin
                (Ju11_0, Ju11_4) = convert(NTuple{2,Int32}, Ju10_0)
                (Ju11_1, Ju11_5) = convert(NTuple{2,Int32}, Ju10_1)
                (Ju11_2, Ju11_6) = convert(NTuple{2,Int32}, Ju10_2)
                (Ju11_3, Ju11_7) = convert(NTuple{2,Int32}, Ju10_3)
                (Ju11_8, Ju11_12) = convert(NTuple{2,Int32}, Ju10_8)
                (Ju11_9, Ju11_13) = convert(NTuple{2,Int32}, Ju10_9)
                (Ju11_10, Ju11_14) = convert(NTuple{2,Int32}, Ju10_10)
                (Ju11_11, Ju11_15) = convert(NTuple{2,Int32}, Ju10_11)
                (Ju11_16, Ju11_20) = convert(NTuple{2,Int32}, Ju10_16)
                (Ju11_17, Ju11_21) = convert(NTuple{2,Int32}, Ju10_17)
                (Ju11_18, Ju11_22) = convert(NTuple{2,Int32}, Ju10_18)
                (Ju11_19, Ju11_23) = convert(NTuple{2,Int32}, Ju10_19)
                (Ju11_24, Ju11_28) = convert(NTuple{2,Int32}, Ju10_24)
                (Ju11_25, Ju11_29) = convert(NTuple{2,Int32}, Ju10_25)
                (Ju11_26, Ju11_30) = convert(NTuple{2,Int32}, Ju10_26)
                (Ju11_27, Ju11_31) = convert(NTuple{2,Int32}, Ju10_27)
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
                Ju12_0 = add_sat(Ju11a_0, Ju11b_0)::Int32
                Ju12_2 = add_sat(Ju11a_2, Ju11b_2)::Int32
                Ju12_4 = add_sat(Ju11a_4, Ju11b_4)::Int32
                Ju12_6 = add_sat(Ju11a_6, Ju11b_6)::Int32
                Ju12_8 = add_sat(Ju11a_8, Ju11b_8)::Int32
                Ju12_10 = add_sat(Ju11a_10, Ju11b_10)::Int32
                Ju12_12 = add_sat(Ju11a_12, Ju11b_12)::Int32
                Ju12_14 = add_sat(Ju11a_14, Ju11b_14)::Int32
                Ju12_16 = add_sat(Ju11a_16, Ju11b_16)::Int32
                Ju12_18 = add_sat(Ju11a_18, Ju11b_18)::Int32
                Ju12_20 = add_sat(Ju11a_20, Ju11b_20)::Int32
                Ju12_22 = add_sat(Ju11a_22, Ju11b_22)::Int32
                Ju12_24 = add_sat(Ju11a_24, Ju11b_24)::Int32
                Ju12_26 = add_sat(Ju11a_26, Ju11b_26)::Int32
                Ju12_28 = add_sat(Ju11a_28, Ju11b_28)::Int32
                Ju12_30 = add_sat(Ju11a_30, Ju11b_30)::Int32
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
                J_0 = add_sat(Ju12a_0, Ju12b_0)::Int32
                J_4 = add_sat(Ju12a_4, Ju12b_4)::Int32
                J_8 = add_sat(Ju12a_8, Ju12b_8)::Int32
                J_12 = add_sat(Ju12a_12, Ju12b_12)::Int32
                J_16 = add_sat(Ju12a_16, Ju12b_16)::Int32
                J_20 = add_sat(Ju12a_20, Ju12b_20)::Int32
                J_24 = add_sat(Ju12a_24, Ju12b_24)::Int32
                J_28 = add_sat(Ju12a_28, Ju12b_28)::Int32
            end
            begin
                J2_0 = J_0::Int32
                J2_4 = J_4::Int32
                J2_8 = J_8::Int32
                J2_12 = J_12::Int32
                J2_16 = J_16::Int32
                J2_20 = J_20::Int32
                J2_24 = J_24::Int32
                J2_28 = J_28::Int32
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
            end
            J3 = Int4x8(J2′_0, J2′_4, J2′_8, J2′_12, J2′_16, J2′_20, J2′_24, J2′_28)
            begin
                if loopIdx2 == 0
                    Jper_0 = J3
                end
                if loopIdx2 == 1
                    Jper_1 = J3
                end
                if loopIdx2 == 2
                    Jper_2 = J3
                end
                if loopIdx2 == 3
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
                isthread1 = (((threadIdx()).x - 1) % Int32) & mask ≠ 0
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
                isthread1 = (((threadIdx()).x - 1) % Int32) & mask ≠ 0
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
                isthread1 = (((threadIdx()).x - 1) % Int32) & mask ≠ 0
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
                isthread1 = (((threadIdx()).x - 1) % Int32) & mask ≠ 0
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
        begin
            @inbounds J_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x08 + (((((threadIdx()).x - 1) % Int32) & 0x04) << 0x01 + ((((threadIdx()).x - 1) % Int32) & 0x01) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1a) << 0x03)) + 0] =
                Jstore_0            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1878 =#
            @inbounds J_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x08 + (((((threadIdx()).x - 1) % Int32) & 0x04) << 0x01 + ((((threadIdx()).x - 1) % Int32) & 0x01) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1a) << 0x03) + 1 % Int32) + 0] =
                Jstore_1            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1878 =#
            @inbounds J_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x08 + (((((threadIdx()).x - 1) % Int32) & 0x04) << 0x01 + ((((threadIdx()).x - 1) % Int32) & 0x01) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1a) << 0x03) + 2 % Int32) + 0] =
                Jstore_2            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1878 =#
            @inbounds J_mem[1 + (((((blockIdx()).x - 1) % Int32) & 0x01) << 0x05 + ((((threadIdx()).y - 1) % Int32) & 0x1f) << 0x08 + (((((threadIdx()).x - 1) % Int32) & 0x04) << 0x01 + ((((threadIdx()).x - 1) % Int32) & 0x01) << 0x02 + ((((threadIdx()).x - 1) % Int32) & 0x1a) << 0x03) + 3 % Int32) + 0] =
                Jstore_3            #= /Users/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:1878 =#
        end
    end
end
