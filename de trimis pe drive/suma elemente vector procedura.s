.data

    v: .long 1, 2, 3, 4, 10
    n: .long 5
    print: .asciz "%d\n"

.text
.global main

main:

    pushl n
    pushl $v
    call sum
    addl $8, %esp

    pushl %eax
    pushl $print
    call printf
    addl $8, %esp

    jmp et_exit

sum:

    pushl %ebp
    movl %esp, %ebp
    mov $0, %eax    # s
    mov $0, %ecx    # i
    mov 12(%ebp), %edx # n
    pushl %edi
    pushl %ebx   # elem curent vector
    mov 8(%ebp), %edi

    sum_loop:

        cmp %ecx, %edx
        je sum_exit

        movl (%edi, %ecx, 4), %ebx
        addl %ebx, %eax
        incl %ecx
        jmp sum_loop

    sum_exit:

        popl %ebx
        popl %edi
        popl %ebp
        ret

et_exit:

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80


