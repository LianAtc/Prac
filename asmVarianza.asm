    global asmVarianza
    section .text

asmVarianza:
    
    xorpd xmm0, xmm0
    xorpd xmm1, xmm1
    xorpd xmm2, xmm2
    xorpd xmm3, xmm3
    xorpd xmm4, xmm4

    ;Copia de N(rsi)
    mov rax, rsi
    xor rbx, rbx
    xor rcx, rcx

    promedio: 
    movsd xmm1, [rdi + rbx]
    addsd xmm2, xmm1
    add rbx, 8 
    inc rcx
    cmp rcx, rsi
    jne promedio

    cvtsi2sd xmm3, rax
    divsd xmm2, xmm3

    mov rcx, 0
    mov rbx, 0
    ;u = xmm2

sumatoria: 
    movsd xmm1, [rdi + rbx]
    subsd xmm1, xmm2
    mulsd xmm1, xmm1
    addsd xmm4, xmm1
    add rbx, 8 
    inc rcx
    cmp rcx, rsi
    jne sumatoria

exit:
    cdq
    divsd xmm4, xmm3
    movsd xmm0, xmm4
    ret
