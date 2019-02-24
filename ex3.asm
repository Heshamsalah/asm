global _start

section .text
_start:
    mov ecx, 99  ; set ecx to 99
    mov ebx, 42  ; exit status is 42
    mov eax, 1   ; sys_exit system call
    cmp ecx, 100 ; compare ecx to 100
    jl skip      ; jump if less than this is different from 'jmp' which won't take in account the output of the compare action.
    mov ebx, 13  ; exit status is 13

;===========================================
;======= the different jump actions ========
;===========================================
;     je   A, B ; Jump if Equal
;     jne  A, B ; Jump if Not Equal
;     jg   A, B ; Jump if Greater
;     jge  A, B ; Jump if Greater or Equal
;     jl   A, B ; Jump if Less
;     jle  A, B ; Jump if Less or Equal
;===========================================
skip: 
    int 0x80
