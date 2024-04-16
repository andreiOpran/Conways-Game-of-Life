.data

   x: .long 5
   y: .long 10
   z: .long 20
   rez: .space 4

   print: .asciz "%d\n"

.text
.global main

sum3:

    push %ebp
    movl %esp, %ebp
    push %ebx
    mov 8(%ebp), %eax
    mov 12(%ebp), %ebx
    mov 16(%ebp), %Ecx
    addl %ebx, %eax
    addl %ecx, %eax
    pop %ebx
    pop %ebp
    ret

main:

    pushl z
    pushl y
    pushl x
    call sum3
    addl $12, %esp

    movl %eax, rez

    pushl rez
    pushl $print
    call printf
    addl $8, %esp

    jmp et_exit

et_exit:

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80


