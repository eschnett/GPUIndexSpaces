using CUDA
using GPUIndexSpaces
using Test

################################################################################

const Dish = Index{:Dish}

mapping = Layout(Dict([Dish(0) => Thread(0)
                       Dish(1) => Thread(1)
                       Dish(2) => Thread(2)
                       Dish(3) => Thread(3)
                       Dish(4) => Thread(4)
                       Dish(5) => Register(0)
                       Dish(6) => Register(1)
                       Dish(7) => Warp(0)
                       Dish(8) => Warp(1)
                       Dish(9) => Warp(2)
                       Dish(10) => Warp(3)
                       Dish(11) => Warp(4)
                       Dish(12) => Block(0)
                       Dish(13) => Block(1)
                       Dish(14) => Block(2)
                       Dish(15) => Block(3)
                       Dish(16) => Block(4)
                       Dish(17) => Block(5)]))

memmap = Layout(Dict([Dish(0) => Memory(0)
                      Dish(1) => Memory(1)
                      Dish(2) => Memory(2)
                      Dish(3) => Memory(3)
                      Dish(4) => Memory(4)
                      Dish(5) => Memory(5)
                      Dish(6) => Memory(6)
                      Dish(7) => Memory(7)
                      Dish(8) => Memory(8)
                      Dish(9) => Memory(9)
                      Dish(10) => Memory(10)
                      Dish(11) => Memory(11)
                      Dish(12) => Memory(12)
                      Dish(13) => Memory(13)
                      Dish(14) => Memory(14)
                      Dish(15) => Memory(15)
                      Dish(16) => Memory(16)
                      Dish(17) => Memory(17)]))

################################################################################

steps = AbstractStep[]
env = Environment()

constant!(steps, env, :r, mapping, :(Int32(42)))
assign!(steps, env, :s, :r)
apply!(steps, env, :t, :s, expr -> :(min(Int32(127), max(Int32(-127), $expr))))

allsteps = Seq(steps)
print(allsteps)

################################################################################

steps = AbstractStep[]
env = Environment()

load!(steps, env, :r, mapping, :m, memmap)
apply!(steps, env, :s, :r, expr -> :(min(Int32(127), max(Int32(-127), $expr))))
permute!(steps, env, :t, :s, Register(0), Thread(0))
store!(steps, env, :t, :m, memmap)

allsteps = Seq(steps)
print(allsteps)

################################################################################

@eval function runsteps(m)
    $(code(allsteps))
    return nothing
end

function runcuda()
    nelts = 2^18
    mem = CuArray(Int32[i for i in 0:(nelts - 1)])
    @cuda blocks = 64 threads = (32, 32) runsteps(mem)
    synchronize()
    println(mem[1:16])
    println(mem[(end - 15):end])
    return nothing
end

# @device_code_warntype
# @device_code_llvm
# @device_code_ptx
# @device_code_sass
@device_code_sass runcuda()
