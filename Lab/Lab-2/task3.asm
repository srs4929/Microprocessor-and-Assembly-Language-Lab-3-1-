extern scanf
extern printf

section .data
a  : dq 0
b  : dq 0
c  : dq 0
in_fmt: db "%ld",0
max : dq 0
out_fmt : db "The largest is %ld",10,0

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

mov rdi,in_fmt
lea rsi,[c]
xor rax,rax
call scanf

mov rax,[a] ; load the value rax
mov [max],rax ; store the value in maxi

mov rbx,[b]
mov rcx,[c]

cmp rbx,[max]
jle skip_b
mov [max],rbx

skip_b:
cmp rcx,[max]
jle skip_c
mov [max],rcx

skip_c:
mov rdi,out_fmt
mov rsi,[max]
xor rax,rax
call printf

mov rsp,rbp
pop rbp
xor rax,0
ret 0
