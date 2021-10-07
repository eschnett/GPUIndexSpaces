# GPUIndexSpaces

## How to run on Sky

Run normally:
```Julia
~/julia-1.7/bin/julia --project=@. test/fourier1d.jl
```

Run with profiling:
```Julia
nv-nsight-cu-cli --target-processes all env LD_LIBRARY_PATH=/opt/nvidia/nsight-compute/2021.2.1/target/linux-desktop-glibc_2_11_3-x64:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/lib:/home/eschnett/julia-1.7/lib/julia ~/julia-1.7/bin/julia --project=@. test/fourier1d.jl
```
Note that we need to add the Julia directory
`/home/eschnett/julia-1.7/lib/julia` to `LD_LIBRARY_PATH`.

## How to extract and build PTX code

### Extract

### Build

```sh
ptxas -arch=sm_86 -m64 zero.ptx -o zero.cubin

fatbinary --create=zero.fatbin -64 --cicc-cmdline='-ftz=1 -prec_div=1 -prec_sqrt=1 -fmad=1' --image3=kind=elf,sm=86,file=zero.cubin --image3=kind=ptx,sm=86,file=zero.ptx --embedded-fatbin=zero.fatbin.c
```
