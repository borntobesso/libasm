section .text
	global ft_write
	extern __errno_location
	
ft_write:
	mov rax, 1						; System call number for write
	mov rdi, rdi					; File descriptor
	mov rsi, rsi					; Buffer address
	mov rdx, rdx					; Number of bytes to write
	syscall							; Invoke the system call

	test rax, rax					; Check if rax contains an error code without changing rax (~= bitwise AND)
	js .handle_error				; Jump to error handling code if rax < 0

	ret								; Return to caller
	
.handle_error:
	neg rax							; Negate the return value to get the error code
	mov rdi, rax					; Move error code to rdi for further use
	call __errno_location WRT ..plt	; Call error_location to get the address of the errno variable
	
	mov qword [rax], rdi 			; Store error code in memory location pointed to by rax
	mov rax, -1						; Set return value to -1
	
	ret