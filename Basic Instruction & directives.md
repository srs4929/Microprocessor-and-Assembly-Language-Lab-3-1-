# Basic Instruction
### 1. MOV Instruction
The `MOV` instruction **copies data** from one location to another, similar to the assignment operator in high-level languages.  

**Syntax:**  
```asm
mov dest, src
```

# Directives
Directives are instructions for the assembler, not the CPU. They do not generate machine code.
## Common Uses

- **Define constants or macros**  
- **Reserve memory locations**  
- **Organize memory into segments**  
- **Include external files or libraries**  
- **Conditionally assemble code**

## 1. %define Directive
Used to define **macros or named constants**.  
Macros are **flexible**, can be redefined, and can represent more than simple numbers.

**Syntax:**  
```asm
%define NAME value
; example
%define SIZE 100
mov eax, SIZE   ; uses the macro SIZE defined above

```
## 2. Data directives
Used to reserve memory and optionally initialize it.
###  RESX Directives
Reserves memory **without an initial value**:

| Directive | Meaning               |
|-----------|----------------------|
| RESB      | Reserve bytes         |
| RESW      | Reserve words         |
| RESD      | Reserve double words  |
| RESQ      | Reserve quad words    |

**Example:**
```asm
buffer resb 10    ; reserves 10 uninitialized bytes

```
### DX Directives
Reserves memory with an initial value:

| Directive | Meaning               |
|-----------|---------------------- |
| DB        |    Define byte        |
| DW        |     Define Words      |
| DD        |  Define Double Word   |
| DQ        |   Define quad word    |
``` asm
L1  db 0           ; byte initialized to 0
L2  dw 1000        ; word initialized to 1000
L3  db 110101b     ; byte initialized to binary 110101 (53 decimal)
L4  db 12h         ; byte initialized to hex 12 (18 decimal)
L5  db 17o         ; byte initialized to octal 17 (15 decimal)
L6  dd 1A92h       ; double word initialized to hex 1A92
L7  db "A"         ; byte initialized to ASCII 65
```





