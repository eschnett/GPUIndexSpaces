# { Set to constant; Store to memory }
#     Inputs: []
#     Outputs: [Ezero]
#         Ezero:
#             Cplx(0) => SIMD(2)
#             DishI(0) => Register(0)
#             DishI(1) => Thread(4)
#             DishI(2) => Thread(0)
#             DishI(3) => Thread(1)
#             DishI(4) => Register(1)
#             Polr(0) => SIMD(3)
#             Time(0) => SIMD(4)
#             Time(1) => Warp(0)
#             Time(2) => Warp(1)
#     Unused: []
begin
    #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:290 =#
    begin
        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:361 =#
        Ezero_0 = ((((((((0 % Int8) & 0x0000000f | (0 % Int8) << 0x04 & 0x000000f0) | (0 % Int8) << 0x08 & 0x00000f00) |
                       (0 % Int8) << 0x0c & 0x0000f000) | (0 % Int8) << 0x10 & 0x000f0000) | (0 % Int8) << 0x14 & 0x00f00000) |
                    (0 % Int8) << 0x18 & 0x0f000000) | (0 % Int8) << 0x1c & 0xf0000000) % Int32
        Ezero_1 = ((((((((0 % Int8) & 0x0000000f | (0 % Int8) << 0x04 & 0x000000f0) | (0 % Int8) << 0x08 & 0x00000f00) |
                       (0 % Int8) << 0x0c & 0x0000f000) | (0 % Int8) << 0x10 & 0x000f0000) | (0 % Int8) << 0x14 & 0x00f00000) |
                    (0 % Int8) << 0x18 & 0x0f000000) | (0 % Int8) << 0x1c & 0xf0000000) % Int32
        Ezero_2 = ((((((((0 % Int8) & 0x0000000f | (0 % Int8) << 0x04 & 0x000000f0) | (0 % Int8) << 0x08 & 0x00000f00) |
                       (0 % Int8) << 0x0c & 0x0000f000) | (0 % Int8) << 0x10 & 0x000f0000) | (0 % Int8) << 0x14 & 0x00f00000) |
                    (0 % Int8) << 0x18 & 0x0f000000) | (0 % Int8) << 0x1c & 0xf0000000) % Int32
        Ezero_3 = ((((((((0 % Int8) & 0x0000000f | (0 % Int8) << 0x04 & 0x000000f0) | (0 % Int8) << 0x08 & 0x00000f00) |
                       (0 % Int8) << 0x0c & 0x0000f000) | (0 % Int8) << 0x10 & 0x000f0000) | (0 % Int8) << 0x14 & 0x00f00000) |
                    (0 % Int8) << 0x18 & 0x0f000000) | (0 % Int8) << 0x1c & 0xf0000000) % Int32
    end
    begin
        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:735 =#
        @inbounds E_shared[1 + (((threadIdx()).y - 1) % Int32 + (((((threadIdx()).x - 1) % Int32) & 0x10) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x09))] = Ezero_0        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:727 =#
        @inbounds E_shared[1 + (((threadIdx()).y - 1) % Int32 + (((((threadIdx()).x - 1) % Int32) & 0x10) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x09) + 128)] = Ezero_1        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:727 =#
        @inbounds E_shared[1 + (((threadIdx()).y - 1) % Int32 + (((((threadIdx()).x - 1) % Int32) & 0x10) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x09) + 2048)] = Ezero_2        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:727 =#
        @inbounds E_shared[1 + (((threadIdx()).y - 1) % Int32 + (((((threadIdx()).x - 1) % Int32) & 0x10) << 0x04 + ((((threadIdx()).x - 1) % Int32) & 0x03) << 0x09) + (128 + 2048))] = Ezero_3        #= /home/eschnett/src/jl/GPUIndexSpaces.jl/src/GPUIndexSpaces.jl:727 =#
    end
end
