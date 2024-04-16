.data
	
	n: .long 4
	v: .long 2, 3, 5, 7
	s: .long 0
	
	formatPrintf: .asciz "Media aritmetica a elementelor vectorului este %d rest %d \n"
.text
.global main

main:
	
	movl $0, %ecx
	movl $v, %edi
	movl $0, %eax
	
et_for:

	cmp n, %ecx
	je et_exit
	movl (%edi, %ecx, 4), %ebx 
	# de aici incepe prelucrarea cu %ebx
	add %ebx, %eax
	inc %ecx
	jmp et_for	
	#la finalul FOR-ului avem suma elementelor in %eax

et_exit:
	
	#PRELUCRARE MEDIE
	
	#movl %eax, s
	mov $0, %edx
	#mov s, %eax
	mov n, %ebx
	idiv %ebx	
	
	#AFISARE
	
	push %edx
	push %eax
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
