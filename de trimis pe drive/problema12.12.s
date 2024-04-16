.data

    v: .space 40
    n: .space 4
    i: .space 4
    x: .space 4
    copie: .space 4
    scan: .asciz "%d"
	print: .asciz "%d "

.text
.global main

main:

    pushl $n			# CITIRE N
	pushl $scan
	call scanf
	addl $8, %esp

    movl $0, i

et_for_citire:

    movl i, %ecx
    cmp n, %ecx
    je et_for_cont

    movl %ecx, copie

    pushl %ebp		# CITIRE X
	pushl $scan
	call scanf
	addl $8, %esp

    movl copie, %ecx

    lea v, %edi
    movl %ebp, (%edi, %ecx, 4)

    incl i
    jmp et_for_citire

et_for_cont:

    movl $0, i

et_for_scriere:

    movl i, %ecx
    cmp %ecx, n
    je et_continuare

    lea v, %edi
	movl (%edi, %ecx, 4), %ebx
	pushl %ebx
	pushl $print
	call printf
	addl $8, %esp

    incl i
    jmp et_for_citire

et_continuare:



et_exit:

    mov $4, %eax
    xor %ebx, %ebx
    int $0x80
