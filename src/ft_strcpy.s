; The XOR operation sets the resultant bit to 1,
; if and only if the bits from the operands are different.
; XORing an operand with itself changes the operand to 0.
; This is used to clear a register.

section .text
    global ft_strcpy

ft_strcpy:
    xor rax, rax        ; clear rax
    mov rcx, 0          ; Initialize counter to 0

.copy_loop:
    mov al, [rdi + rcx] ; Load next character from source into al
    