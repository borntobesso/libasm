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
	je .equal			; If the null terminator is found, exit the loop
	
	inc rcx				; Increment the counter
	jmp .compare_loop	; Repeat loop
	
.done:
	sub al, [rsi + rcx]	; Subtract the characters to determine the result
	js .negative		; If the result is negative, the first string is less than the second
	mov rax, 1			; If the result is positive, the first string is greater than the second		
	ret					; Return from function

.negative:
	mov rax, -1
	ret					; Return from function	

.equal:
	mov rax, 0
	ret					; Return from function