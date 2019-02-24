global _start

section .data
    some_addr db "yellow", 0x0a ;addr -> address

section .text
_start:
    mov [some_addr], byte 'H'
    mov [some_addr+5], byte '!'
    mov eax, 4
    mov ebx, 1
    mov ecx, some_addr
    mov edx, 7
    int 0x80
    mov eax, 1
    mov ebx, 0
    int 0x80
