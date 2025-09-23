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
### Equivalent C Code
```C
#include <stdio.h>

long num1 = 0;   // first number (64-bit, matches dq)
long num2 = 0;   // second number (64-bit)

int main() {
    printf("Enter two numbers: ");

    // take input
    scanf("%ld", &num1);
    scanf("%ld", &num2);

    // print output
    printf("First number: %ld\n", num1);
    printf("Second number: %ld\n", num2);

    return 0;
}
```
### Data Section( initialized values)
```asm
section .data
num1:       dq 0                   ; first number (8 bytes for %ld)
num2:       dq 0                   ; second number (8 bytes for %ld)

enter_msg:  db "Enter two numbers: ",0
in_fmt:     db "%ld",0             ; format specifier for 64-bit integer input
out_fmt:    db "First number: %ld",10,0
out_fmt2:   db "Second number: %ld",10,0
```
* `dq 0` reserves 8 bytes (quadword) for storing integers (needed for %ld).
* db "string",0 stores a null-terminated string for C functions.
* `in_fmt` holds the input format for scanf (%ld = long int, 64-bit on Linux).
* `out_fmt` and `out_fmt2` are format strings for printf.
### Reading numbers
```asm
    mov rdi, in_fmt      ; "%ld"
    lea rsi, [num1]      ; address of num1 (scanf needs pointer)
    xor rax, rax
    call scanf
```
* `scanf("%ld", &num1)` equivalent.
* `lea rsi, [num1]:` loads the address of num1 into rsi.
* Without `lea`, we would pass the value instead of the pointer → segfault.
### Printing  Number
```asm
    mov rdi, out_fmt
    mov rsi, [num1] ; value of num1
    xor rax, rax 
    call printf
```
which is equivalent to
```C
printf("First number: %ld\n", num1);
```
`[num1]` loads the value stored in num1 (not the address this time).
