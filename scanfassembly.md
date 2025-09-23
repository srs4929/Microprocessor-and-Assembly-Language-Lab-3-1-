```asm
; Take Two inputs from user and print those numbers
extern printf
extern scanf

section .data
num1:       dq 0                   ; first number
num2:       dq 0                   ; second number

enter_msg:  db "Enter two numbers: ",0
in_fmt:     db "%ld",0             ; 64-bit integer input
out_fmt:    db "First number: %ld",10,0
out_fmt2:   db "Second number: %ld",10,0

section .text
global main

main:
    push rbp
    mov rbp, rsp
    and rsp, -16                     ; align stack for printf/scanf

    ; "Enter two number" print kora
    mov rdi, enter_msg
    xor rax, rax
    call printf

    ; Read first number
    mov rdi, in_fmt
    lea rsi, [num1]                  ; address of num1
    xor rax, rax
    call scanf

    ; Read second number
    mov rdi, in_fmt
    lea rsi, [num2]                  ; address of num2
    xor rax, rax
    call scanf

    ; Print first number
    mov rdi, out_fmt
    mov rsi, [num1]
    xor rax, rax
    call printf

    ; Print second number
    mov rdi, out_fmt2
    mov rsi, [num2]
    xor rax, rax
    call printf

    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
```
