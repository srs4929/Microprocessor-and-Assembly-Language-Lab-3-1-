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
