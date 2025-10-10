### Basic For Loop
```c
for(i=1;i<=5;i++)
{
printf("%d\n",i);
}
```
### Equivalent nasm
```asm

extern printf

section .data

out_fmt: db "%ld",10,0

section .bss ; store uninitialized value
i resq 1

section .text
global main

main:

push rbp
mov rbp,rsp
and rsp,-16

mov qword [i],1 ; initialization i=1

for_start:

mov rax,[i] ;load i into rax
cmp rax,5
jg for_end ; if i>5 , jump to end

; printf("%ld\n",i)

mov rdi,out_fmt
mov rsi,rax
xor rax,rax
call printf

; update
mov rax,[i] ;load i
inc rax
mov [i],rax  ; store the updated value in rax

jmp for_start ; loop ongoing

for_end:

mov rsp,rbp
pop rbp
ret

```
