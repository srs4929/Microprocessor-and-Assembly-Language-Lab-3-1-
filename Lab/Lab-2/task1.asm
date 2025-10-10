extern scanf
extern printf

section .data
a : dq 0
b : dq 0
in_fmt : db "%ld",0
out_fmt: db "The gcd is %ld",10,0

section .text
global main
main :

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

gcd_loop:
mov rax,[a]
cmp rax,0
je end_loop

mov rcx,rax  ; rcx is temp and temp=a 
mov rbx,[b] ; load b
; we want b % a so numerator should be b and denom is a
; in division div rcx = rax/rcx so rax should be b and rcx should be a
mov rax,rbx ; rax=b
xor rdx,rdx
div rcx
; we want remainder which is in rdx

mov [a],rdx ; store remainder a= b%a
mov [b],rcx ; store b =temp=a

jmp gcd_loop ; repeat it

end_loop:
mov rdi,out_fmt
mov rsi,[b]
xor rax,rax
call printf

mov rsp,rbp
pop rbp
mov rax,0
ret





