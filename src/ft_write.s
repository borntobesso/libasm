section .text
	global ft_write
	extern __errno_location
	
ft_write:
	mov rax, 1			; System call number for write
	mov rdi, rdi		; File descriptor
	mov rsi, rsi		; Buffer address
	mov rdx, rdx		; Number of bytes to write
	syscall				; Invoke the system call
	
	test rax, rax		; Check if rax contains an error code without changing rax (~= bitwise AND)
	js .handle_error	; Jump to error handling code if rax < 0
	
	ret					; Return to caller
	
.handle_error:
	mov rdi, rax		; Move error code to rdi to pass as an argument to error_location
	call __errno_location WRT ..plt		; Call error_location to print error message
	
	mov [rax], rax		; Store error code in memory location pointed to by rax
	; ; The error code is now stored in rax, move it to a register or memory location for further processing
	; mov ebx, eax		; Move error code to ebx assuming the returned value is sufficiently small for lower 32 bits
	
	; ; Set the errno variable to the error code
	; mov [errno], ebx	; Assuming errno is defined as an external symbol
	
	ret