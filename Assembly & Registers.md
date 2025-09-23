# 8086 Registers

The Intel 8086 microprocessor has **registers** — small, fast storage locations inside the CPU.  
They are used to hold data, addresses, counters, and flags while executing instructions.

## 1.General Purpose Registers

The 8086 has four main general-purpose registers: **AX, BX, CX, DX**. Each has a typical role:

| Register | High/Low | Typical Use                        | Example (C)                             | Example (Assembly 8086/NASM)                       |
|----------|----------|-----------------------------------|----------------------------------------|---------------------------------------------------|
| **AX**  | AH/AL    | Accumulator – arithmetic, I/O      | `int a=5, b=3; int c = a + b;`         | `mov ax, 5`<br>`add ax, 3`                       |
| **BX**  | BH/BL    | Base register – memory addressing   | `char str[]="Hi"; char x = str[0];`    | `mov bx, str`<br>`mov al, [bx]`                  |
| **CX**  | CH/CL    | Counter for loops/shifts            | `for(int i=0;i<5;i++) putchar('*');`   | `mov cx,5`<br>`loop_start: mov ah,02h`<br>`mov dl,'*'`<br>`int 21h`<br>`loop loop_start` |
| **DX**  | DH/DL    | Data register – I/O, multiply/divide | `int a=1000, b=10; int q=a/b; int r=a%b;` | `mov ax,1000`<br>`mov bx,10`<br>`div bx`        |

### Notes

- **AX (Accumulator)**: Used in arithmetic and logic operations; many instructions implicitly use it.  
- **BX (Base register)**: Handy for memory access and pointer calculations.  
- **CX (Counter register)**: Used with loop instructions and shift/rotate operations.  
- **DX (Data register)**: Complements AX in 16-bit operations and serves as a port address register for I/O instructions.
## 2. Segment Registers

Memory is divided into **segments** (each 64 KB). Segment registers store the **starting addresses** of segments.

| Register | Purpose | Example | Explanation |
|----------|---------|---------|------------|
| **CS**  | Code Segment | `mov ax, cs` | Starting address of program instructions. |
| **DS**  | Data Segment | `mov ax, ds` | Starting address of program data. |
| **SS**  | Stack Segment | `mov ax, ss` | Starting address of the stack. |
| **ES**  | Extra Segment | `mov ax, es` | Extra memory segment, often used in string operations. |

## 3. Pointer and Index Registers
Used for stack management, memory addressing, and string operations.
| Register | Purpose | Example | Explanation |
|----------|---------|---------|------------|
| **SP**  | Stack Pointer | `mov sp, 100h` |Points to top of stack in SS. |
| **BP**  | Base Pointer | `mov bp, sp` | Access function parameters in stack. |
| **SI**  | Source Index| `mov si, 0 ` |Source for string operations. |
| **DI**  | Destination Index  | `mov di, 0` | Destination for string operations.|

## 4. Flag Register

The **Flag Register** stores the CPU status and controls operations. Each flag indicates the outcome of an operation or affects CPU behavior.

| Flag | Meaning                         |
|------|---------------------------------|
| CF   | Carry Flag                      |
| ZF   | Zero Flag                        |
| SF   | Sign Flag                        |
| OF   | Overflow Flag                    |
| PF   | Parity Flag                      |
| AF   | Auxiliary Carry Flag             |
| DF   | Direction Flag (string operations) |
| IF   | Interrupt Enable Flag            |

**Example – Using Zero Flag:**

```asm
mov al, 5
sub al, 5       ; ZF is set because result is 0
jnz not_zero    ; jump if ZF = 0


  
