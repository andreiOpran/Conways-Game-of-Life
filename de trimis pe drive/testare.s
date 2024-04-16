# sa se implementeze o procedura recursiva pentru a calcula
# suma nr de la 0 la n cu n>0, citit
.data
    n: .space 4
    format: .asciz "%d"
    formata: .asciz "Suma numerelor mai mici sau egale cu %d este %d\n"
.text

.global main

main:

    pushl $n
    pushl $format
    call scanf
    addl $8, %esp

    xorl %eax, %eax
    
    pushl n
    call recursivitate
    addl $4, %esp
    
    pushl %eax
    pushl n
    pushl $formata
    call printf
    addl $12, %esp

    pushl $0
    call fflush
    addl $4, %esp

    jmp exit

recursivitate:

    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    cmp $0, %eax
    je recursivitate_exit
    decl %eax
    pushl %eax
    call recursivitate
    movl 8(%ebp), %edx
    addl %edx, %eax

recursivitate_exit:

    movl %ebp, %esp
    popl %ebp
    ret 

exit:

    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
