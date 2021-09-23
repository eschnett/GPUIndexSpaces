using GPUIndexSpaces
using Test

const Dish = Index{:Dish}

@testset "constant" begin
    mapping = Mapping(Dict(Dish(0) => Register(0), Dish(1) => Register(1), Dish(2) => Thread(0), Dish(3) => Thread(1),
                           Dish(4) => Thread(2), Dish(5) => Thread(3), Dish(6) => Thread(4), Dish(7) => Warp(0), Dish(8) => Warp(1),
                           Dish(9) => Warp(2), Dish(10) => Warp(3), Dish(11) => Warp(4)))
    step = constant("r", mapping, "42")
    print(step)
end
