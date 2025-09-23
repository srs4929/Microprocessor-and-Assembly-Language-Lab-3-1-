``` asm


;========================
; 1. Segment Definitions
;========================
section .data          ; Data segment: store constants and variables
                       ; initialized data is put in the data segment here
    msg db "Hello, World!", 0  ; Null-terminated string
    num db 10                  ; Example variable

section .bss           ; BSS segment: uninitialized variables
    buffer resb 16             ; Reserve 16 bytes

section .text          ; Code segment: instructions
    global _start      ; Entry point for linker (if used)

;========================
; 2. Program Start
;========================
_start:

    ; Example: move value into register
    mov al, [num]      ; Load value of num into AL

    ; Example: call a procedure
    call print_msg

    ; Exit program (for Linux NASM)
    mov eax, 1         ; sys_exit
    int 0x80

;========================
; 3. Procedures
;========================
print_msg:
    ; Print message in DOS (example using int 21h)
    mov dx, msg
    mov ah, 09h
    int 21h
    ret

;========================
; 4. End of Program
;========================
