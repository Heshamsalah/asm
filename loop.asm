global _start

section .text
_start:
    mov ebx, 1  ; start ebx at 1
    mov ecx, 4  ; number of iterations
label:
    add ebx, ebx  ; ebx += ebx
    dec ecx       ; dec ==> decrement --> 'ecx -= 1'
    cmp ecx, 0    ; compare ecx with 0
    jg label      ; jump to label if greater than 0
    mov eax, 1    ; sys_exit system call
    int 0x80
