``` asm
extern scanf
extern printf

section .data
a : dq 0
b:  dq 0
in_fmt: db "%ld",0 
out_fmt: db "The result is %ld and remainder is %ld",10,0

section .text
global main
main:
push rbp
mov rbp,rsp
and rsp,-16

mov rdi,in_fmt
lea rsi,[a]
xor rax,rax
call scanf

mov rdi,in_fmt
lea rsi,[b]
xor rax,rax
call scanf

; lets do div 

mov rax,[a] ; first load the value of a
mov rbx,[b] ; load the value of b

; a / b numerator is a and b is denomator 
; in div rbx always do rax/rbx and quotient goes to rxa and result

xor rdx,rdx ; first clear up the rdx
; in div rbx always do rax/rbx and quotient goes to rxa and result

div rbx

mov rdi,out_fmt
mov rsi,rax
mov rdx,rdx
xor rax,rax
call printf

mov rsp,rbp
pop rbp
xor rax,0
ret
```
