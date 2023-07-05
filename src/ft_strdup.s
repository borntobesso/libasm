section .text
	global ft_strdup
	extern malloc, __errno_location
	extern ft_strlen, ft_write, ft_strcpy
	
ft_strdup:
	; Calculate the length of the input string
	push rdi						; Save the input string address
	call ft_strlen 					; Call ft_strlen to calculate the length of the input string
	mov rdi, rax					; Move the length of the input string to rdi
	inc rdi							; Add 1 to the length of the input string to account for the null terminator
				
	; Allocate memory for the new string
	call malloc	WRT ..plt			; Call malloc to allocate memory for the new string
	test rax, rax					; Check if malloc failed
	jz malloc_fail					; Jump to malloc_fail if malloc failed
				
	; Copy the input string to the new string
	mov rdi, rax					; Move the new string address to rdi
	pop rsi							; Restore the input string address
	call ft_strcpy					; Call ft_strcpy to copy the input string to the new string

	ret	
	
malloc_fail:
	mov rdi, 12						; Move 12 (ENOMEM) to rdi
	call __errno_location WRT ..plt	; Call errno_location to get the address of errno
	mov [rax], rdi					; Move 12 (ENOMEM) to errno
	jmp error_exit					; Jump to error_exit
	
error_exit:
	xor rax, rax					; Return NULL (0) as the result
	ret