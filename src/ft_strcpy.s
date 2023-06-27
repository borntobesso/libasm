; The XOR operation sets the resultant bit to 1,
; if and only if the bits from the operands are different.
; XORing an operand with itself changes the operand to 0.
; This is used to clear a register.

section .text
    global ft_strcpy

ft_strcpy:
    xor rax, rax        ; clear rax to store the return value
    mov rcx, 0          ; Initialize counter to 0

.copy_loop:
    mov bl, [rsi + rcx] ; Load next character from source into al
    mov [rdi + rcx], bl ; Copy character from source to destination
    cmp bl, 0           ; Check for null terminator
    je .done            ; If null terminator, exit
    inc rcx             ; Increment counter
    jmp .copy_loop      ; Repeat loop
    
.done:
    mov rax, rdi        ; Move destination pointer to rax (return value)
    ret                 ; Return from function