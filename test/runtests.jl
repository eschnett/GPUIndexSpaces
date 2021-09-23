using CUDA
using GPUIndexSpaces
using Test

const Dish = Index{:Dish}

mapping = Mapping(Dict(Dish(0) => Register(0), Dish(1) => Register(1), Dish(2) => Thread(0), Dish(3) => Thread(1),
                       Dish(4) => Thread(2), Dish(5) => Thread(3), Dish(6) => Thread(4), Dish(7) => Warp(0), Dish(8) => Warp(1),
                       Dish(9) => Warp(2), Dish(10) => Warp(3), Dish(11) => Warp(4)))

memmap = Mapping(Dict(Dish(0) => Memory(0), Dish(1) => Memory(1), Dish(2) => Memory(2), Dish(3) => Memory(3), Dish(4) => Memory(4),
                      Dish(5) => Memory(5), Dish(6) => Memory(6), Dish(7) => Memory(7), Dish(8) => Memory(8), Dish(9) => Memory(9),
                      Dish(10) => Memory(10), Dish(11) => Memory(11)))

################################################################################

step_constant = constant(:r, mapping, 42)
print(step_constant)

step_assign = assign(:r, :s, mapping)
print(step_assign)

step_clamp = apply(:s, :t, expr -> :(min(127, max(-127, $expr))), mapping)
print(step_clamp)

allsteps = Seq(Seq(step_constant, step_assign), step_clamp)
print(allsteps)

################################################################################

step_load = load(:m, :r, memmap, mapping)
print(step_load)

step_store = store(:r, :m, mapping, memmap)
print(step_store)
