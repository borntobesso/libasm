; In the x86_64 calling convention (used in 64-bit mode),
; function arguments are typically passed in registers.
; The first argument is passed in the rdi register, the second in rsi, the third in rdx, and so on.
; In the x86_64 architecture, the rax register is the primary register used for returning values from functions.
; It is the designated register for function return values of 64 bits or less. 
; By convention, the return value of a function is typically stored in the rax register before the function returns.
; http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html#:~:text=Calling%20Convention&text=The%20caller%20uses%20registers%20to,off%20the%20stack%20in%20order.
; The caller uses registers to pass the first 6 arguments to the callee.  Given the arguments in left-to-right order, the order of registers used is: %rdi, %rsi, %rdx, %rcx, %r8, and %r9.
; Any remaining arguments are passed on the stack in reverse order so that they can be popped off the stack in order. 
; The callee places its return value in %rax and is responsible for cleaning up its local variables as well as for removing the return address from the stack. 

section. text
    global ft_strlen

ft_strlen:
    mov rax, 0          ; initialize counter to 0
.loop:
    mov al, [rdi+rax]   ; load byte from memory at address rdi+rax into al
    cmp al, 0           ; check for null terminator
    je .done            ; if null terminator, exit loop
    inc rax             ; increment counter
    jmp .loop           ; repeat loop
.done:
    ret                 ; return counter in rax