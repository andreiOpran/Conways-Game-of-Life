.data						#							 i j
	m: .space 4				# linii						(2,1) -> 9 (i * n + j)
	n: .space 4 			# coloane					
	p: .space 4 			# nr celule vii				(%edi, %ecx, 4)  # aici %ecx devine i * n + j (index array)
	k: .space 4
	x: .space 4
	y: .space 4
	s: .space 4
	cn: .space 4
	cont: .space 4
	copiere: .space 4
	copieeax: .space 4
	copieecx: .space 4

	mat: .space 1600
	cmat: .space 1600
	i: .space 4
	j: .space 4

	ind: .space 4		# FILE HANDLING

	scan: .asciz "%d"
	print: .asciz "%d "
	endl: .asciz "\n"

	input: .asciz "r"
	output: .asciz "w"

	inttxt: .asciz "in.txt"
	outtxt: .asciz "out.txt"


	
.text
.global main

main:

	pushl $input
	pushl $inttxt
	call fopen
	addl $8, %esp
	movl %eax, ind

	pushl $m			# CITIRE M
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp
	
	pushl $n			# CITIRE N
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp

	pushl $p			# CITIRE P
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp


	movl $mat, %edi   # FOR P
	movl $0, %ecx

	movl $0, cont

et_for_p:

	mov cont, %ecx
	cmp p, %ecx
	je et_citire_k

	pushl $x			# CITIRE X
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp

	pushl $y			# CITIRE Y
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp

	incl x
	incl y

	movl x, %eax
	addl $2, n
	mull n
	subl $2, n
	addl y, %eax

	movl $1, (%edi, %eax, 4)

	incl cont
	jmp et_for_p

et_citire_k:

	pushl $k			# CITIRE K
	pushl $scan
	pushl ind
	call fscanf
	addl $12, %esp

	incl m
	incl n
	mov $0, %ecx

et_evolutii:			# EVOLUTII
	
	movl %ecx, copieecx
	cmp %ecx, k
	je et_afis_mat

	movl $1, i
	et_for_evolutii_linii:

		movl i, %ecx
		cmp m, %ecx
		je et_incrementare_k
		movl $1, j

				

		et_for_evolutii_coloane:

			movl j, %ecx
			cmp n, %ecx
			je et_for_evolutii_continuare

			mov %ecx, cont

			incl n

			movl $0, s

			movl i, %eax
			mull n
			addl j, %eax

			movl %eax, copieeax

			subl n, %eax		# mat[i - 1][j - 1]
			subl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i - 1][j]
			subl n, %eax		
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i - 1][j + 1]
			subl n, %eax		
			addl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i][j - 1]		
			subl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i][j + 1]		
			addl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i + 1][j - 1]
			addl n, %eax		
			subl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i + 1][j]
			addl n, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s

			movl copieeax, %eax # mat[i + 1][j + 1]
			addl n, %eax
			addl $1, %eax
			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			addl %ebx, s			
			
			movl copieeax, %eax

			decl n

			# movl s, %ebx
			# pushl %ebx
			# pushl $print
			# call printf
			# addl $8, %esp

			movl (%edi, %eax, 4), %ebx
			movl s, %ecx
			
			cmp $0, %ebx
			je et_if1

			cmp $1, %ebx
			je et_if2

			et_if1:

			cmp $3, %ecx
			je et_atribuire_1
			jmp et_atribuire_0

			et_if2:

			cmp $2, %ecx
			je et_atribuire_1
			cmp $3, %ecx
			je et_atribuire_1
			jmp et_atribuire_0

			et_atribuire_1:

			lea cmat, %edi
			movl $1, (%edi, %eax, 4)
			jmp et_cont_evolutii

			et_atribuire_0:

			lea cmat, %edi
			movl $0, (%edi, %eax, 4)
			jmp et_cont_evolutii

			et_cont_evolutii:

			# movl copieeax, %eax

			# lea cmat, %edi
			# movl (%edi, %eax, 4), %ebx
			# lea mat, %edi
			# movl %ebx, (%edi, %eax, 4)


			mov cont, %ecx
			incl j
			jmp et_for_evolutii_coloane

	et_for_evolutii_continuare:

		# pushl $endl
		# call printf
		# addl $4, %esp

		incl i
		jmp et_for_evolutii_linii

et_incrementare_k:

mov n, %esi
mov m, %ebp

movl $1, i			

	for_linii_copiere:

		movl i, %ecx
		cmp %ecx, %ebp
		je et_incrementare_k_2

		movl $1, j

		for_coloane_copiere:

			movl j, %ecx
			cmp %ecx, %esi
			je et_cont_copiere

			incl %esi
			
			movl i, %eax
			mull %esi
			addl j, %eax

			decl %esi

			lea cmat, %edi
			movl (%edi, %eax, 4), %ebx
			lea mat, %edi
			movl %ebx, (%edi, %eax, 4)

			incl j
			jmp for_coloane_copiere
		
		et_cont_copiere:

			incl i
			jmp for_linii_copiere

et_incrementare_k_2:

	movl copieecx, %ecx
	incl %ecx
	jmp et_evolutii

	

et_afis_mat:

	decl n
	decl m

	mov n, %esi
	mov m, %ebp
	incl %esi
	incl n
	# incl %ebp
	# incl %esi				# MATRICEA EXTINSA
	incl n					# MATRICEA EXTINSA
	incl %ebp				# MATRICEA EXTINSA
	movl $1, i				# MATRICEA EXTINSA

	pushl $output
	pushl $outtxt
	call fopen
	addl $8, %esp
	movl %eax, ind

	for_linii:

		movl i, %ecx
		cmp %ecx, %ebp
		je et_exit
		movl $1, j			# MATRICEA EXTINSA

		for_coloane:

			movl j, %ecx
			cmp %ecx, %esi
			je et_endl

			movl i, %eax
			mull n			# MATRICEA EXTINSA
			addl j, %eax

			lea mat, %edi
			movl (%edi, %eax, 4), %ebx
			pushl %ebx
			pushl $print
			pushl ind
			call fprintf
			addl $12, %esp

			pushl $0
			call fflush
			addl $4, %esp

			incl j
			jmp for_coloane

		et_endl:

			pushl $endl
			pushl ind
			call fprintf
			addl $8, %esp

			incl i
			jmp for_linii

et_exit:

	pushl $0
	call fflush
	addl $4, %esp

	movl $1, %eax
    xor %ebx, %ebx
    int $0x80
