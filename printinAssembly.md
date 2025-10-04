```asm
extern printf

section .data              ; initialized ones
msg_fmt db "%s",10,0       ; format string with newline (10 for newline & 0 for null terminator)
msg     db "Hello World!",0 ; message to print

section .text
global main

main:
    push rbp
    mov rbp, rsp

    and rsp, -16            ; align stack to 16 bytes for printf

    mov rdi, msg_fmt        ; first argument: format string (In the C we know printf("%s",Hello World) so msg_fmt is the first part
    mov rsi, msg            ; second argument: string to print
    xor rax, rax            ; 0 for variadic function
    call printf

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
```
## extern printf
Tells NASM that printf is defined outside this file (in the C standard library). Without this, the assembler wouldn’t know about the function.

## Data section
```asm
section .data
msg_fmt db "%s",10,0
msg db "Hello World",0
```
printf needs a format string and data in memory. msg_fmt → format string %s\n for printf. msg → the actual message.

## Text Section & Global Main
```asm
section .text
global main
```
Code section where instructions live.The linker needs main as the entry point for a C-style program.
## Function Prologue (Saves the previous base pointer and sets a new one for this function.)
``` asm
push rbp
mov rbp, rsp
```
push rbp saves old rbp. mov rbp,rsp sets rbp as the new frame pointer.
## Stack Alignment
``` asm
and rsp -16
```
Aligns stack pointer to a 16-byte boundary. x86-64 calling convention requires 16-byte alignment before calling variadic functions like printf.It prevents segmentation faults on modern Linux/WSL.

## Preparing Arguments for printf
```asm
mov rdi, msg_fmt
mov rsi, msg
xor rax, rax
```
rdi → first argument (msg_fmt)

rsi → second argument (msg)

rax → number of floating-point arguments (0 for %s)

Why: On x86-64 Linux, first six integer/pointer arguments go into rdi, rsi, rdx, rcx, r8, r9.

How: xor rax, rax sets rax to 0, required for variadic functions like printf.

## Printf
```asm
call printf
```
Calls the C library function printf to print "Hello World!" to stdout.

## Function Epilogue
```asm
 mov rsp, rbp
 pop rbp
 mov rax, 0
 ret
```

mov rsp, rbp → restores the stack pointer to the base of the frame.

pop rbp → restores old base pointer.

mov rax,0 → sets return value = 0 (like return 0 in C).

ret → returns control to the caller.

Cleans up the stack and follows standard x86-64 calling conventions.

## Command for running file
```
nasm -f elf64 print.asm -o print.o
gcc -no-pie print.o -o print
./print
```
