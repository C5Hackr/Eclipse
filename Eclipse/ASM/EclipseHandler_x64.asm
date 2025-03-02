.code

EclipseHandler proc
    mov qword ptr [0], 1
    
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15

    mov rax, 07F92A38D1F56C004h
    mov rbx, 07FB4E29C5D73A11Bh
    mov rcx, 07F83DAAB6E29F6CDh
    mov rdx, 07FDA94BC3D8F5AEEh
    mov rsi, 07F1C3B8DA7E2F199h
    mov rdi, 07F65B92E3D7A4CFFh
    mov r8,  07FF3A1B7C92D5E88h
    mov r9,  07FE97C5D4A3B82FFh
    mov r10, 07FB4F82D9E3A157Bh
    xor r11, r11

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    cmp rax, rdx
    jg add_c1
    cmp rbx, rsi
    jl sub_c2
    cmp rcx, rdi
    je xor_c3

add_c1:
    add r11, r8
    jmp next1

sub_c2:
    sub r11, r9
    jmp next1

xor_c3:
    xor r11, r10

next1:
    test rax, 0FFh
    jz skip1
    or r11, rbx
skip1:

    test rsi, 0FFFh
    jnz skip2
    and r11, rdi
skip2:

    mov r12, rax
    xor r12, rdx
    test r12, 3
    jnz else1
    add rbx, rdx
    jmp after1
else1:
    xor rdi, r9
after1:

    mov r13, rdx
    xor r13, rcx
    test r13, 5
    jnz else2
    and rcx, r8
    jmp after2
else2:
    or r10, rax
after2:

    mov r14, 100
loop1:
    mov r15, 100
loop2:
    mov r12, r14
    imul r12, r15
    and r12, 0FFFFFFh
    add r11, r12
    dec r15
    jnz loop2
    dec r14
    jnz loop1

    mov r14, 100
loopX:
    mov r15, 100
loopY:
    mov r12, 100
check2:
    add r13, r14
    add r13, r15
    add r13, r12
    test r13, 19
    jnz check3
    xor r11, rsi
    jmp cont
check3:
    sub r11, r10
cont:
    dec r15
    jnz loopY
    dec r14
    jnz loopX

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r11, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    add rax, rdx
    sub rax, r8
    xor rbx, rsi
    shl rbx, 3
    or rcx, rdi
    shr rcx, 5
    xor r11, rax
    xor r11, rbx

    add r11, rax
    add r11, rbx
    add r11, rcx
    add r11, rdx
    add r11, rsi
    add r11, rdi
    add r11, r8
    add r11, r9
    add r11, r10

    mov r12, r11
    xor r12, 20h
    add r12, rax
    xor r12, rbx
    sub r12, rcx
    imul r12, rdx
    shr r12, 4
    shl r12, 3
    add r12, rsi
    add r12, rdi
    xor r12, r8
    sub r12, r9
    xor r12, r10

    mov r13, r12
    add r13, rax
    xor r13, rbx
    sub r13, rcx
    imul r13, rdx
    shr r13, 2
    shl r13, 5
    add r13, rsi
    add r13, rdi
    xor r13, r8
    sub r13, r9
    xor r13, r10

    mov r14, r13
    add r14, rax
    xor r14, rbx
    sub r14, rcx
    imul r14, rdx
    shr r14, 3
    shl r14, 4
    add r14, rsi
    add r14, rdi
    xor r14, r8
    sub r14, r9
    xor r14, r10

    and r14, 0FFFFFFFFFFFFFFFFh
    or r14, 20h
    add r14, r12
    xor r14, r13
    sub r14, rax
    and r14, rbx
    xor r14, rcx
    add r14, rdx
    shl r14, 7
    shr r14, 3
    xor r14, rsi
    sub r14, rdi
    or r14, r8
    and r14, r9
    xor r14, r10

    mov r15, r14
    add r15, rax
    xor r15, rbx
    sub r15, rcx
    imul r15, rdx
    shr r15, 6
    shl r15, 2
    add r15, rsi
    add r15, rdi
    xor r15, r8
    sub r15, r9
    xor r15, r10

    shr rax, 3
    and rax, 0FFFFFFFFh
    shl rsi, 4
    or rsi, 0FFFFFFFFh
    imul r10, r15, 0FFFFh
    mov rdx, 0FFFFh
    div rdx

    pop r15
    pop r14
    pop r13
    pop r12
    pop rdi
    pop rsi
    pop rbx

    ret
EclipseHandler endp

EclipseBegin proc
    nop
    nop
    nop
    nop
    nop
    ret
EclipseBegin endp

EclipseEnd proc
    nop
    nop
    nop
    nop
    nop
    ret
EclipseEnd endp

end