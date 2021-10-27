# GPUIndexSpaces

## How to run on Sky

Run normally:
```Julia
~/julia-1.7/bin/julia --project=@. test/fourier1d.jl
```

Run with profiling:
```Julia
nv-nsight-cu-cli --target-processes all --set full --export profile5 env LD_LIBRARY_PATH=/opt/nvidia/nsight-compute/2021.2.2/target/linux-desktop-glibc_2_11_3-x64:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/lib:/home/eschnett/julia-1.6/lib/julia ~/julia-1.6/bin/julia --project=@. test/frb.jl
```
Note that we need to add the Julia directory
`/home/eschnett/julia-1.6/lib/julia` to `LD_LIBRARY_PATH`.
One cannot extract PTX or SASS while profiling.

## How to run on Symmetry

Run normally:
```Julia
module load julia
julia --project=@. test/fourier1d.jl
```

Run with profiling:
```Julia
nv-nsight-cu-cli --target-processes all env LD_LIBRARY_PATH=/opt/nvidia/nsight-compute/2021.2.2/target/linux-desktop-glibc_2_11_3-x64:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/lib:/cm/shared/apps/julia/julia-1.6.3/lib/julia julia --project=@. test/frb.jl
```
Note that we need to add the Julia directory
`/home/eschnett/julia-1.6/lib/julia` to `LD_LIBRARY_PATH`.
One cannot extract PTX or SASS while profiling.

## How to extract and build PTX code

### Extract

### Build

```sh
ptxas -arch=sm_86 -m64 zero.ptx -o zero.cubin

fatbinary --create=zero.fatbin -64 --cicc-cmdline='-ftz=1 -prec_div=1 -prec_sqrt=1 -fmad=1' --image3=kind=elf,sm=86,file=zero.cubin --image3=kind=ptx,sm=86,file=zero.ptx --embedded-fatbin=zero.fatbin.c
```

## TODO

- Use `cvt.pack` to pack data
- Use `dp4a` to multiply (or `dp2a`?)
- Use `v4absdiff` to clamp?
- Use `Float16` for final calculation? Results might need to be scaled.
- Calculate cost of tensor core operations (throughput per SM)
- Output CUDA kernels in C
- `prmt` can sign-extend!
- `cvt` can convert 2 `Float32` into `Float16x2`
- `Float16` operations can saturate to `[0, 1]`; use this for clamping?
- Combine integer and floating-point arithmetic for output of second FT
- Re-arrange PTX instructions manually to improve instruction mix
- Does CUDA really optimize for the current GPU? I don't see "86" in the SASS output, only "80"

## DONE

- Midpoint gains are unsigned: don't sign extend during unpacking. (No more midpoint gains.)
- Maybe apply midpoint gains purely by shifting? (Yes.)
- Use tensor cores to apply input gains? (No; would need very different register layout.)

## HPC system management

- Use Conda for package management on HPC systems
- Don't install that many Ubuntu system packages; ask people to use
  Conda instead
- What about Spack?

## Julia

- Write CPU kernels in Julia
- Not CUDA -- are there other packages that allow running on CPU?
  ROCM? A new package? With good multi-threading?
