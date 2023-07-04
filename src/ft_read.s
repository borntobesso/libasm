section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0						; System call number for read
	mov rdi, rdi					; File descriptor
	mov rsi, rsi					; Buffer address
	mov rdx, rdx					; Number of bytes to read
	syscall							; Call the kernel

	test rax, rax					; Check for error
	js .handle_error				; Jump if error

	ret								; Return from function

.handle_error:		
	neg rax							; Negate the return value to get the error code
	mov rdi, rax					; Move error code to rdi for further use
	call __errno_location WRT ..plt	; Call error_location to get the address of the errno variable
	
	mov qword [rax], rdi 			; Store error code in memory location pointed to by rax
	mov rax, -1						; Set return value to -1
	
	ret