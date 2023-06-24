section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax		; Clear rax to store the result
	xor rcx, rcx		; Clear rcx to use as a counter

.compare_loop:
	mov al, [rdi + rcx]	; Load character from the first string into al
	cmp al, [rsi + rcx]	; Compare the character from the second string to al
	jne .done			; If the bytes are not equal, exit the loop
	
	cmp al, 0			; Check for null terminator
	je .done			; If the null terminator is found, exit the loop
	
	inc rcx				; Increment the counter
	jmp .compare_loop	; Repeat loop
	
.done:
	sub al, [rsi + rcx]	; Subtract the characters to determine the result
	ret					; Return from function