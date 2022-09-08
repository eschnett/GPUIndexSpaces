using CUDA
using LLVM

function load_global(ptr::Core.LLVMPtr{Int128,1})
    # ld.global.v4.u32        {%r2, %r3, %r4, %r5}, [%rd7];

    # val = Base.Intrinsics.pointerref(Ptr{Int128}(Int(ptr)), 1, 16)

    val = Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(1)* %0 to [4 x i32] addrspace(1)*
           %val = load [4 x i32], [4 x i32] addrspace(1)* %ptr, align 16
           ret [4 x i32] %val
        """,
        NTuple{4,Int32},
        Tuple{Core.LLVMPtr{Int128,1}},
        ptr,
    )

    # val = Base.llvmcall("""
    #     %ptr = bitcast i8 addrspace(1)* %0 to {i32, i32, i32, i32} addrspace(1)*
    #     %val = load {i32, i32, i32, i32}, {i32, i32, i32, i32} addrspace(1)* %ptr, align 16
    #     %val0 = extractvalue {i32, i32, i32, i32} %val, 0
    #     %val1 = extractvalue {i32, i32, i32, i32} %val, 1
    #     %val2 = extractvalue {i32, i32, i32, i32} %val, 2
    #     %val3 = extractvalue {i32, i32, i32, i32} %val, 3
    #     %arru123 = insertvalue [4 x i32] undef, i32 %val0, 0
    #     %arru23 = insertvalue [4 x i32] %arru123, i32 %val1, 1
    #     %arru3 = insertvalue [4 x i32] %arru23, i32 %val2, 2
    #     %arr = insertvalue [4 x i32] %arru3, i32 %val3, 3
    #     ret [4 x i32] %arr
    # """, NTuple{4,Int32}, Tuple{Core.LLVMPtr{Int128,1}}, ptr)

    #     val = Base.llvmcall(
    # """
    #     %2 = call {i32, i32, i32, i32} asm sideeffect "ld.global.v4.u32 {\$0, \$1, \$2, \$3}, [\$4];", "=r,=r,=r,=r,l"(i64 %0)
    #     %3 = extractvalue {i32, i32, i32, i32} %2, 0
    #     %4 = extractvalue {i32, i32, i32, i32} %2, 1
    #     %5 = extractvalue {i32, i32, i32, i32} %2, 2
    #     %6 = extractvalue {i32, i32, i32, i32} %2, 3
    #     %7 = insertvalue [4 x i32] undef, i32 %3, 0
    #     %8 = insertvalue [4 x i32] %7, i32 %4, 1
    #     %9 = insertvalue [4 x i32] %8, i32 %5, 2
    #     %10 = insertvalue [4 x i32] %9, i32 %6, 3
    #     ret [4 x i32] %10
    # """,
    #         NTuple{4,Int32},
    #         Tuple{Int64},
    #         Int(ptr),
    #     )

    return val
end
load_global(arr::CuDeviceVector{Int128}, idx::Integer) = load_global(pointer(arr, idx))

function store_global!(ptr::Core.LLVMPtr{Int128,1}, val::NTuple{4,Int32})
    # st.global.v4.u32        [%rd6], {%r2, %r3, %r4, %r5};

    # Base.Intrinsics.pointerset(Ptr{Int128}(Int(ptr)), 1, 16)

    val = Base.llvmcall(
        """
           %ptr = bitcast i8 addrspace(1)* %0 to [4 x i32] addrspace(1)*
           store [4 x i32] %1, [4 x i32] addrspace(1)* %ptr, align 16
           ret void
        """,
        Nothing,
        Tuple{Core.LLVMPtr{Int128,1},NTuple{4,Int32}},
        ptr,val
    )

    # val = Base.llvmcall(
    #     """
    #         call void asm sideeffect "st.global.v4.u32 [\$0], {\$1, \$2, \$3, \$4};", "l,r,r,r,r"(i64 %0, i32 %1, i32 %2, i32 %3, i32 %4)
    #         ret void
    #     """,
    #     Nothing,
    #     Tuple{Int64,Int32,Int32,Int32,Int32},
    #     Int(ptr),
    #     val...,
    # )

    return nothing
end
store_global!(arr::CuDeviceVector{Int128}, idx::Integer, val) = store_global!(pointer(arr, idx), val)

function copy(A, B)
    @inbounds A[threadIdx().x] = B[threadIdx().x]
    return nothing
end

function copy4(A, B)
    val = load_global(B, threadIdx().x)
    store_global!(A, threadIdx().x, val)
    return nothing
end

function runcuda()
    # A = CuArray(zeros(Int128, 32))
    # B = CuArray(zeros(Int128, 32))
    # @cuda threads = (1, 1) blocks = 1 copy(A, B)

    B = CuArray(-ones(Int128, 32))
    @show B
    A = CuArray(zeros(Int128, 32))
    @cuda threads = (32, 1) blocks = 1 copy4(A, B)
    # @cuda launch = false copy4(A, B)
    synchronize()
    @show A
end

if CUDA.functional()
    # @device_code_lowered runcuda()
    # @device_code_typed runcuda()
    # @device_code_warntype runcuda()
    # @device_code_llvm runcuda()
    # @device_code_ptx runcuda()
    @device_code_sass runcuda()
    # @device_code runcuda()
    # runcuda()
end
