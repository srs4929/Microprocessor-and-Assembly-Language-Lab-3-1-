;Scan three variables a,b, and c. Print the value of 2a + 3b + c

extern printf
extern scanf

section .data
a: dq 0
b: dq 0
c: dq 0
result: dq 0
enter_msg: db "Enter three numbers",0
in_fmt:  db "%ld",0
out_fmt: db "The result of 2a+3b+c is %ld",10,0


section .text
global main

main:
   push rbp
   mov rbp,rsp
   and rsp,-16

   ;enter three messages
   mov rdi,enter_msg
   xor rax,rax
   call printf
   
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

   mov rax,[a]
   imul rax,2
   mov rbx,[b]
   imul rbx,3
   add rax,rbx
   mov rcx,[c]
   add rax,rcx
   mov [result],rax

   mov rdi,out_fmt
   mov rsi,[result]
   xor rax,rax
   call printf


   
   mov rsp,rbp
   pop rbp
   mov rax,0
   ret
