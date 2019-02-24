;compile and link the program using the following commands:
;  $ asm nasm -f elf32 example1.asm -o example1.o
;  $ asm ld -m elf_i386 example1.o -o example1

global _start ;define entry point for program

_start: ;label, labels are used to name locations in the code

   mov eax, 1 ;move the integer 1 into the general purpose register 'eax'
   mov ebx, 42 ;move the integer 42 into the general purpose register 'ebx'
   sub ebx, 29 ;subtract '29' from the value of ebx.
   int 0x80 ;performs an interrupt. 'int'; 0x80 is an interrupt handler for system calls
