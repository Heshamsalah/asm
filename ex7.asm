global _start

_start:
    ; Using functions in assembly
    call func    ; call the label func, and pushes the next instruction
                 ; location into the stack
    mov eax, 1   ; sys_exit system call
    int 0x80     ; run system call



func:
    mov ebx, 42  ; setting ebx
    ; pop eax      ; pop into 'eax' the return location that the 'call'
                 ; operation pushed into the stack
    ; jmp eax      ; jump to the location stored into 'eax' which is the
                 ; next instruction after the 'call' operation
    ret          ; Does exactly what the previous commented 2 lines do.
