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

# Mapping of Format Specifiers to Assembly
| Format | C Meaning                      | Bytes Expected | NASM Directive | Example            |
| ------ | ------------------------------ | -------------- | -------------- | ------------------ |
| `%d`   | int (usually 32-bit)           | 4              | `dd`           | `num dd 0`         |
| `%ld`  | long int (64-bit on Linux x64) | 8              | `dq`           | `num dq 0`         |
| `%lld` | long long (also 64-bit here)   | 8              | `dq`           | `num dq 0`         |
| `%c`   | char (1 byte)                  | 1              | `db`           | `ch db 0`          |
| `%s`   | string (array of chars)        | varies         | `db ... ,0`    | `msg db "Hello",0` |
| `%f`   | float (32-bit)                 | 4              | `dd`           | `flt dd 0.0`       |
| `%lf`  | double (64-bit)                | 8              | `dq`           | `dbl dq 0.0`       |

## LEA (Load Effective Address)

The `lea` instruction loads the *address* of a memory operand into a register, **not the value** stored there.

### Why we need it?
- Sometimes we want to pass the *address* of a variable (e.g., to `scanf`, which needs a pointer).
- Useful for pointer arithmetic without actually touching memory.
- Saves instructions compared to doing manual `mov` and `add`.

### Syntax

- `destination`: register (where the computed address goes).
- `[source]`: a memory operand (brackets required).

### Example 1 – Address for `scanf`
```asm
num dq 0          ; 8 bytes reserved

mov rdi, in_fmt   ; "%ld"
lea rsi, [num]    ; rsi = &num (address of num)
call scanf        ; scanf("%ld", &num)
```
### Example-2 -Pointer arithmetic 
``` asm
lea rax, [rbx+4*rcx]
```
This calculates rbx + (4*rcx) and stores it in rax.Here,no memory access happens – only the calculated address is loaded.

### When to use `lea` vs `mov`
* Use `mov` when you want the value at an address.
* Use `lea` when you want the address itself.
``` asm
mov rax, [var]   ; rax = value stored at var
lea rax, [var]   ; rax = address of var
```

