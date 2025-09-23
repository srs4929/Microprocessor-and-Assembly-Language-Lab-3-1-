There are three tasks today. You must complete all of them.

### Task 1:
Run the code given below.
Try to understand what it does and how it works
Go through the register descriptions and operations given below the code, which may help you with this code.

```asm
extern	printf		
extern	scanf		

SECTION .data		

a:	dq	5
b:	dq	2	
c:	dq	0

enter:	db "Enter two numbers: ",0
out_fmt:	db "%ld + %ld =%ld", 10, 0	
out_fmt_2:	db "%s",10,0
in_fmt:		db "%d",0
SECTION .text

global main		
main:				
  push    rbp	
        
  mov rax,0
  mov rdi,out_fmt_2
  mov rsi,enter
  call printf
        
  mov rax, 0
	mov rdi, in_fmt
	mov rsi, a
	call scanf
	
	
  mov rax, 0
	mov rdi, in_fmt
	mov rsi, b
	call scanf	
	
	mov	rax,[a]
	mov	rbx,[b]		
	add	rax,rbx
	mov	[c],rax		
	mov	rdi,out_fmt		
	mov	rsi,[a]         
	mov	rdx,[b]        
	mov	rcx,[c]         
	mov	rax,0		
  call printf		

	pop	rbp		

	mov	rax,0		
	ret			
```





### Task 2:

Scan three variables a,b, and c. Print the value of 2a + 3b + c

### Task 3:

Scan a variable x. Print the value of the sum of the numbers from 1 to x. You may assume x is a positive integer.
