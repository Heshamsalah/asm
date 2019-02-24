global _start

section .data
    msg db "Hello World!", 0x0a ; '0x0a' -> the hex number for new line, 
    len equ $ - msg ; length of the string

section .text
_start:
    mov eax, 4   ; sys_write system call code
    mov ebx, 1   ; stdout file descriptor
    mov ecx, msg ; bytes to write
    mov edx, len ; number of bytes to write
    int 0x80     ; perform system call
    mov eax, 1   ; sys_exit system call code
    mov ebx, 0   ; exit status 'return 0' like
    int 0x80     ; perform system call
