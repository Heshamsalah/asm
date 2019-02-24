global _start

_start:
    ; Manipulating the stack inside the function and retain
    ; the previous layout of the stack afterwards

    call func      ; call the label 'func' and push the next
                   ; instruction location into the stack
    mov eax, 1     ; sys_exit system call
    mov ebx, 0     ; exit status 0
    int 0x80       ; run system call


func:
    ; Their will be a problem when nested function calls are performed because this
    ; will cause the current ebp value in this function to be altered so we will lose
    ; the previous location of this current function after we enter the next function
    ; which in turn will move the esp value into the ebp overwriting the prev value
    ; so we will push the ebp value into the stack before we enter the next function
    ; then before returning from the current function we will pop the stack value
    ; into the ebp reg again.

    ; the first 3 instruction here are called the prologue of the function
    push ebp              ; push the ebp value into the top of the stack
    mov ebp, esp          ; ebp will hold the current stack pointer location
    sub esp, 2            ; subtract 2 from the current address the stack points to
    ; -----------------------------------------------------------------------------

    mov [esp], byte 'H'
    mov [esp+1], byte 'i'
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; stdout file descriptor
    mov ecx, esp          ; first location of bytes to write
    mov edx, 2            ; number of bytes to write
    int 0x80              ; run system call

    ;------------------------------------------------------------------------------
    ; these next 3 lines are called the epilogue of the function
    ; which is restoring the stack
    mov esp, ebp          ; put back the prev location we stored at ebp into esp
    pop ebp
    ret                   ; return to the next instruction right after the 'call func' operation

