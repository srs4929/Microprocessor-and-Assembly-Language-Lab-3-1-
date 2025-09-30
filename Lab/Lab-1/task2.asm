; Scan a variable x. Print the value of the sum of the numbers from 1 to x. You may assume x is a positive integer.

extern printf
extern scanf

section .data
n:          dq 0
result:     dq 0
enter_msg:  db "Enter the number: ",0
in_fmt:     db "%ld",0
out_fmt:    db "The result is %ld",10,0

section .text
global main

main:
    push rbp
    mov rbp, rsp
    and rsp, -16           ; align stack

    ; Prompt user
    mov rdi, enter_msg
    xor rax, rax
    call printf

    ; Read input
    mov rdi, in_fmt
    lea rsi, [n]
    xor rax, rax
    call scanf

    ; sum = n*(n+1)/2 using div
    mov rax, [n]       ; rax = n
    mov rcx, rax
    add rax, 1
    imul rax, rcx
    xor rdx, rdx
    mov rcx, 2
    div rcx
    mov [result], rax

    ; Print result
    mov rdi, out_fmt
    mov rsi, [result]
    xor rax, rax
    call printf

    ; Exit safely
    mov rsp, rbp
    pop rbp
    mov rax, 0
    ret
