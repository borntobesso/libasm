section .data
	malloc_msg:
		.string db "malloc failed", 10
		.len equ $ - malloc_msg.string
	
section .text
	global ft_strdup
	extern malloc, __errno_location
	extern ft_strlen, ft_write
	
ft_strdup:
	; Calculate the length of the input string
	push rdi					; Save the input string address
	call ft_strlen 				; Call ft_strlen to calculate the length of the input string
	mov rdi, rax				; Move the length of the input string to rdi
	inc rdi						; Add 1 to the length of the input string to account for the null terminator
				
	; Allocate memory for the new string
	push rdi					; Save the length of the input string
	call malloc	WRT ..plt				; Call malloc to allocate memory for the new string
	test rax, rax				; Check if malloc failed
	jz malloc_fail				; Jump to malloc_fail if malloc failed
				
	; Copy the input string to the new string
	mov rdi, rax				; Move the new string address to rdi
	pop rcx
	dec rcx						; Restore the length of the input string and use it as a counter
	pop rsi						; Restore the input string address
	rep movsb					; Copy the input string to the new string (from rsi to rdi, Repeat String Operation Prefix)
	mov byte [rdi + rcx], 0			; Add the null terminator to the new string
	mov rax, rdi				; Move the new string address to rax
	ret	
	
malloc_fail:
	mov rdi, 2					; Move 2 (stderr) to rdi
	mov rsi, malloc_msg.string	; Move the malloc failed message address to rdi
	mov rdx, malloc_msg.len		; Move 14 (the length of the malloc failed message) to rdx
	call ft_write 
	mov rdi, 12					; Move 12 (ENOMEM) to rdi
	call __errno_location WRT ..plt			; Call errno_location to get the address of errno
	mov [rax], rdi				; Move 12 (ENOMEM) to errno
	jmp error_exit				; Jump to error_exit
	
error_exit:
	xor rax, rax				; Return NULL (0) as the result
	ret