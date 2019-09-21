	.file	"MatrixMultiplication.c"
	.text
	.section	.rodata
.LC0:
	.string	"A_row_length = "
.LC1:
	.string	"%d"
.LC2:
	.string	"A_column_length = "
.LC3:
	.string	"B_row_length = "
.LC4:
	.string	"B_column_length = "
	.align 8
.LC5:
	.string	"Invalid size of operand matrices."
.LC6:
	.string	"Input A row vectors:"
.LC7:
	.string	"Input B row vectors:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$344, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
.L2:
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-152(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-148(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-140(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-152(%rbp), %edx
	movl	-140(%rbp), %eax
	cmpl	%eax, %edx
	je	.L3
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L2
.L3:
	movl	-152(%rbp), %esi
	movl	-148(%rbp), %edi
	movq	%rsp, %rax
	movq	%rax, -344(%rbp)
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -128(%rbp)
	movslq	%esi, %rax
	movq	%rax, -336(%rbp)
	movq	$0, -328(%rbp)
	movslq	%esi, %rax
	salq	$2, %rax
	movq	%rax, -336(%rbp)
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	movslq	%esi, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movslq	%edi, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%r15, %rdx
	imulq	%r12, %rdx
	movq	%r13, %rax
	imulq	%r14, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r12
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	movslq	%edi, %rax
	movq	%rax, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	-176(%rbp), %r14
	movq	-168(%rbp), %r15
	movq	%r15, %rdx
	movq	-192(%rbp), %r10
	movq	-184(%rbp), %r11
	imulq	%r10, %rdx
	movq	%r11, %rax
	imulq	%r14, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r10
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -112(%rbp)
	movl	-144(%rbp), %esi
	movl	-140(%rbp), %edi
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movslq	%esi, %rax
	movq	%rax, -368(%rbp)
	movq	$0, -360(%rbp)
	movslq	%esi, %rax
	leaq	0(,%rax,4), %rbx
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -96(%rbp)
	movslq	%esi, %rax
	movq	%rax, -208(%rbp)
	movq	$0, -200(%rbp)
	movslq	%edi, %rax
	movq	%rax, -224(%rbp)
	movq	$0, -216(%rbp)
	movq	-208(%rbp), %r10
	movq	-200(%rbp), %r11
	movq	%r11, %rdx
	movq	-224(%rbp), %r8
	movq	-216(%rbp), %r9
	imulq	%r8, %rdx
	movq	%r9, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r10, %rax
	mulq	%r8
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -240(%rbp)
	movq	$0, -232(%rbp)
	movslq	%edi, %rax
	movq	%rax, -256(%rbp)
	movq	$0, -248(%rbp)
	movq	-240(%rbp), %r8
	movq	-232(%rbp), %r9
	movq	%r9, %rdx
	movq	-256(%rbp), %r14
	movq	-248(%rbp), %r15
	imulq	%r14, %rdx
	movq	%r15, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r8, %rax
	mulq	%r14
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -88(%rbp)
	movl	-144(%rbp), %esi
	movl	-148(%rbp), %edi
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	movslq	%esi, %rax
	movq	%rax, -384(%rbp)
	movq	$0, -376(%rbp)
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -72(%rbp)
	movslq	%esi, %rax
	movq	%rax, -272(%rbp)
	movq	$0, -264(%rbp)
	movslq	%edi, %rax
	movq	%rax, -288(%rbp)
	movq	$0, -280(%rbp)
	movq	-272(%rbp), %r14
	movq	-264(%rbp), %r15
	movq	%r15, %rdx
	movq	-288(%rbp), %r10
	movq	-280(%rbp), %r11
	imulq	%r10, %rdx
	movq	%r11, %rax
	imulq	%r14, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r10
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -304(%rbp)
	movq	$0, -296(%rbp)
	movslq	%edi, %rax
	movq	%rax, -320(%rbp)
	movq	$0, -312(%rbp)
	movq	-304(%rbp), %r10
	movq	-296(%rbp), %r11
	movq	%r11, %rdx
	movq	-320(%rbp), %r8
	movq	-312(%rbp), %r9
	imulq	%r8, %rdx
	movq	%r9, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r10, %rax
	mulq	%r8
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -64(%rbp)
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, -132(%rbp)
	jmp	.L4
.L7:
	movl	$0, -136(%rbp)
	jmp	.L5
.L6:
	movq	-336(%rbp), %rcx
	shrq	$2, %rcx
	movl	-136(%rbp), %eax
	movslq	%eax, %rdx
	movl	-132(%rbp), %eax
	cltq
	imulq	%rcx, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -136(%rbp)
.L5:
	movl	-152(%rbp), %eax
	cmpl	%eax, -136(%rbp)
	jl	.L6
	addl	$1, -132(%rbp)
.L4:
	movl	-148(%rbp), %eax
	cmpl	%eax, -132(%rbp)
	jl	.L7
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, -132(%rbp)
	jmp	.L8
.L11:
	movl	$0, -136(%rbp)
	jmp	.L9
.L10:
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movl	-136(%rbp), %eax
	movslq	%eax, %rdx
	movl	-132(%rbp), %eax
	cltq
	imulq	%rcx, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -136(%rbp)
.L9:
	movl	-144(%rbp), %eax
	cmpl	%eax, -136(%rbp)
	jl	.L10
	addl	$1, -132(%rbp)
.L8:
	movl	-140(%rbp), %eax
	cmpl	%eax, -132(%rbp)
	jl	.L11
	movq	-64(%rbp), %rdi
	movq	-88(%rbp), %r9
	movq	-112(%rbp), %r8
	movl	-140(%rbp), %ecx
	movl	-148(%rbp), %edx
	movl	-144(%rbp), %esi
	movl	-152(%rbp), %eax
	subq	$8, %rsp
	pushq	%rdi
	movl	%eax, %edi
	call	mulMatrix
	addq	$16, %rsp
	movq	-64(%rbp), %rdx
	movl	-144(%rbp), %ecx
	movl	-148(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	printMatrix
	movl	$0, %eax
	movq	-344(%rbp), %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	mulMatrix
	.type	mulMatrix, @function
mulMatrix:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movl	%edx, -92(%rbp)
	movl	%ecx, -96(%rbp)
	movq	%r8, -104(%rbp)
	movq	%r9, -112(%rbp)
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -56(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movl	-88(%rbp), %edx
	movslq	%edx, %rcx
	subq	$1, %rcx
	movq	%rcx, -48(%rbp)
	movslq	%edx, %rcx
	movq	%rcx, %r12
	movl	$0, %r13d
	movl	-88(%rbp), %ecx
	movslq	%ecx, %rsi
	subq	$1, %rsi
	movq	%rsi, -40(%rbp)
	movslq	%ecx, %rsi
	movq	%rsi, %r10
	movl	$0, %r11d
	movl	$0, -60(%rbp)
	jmp	.L15
.L20:
	movl	$0, -64(%rbp)
	jmp	.L16
.L19:
	movl	$0, -72(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L17
.L18:
	movl	-60(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%eax, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-104(%rbp), %rsi
	addq	%rsi, %rdi
	movl	-68(%rbp), %esi
	movslq	%esi, %rsi
	movl	(%rdi,%rsi,4), %edi
	movl	-68(%rbp), %esi
	movslq	%esi, %r8
	movslq	%edx, %rsi
	imulq	%r8, %rsi
	leaq	0(,%rsi,4), %r8
	movq	-112(%rbp), %rsi
	addq	%rsi, %r8
	movl	-64(%rbp), %esi
	movslq	%esi, %rsi
	movl	(%r8,%rsi,4), %esi
	imull	%edi, %esi
	addl	%esi, -72(%rbp)
	addl	$1, -68(%rbp)
.L17:
	movl	-68(%rbp), %esi
	cmpl	-84(%rbp), %esi
	jl	.L18
	movl	-60(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%ecx, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	16(%rbp), %rsi
	leaq	(%rdi,%rsi), %r8
	movl	-64(%rbp), %esi
	movslq	%esi, %rsi
	movl	-72(%rbp), %edi
	movl	%edi, (%r8,%rsi,4)
	addl	$1, -64(%rbp)
.L16:
	movl	-64(%rbp), %esi
	cmpl	-88(%rbp), %esi
	jl	.L19
	addl	$1, -60(%rbp)
.L15:
	movl	-60(%rbp), %esi
	cmpl	-92(%rbp), %esi
	jl	.L20
	nop
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	mulMatrix, .-mulMatrix
	.section	.rodata
.LC8:
	.string	"Result matrix: "
.LC9:
	.string	"%-4d"
	.text
	.globl	printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movl	-36(%rbp), %ebx
	movslq	%ebx, %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	movslq	%ebx, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$0, -28(%rbp)
	jmp	.L23
.L27:
	movl	$0, -32(%rbp)
	jmp	.L24
.L26:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movslq	%ebx, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-40(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -32(%rbp)
	jne	.L25
	movl	$10, %edi
	call	putchar@PLT
.L25:
	addl	$1, -32(%rbp)
.L24:
	movl	-32(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L26
	addl	$1, -28(%rbp)
.L23:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L27
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	printMatrix, .-printMatrix
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
