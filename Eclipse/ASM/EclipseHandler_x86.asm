.MODEL flat

.code

_EclipseHandler proc
    mov dword ptr [0], 1

    push ebx
    push esi
    push edi
    push ebp

    mov eax, 07F56C004h
    mov ebx, 07D73A11Bh
    mov ecx, 06E29F6CDh
    mov edx, 03D8F5AEEh
    mov esi, 07E2F199h
    mov edi, 07D7A4CFFh

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    cmp eax, edx
    jg add_c1
    cmp ebx, esi
    jl sub_c2
    cmp ecx, edi
    je xor_c3

add_c1:
    add ebp, ebp
    jmp next1

sub_c2:
    sub ebp, ebx
    jmp next1

xor_c3:
    xor ebp, ecx

next1:
    test eax, 0FFh
    jz skip1
    or ebp, ebx
skip1:

    test esi, 0FFFh
    jnz skip2
    and ebp, edi
skip2:

    mov eax, eax
    xor eax, edx
    test eax, 3
    jnz else1
    add ebx, edx
    jmp after1
else1:
    xor edi, ebx
after1:

    mov eax, edx
    xor eax, ecx
    test eax, 5
    jnz else2
    and ecx, ebp
    jmp after2
else2:
    or ecx, eax
after2:

    mov esi, 100
loop1:
    mov edi, 100
loop2:
    mov eax, esi
    imul eax, edi
    and eax, 0FFFFFFh
    add ebp, eax
    dec edi
    jnz loop2
    dec esi
    jnz loop1

    mov esi, 100
loopX:
    mov edi, 100
loopY:
    mov eax, 100
check2:
    add ebx, esi
    add ebx, edi
    add ebx, eax
    test ebx, 19
    jnz check3
    xor ebp, esi
    jmp cont
check3:
    sub ebp, ecx
cont:
    dec edi
    jnz loopY
    dec esi
    jnz loopX

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebp, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    add ebp, eax
    add ebp, ebx
    add ebp, ecx
    add ebp, edx
    add ebp, esi
    add ebp, edi
    add ebp, ebp
    add ebp, ebx
    add ebp, ecx

    mov esi, ebp
    xor esi, 20h
    add esi, eax
    xor esi, ebx
    sub esi, ecx
    imul esi, edx
    shr esi, 4
    shl esi, 3
    add esi, esi
    add esi, edi
    xor esi, ebp
    sub esi, ebx
    xor esi, ecx

    mov edi, esi
    add edi, eax
    xor edi, ebx
    sub edi, ecx
    imul edi, edx
    shr edi, 2
    shl edi, 5
    add edi, esi
    add edi, ebp
    xor edi, ebx
    sub edi, ecx
    xor edi, edx

    mov eax, edi
    add eax, eax
    xor eax, ebx
    sub eax, ecx
    imul eax, edx
    shr eax, 3
    shl eax, 4
    add eax, esi
    add eax, edi
    xor eax, ebp
    sub eax, ebx
    xor eax, ecx

    and eax, 0FFFFFFFFh
    or eax, 20h
    add eax, esi
    xor eax, edi
    sub eax, ebx
    and eax, ecx
    xor eax, edx
    add eax, esi
    shl eax, 7
    shr eax, 3
    xor eax, ebp
    sub eax, edi
    or eax, ebx
    and eax, ecx
    xor eax, edx

    mov ebx, eax
    add ebx, eax
    xor ebx, ebx
    sub ebx, ecx
    imul ebx, edx
    shr ebx, 6
    shl ebx, 2
    add ebx, esi
    add ebx, edi
    xor ebx, ebp
    sub ebx, ebx
    xor ebx, ecx

    shr eax, 3
    and eax, 0FFFFFFFFh
    shl esi, 4
    or esi, 0FFFFFFFFh
    imul ecx, ebx, 0FFFFh
    mov edx, 0FFFFh
    div edx

    add eax, edx
    sub eax, ebp
    xor ebx, esi
    shl ebx, 3
    or ecx, edi
    shr ecx, 5
    xor ebp, eax
    xor ebp, ebx

    pop ebp
    pop edi
    pop esi
    pop ebx

    ret
_EclipseHandler endp

_EclipseBegin proc
    nop
    nop
    nop
    nop
    nop
    ret
_EclipseBegin endp

_EclipseEnd proc
    nop
    nop
    nop
    nop
    nop
    ret
_EclipseEnd endp

end