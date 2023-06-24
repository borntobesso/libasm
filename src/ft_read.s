section .text
	global ft_read
	extern errno_location

ft_read:
	mov rax, 0				; System call number for read
	mov rdi, rdi			; File descriptor
	mov rsi, rsi			; Buffer address
	mov rdx, rdx			; Number of bytes to read
	syscall					; Call the kernel
	
	test rax, rax			; Check for error
	js .handle_error		; Jump if error
	
	ret						; Return from function
	
.handle_error:
	mov rdi, rax		; Move error code to rdi to pass as an argument to error_location
	call errno_location	; Call error_location to print error message
	
	mov [rax], rax 		; Store error code in memory location pointed to by rax
	; ; The error code is now stored in rax, move it to a register or memory location for further processing
	; mov ebx, eax		; Move error code to ebx assuming the returned value is sufficiently small for lower 32 bits
	
	; ; Set the errno variable to the error code
	; mov [errno], ebx	; Assuming errno is defined as an external symbol
	
	ret