global _start

; using stack ans the 'esp' register

_start:
    ; remember: the esp register holds the address number of a location in the stack
    ;           it jumbs by 4 bytes since we are using a 32bit arch.
    sub esp, 4             ; subtract 4 from the address currently at esp
    mov [esp], byte 'H'    ; move the byte 'H' into the location the esp points at
    mov [esp+1], byte 'e'  ; move the byte 'e' into the location of 'esp+1'
    mov [esp+2], byte 'y'  ; move the byte 'y' into the location of 'esp+2'
    mov [esp+3], byte '!'  ; move the byte '!' into the location of 'esp+3'
    mov eax, 4             ; sys_write system call
    mov ebx, 1             ; stdout file discriptor
    mov ecx, esp           ; move the address number the esp points at to ecx
    mov edx, 4             ; move the length of the bytes to write into edx
    int 0x80               ; run system call
    mov eax, 1             ; sys_exit system call
    mov ebx, 0             ; exit status 0
    int 0x80               ; run system call
