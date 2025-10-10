# If-Else in NASM

Unlike high-level languages (C, Python, etc.), NASM does not have an `if` or `else` keyword.  
Instead, control flow is handled using:

1. **`cmp`** – Compares two values and sets CPU flags  
2. **`jXX`** – Conditional jumps based on those flags (`je`, `jne`, `jg`, `jl`, etc.)  
3. **`jmp`** – Unconditional jump to skip or continue code  

---

## General Structure
```asm
cmp value1, value2     ; compare value1 - value2
je  if_block           ; jump to if_block if condition true

; else part
jmp end_if             ; skip the if block

if_block:
; if part (executed only if condition true)

end_if:
; program continues here
```
## Example(if else)
Psedocode
```c
if(eax==5) eax=10
else eax=20
```
Nasm 
```asm
cmp eax, 5          ; compare eax with 5
je  if_true         ; if eax == 5 → jump to if_true

; else part
mov eax, 20
jmp end_if          ; skip the if part

if_true:
mov eax, 10         ; if part

end_if:
; continue program
```
## Common Jump instruction

| Instruction | Meaning                  | Equivalent in C |
| ----------- | ------------------------ | --------------- |
| `je`        | Jump if equal            | `==`            |
| `jne`       | Jump if not equal        | `!=`            |
| `jg`        | Jump if greater          | `>`             |
| `jl`        | Jump if less             | `<`             |
| `jge`       | Jump if greater or equal | `>=`            |
| `jle`       | Jump if less or equal    | `<=`            |

## Example
``` asm
; Write a NASM program that checks if a number is positive, negative, or zero and prints an appropriate message.

extern scanf
extern printf

section .data

num : dq 0
enter_msg: db "Enter a number",10,0
input: db "%ld",0
result: dq 0
positive: db "The number %ld is positive",10,0
negative: db "The number %ld is negative",10,0
zero: db "The number %ld is zero",10,0

section .text
global main
main:
push rbp
mov rbp,rsp
and rsp,-16

mov rdi,enter_msg
xor rax,rax
call printf

mov rdi,input
lea rsi,[num]
xor rax,rax
call scanf

mov rax,[num]

cmp rax,0
je pt_zero
jg pt_positive
jl pt_negative

pt_positive:

mov rdi,positive
mov rsi,rax
xor rax,rax
call printf
jmp end

pt_negative:

mov rdi,negative
mov rsi,rax
xor rax,rax
call printf
jmp end 

pt_zero:
mov rdi,zero
mov rsi,rax
xor rax,rax
call printf
jmp end

end:
mov rsp,rbp
pop rbp
mov rax,0
ret
```
