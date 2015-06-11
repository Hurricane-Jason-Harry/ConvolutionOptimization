	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"naive"
.LC1:
	.string	"openmp"
.LC2:
	.string	"simd"
.LC3:
	.string	"cache block"
.LC4:
	.string	"loop unroll"
.LC5:
	.string	"register block"
.LC6:
	.string	"openmp & simd"
.LC7:
	.string	"openmp & simd & loop unroll"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"openmp & simd & loop unroll & register block"
	.section	.rodata.str1.1
.LC11:
	.string	"%-65s:%.5f speedup: %.4f\n"
.LC12:
	.string	"The result of %s is wrong\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1059:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movl	$8, %edi
	call	omp_set_num_threads
	leaq	144(%rsp), %rdi
	movl	$9, %ecx
	movl	$0, %eax
	rep stosq
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movl	$0, 80(%rsp)
	movq	$naive, 224(%rsp)
	movq	$openmp, 232(%rsp)
	movq	$simd, 240(%rsp)
	movq	$cacheBlock, 248(%rsp)
	movq	$loopUnroll, 256(%rsp)
	movq	$registerBlock, 264(%rsp)
	movq	$openmp_simd, 272(%rsp)
	movq	$openmp_simd_loopUnroll, 280(%rsp)
	movq	$openmp_simd_loopUnroll_registerBlock, 288(%rsp)
	movq	$.LC0, 304(%rsp)
	movq	$.LC1, 312(%rsp)
	movq	$.LC2, 320(%rsp)
	movq	$.LC3, 328(%rsp)
	movq	$.LC4, 336(%rsp)
	movq	$.LC5, 344(%rsp)
	movq	$.LC6, 352(%rsp)
	movq	$.LC7, 360(%rsp)
	movq	$.LC8, 368(%rsp)
	movl	$1, 96(%rsp)
	movl	$1, 100(%rsp)
	movl	$1, 104(%rsp)
	movl	$1, 108(%rsp)
	movl	$1, 112(%rsp)
	movl	$1, 116(%rsp)
	movl	$1, 120(%rsp)
	movl	$1, 124(%rsp)
	movl	$1, 128(%rsp)
	movl	$0, 28(%rsp)
	jmp	.L2
.L19:
	cmpl	$0, 96(%rsp,%r14)
	je	.L3
	movl	$98, %edx
	movl	$64, %esi
	leaq	32(%rsp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L24
	movq	32(%rsp), %r13
	jmp	.L4
.L24:
	movl	$0, %r13d
.L4:
	movl	$2129920, %edx
	movl	$64, %esi
	leaq	32(%rsp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L25
	movq	32(%rsp), %rbp
	jmp	.L5
.L25:
	movl	$0, %ebp
.L5:
	movl	$0, %eax
.L7:
	movw	$0, 0(%rbp,%rax)
	addq	$2, %rax
	cmpq	$16384, %rax
	jne	.L7
	leaq	16384(%rbp), %r15
	movl	$0, %ebx
.L9:
	call	rand
	movslq	%eax, %rdx
	imulq	$-2147450879, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$15, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movw	%ax, 0(%r13,%rbx)
	addq	$2, %rbx
	cmpq	$98, %rbx
	jne	.L9
	movq	%r15, %rbx
	leaq	2113536(%rbp), %r12
.L11:
	call	rand
	movslq	%eax, %rdx
	imulq	$-2147450879, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$15, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$16, %ecx
	subl	%edx, %ecx
	subl	%ecx, %eax
	movw	%ax, (%rbx)
	addq	$2, %rbx
	cmpq	%r12, %rbx
	jne	.L11
	movl	$8388608, %edx
	movl	$64, %esi
	leaq	32(%rsp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L26
	movq	32(%rsp), %rbx
	jmp	.L12
.L26:
	movl	$0, %ebx
.L12:
	movl	$8388608, %edx
	movl	$64, %esi
	leaq	32(%rsp), %rdi
	call	posix_memalign
	testl	%eax, %eax
	jne	.L27
	movq	32(%rsp), %r12
	jmp	.L13
.L27:
	movl	$0, %r12d
.L13:
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	imulq	$1000000, 32(%rsp), %rax
	addq	40(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*224(%rsp,%r14,2)
	vmovsd	144(%rsp,%r14,2), %xmm2
	vmovsd	%xmm2, 8(%rsp)
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	imulq	$1000000, 32(%rsp), %rax
	addq	40(%rsp), %rax
	leaq	144(%rsp), %rdx
	subq	16(%rsp), %rax
	js	.L14
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	jmp	.L15
.L14:
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L15:
	vdivsd	.LC9(%rip), %xmm0, %xmm0
	vdivsd	.LC10(%rip), %xmm0, %xmm0
	vaddsd	8(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r14,2)
	cmpl	$0, 28(%rsp)
	jne	.L16
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	naive
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	compare_matrix
	movl	%eax, 48(%rsp,%r14)
.L16:
	movq	%r13, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
.L3:
	addq	$4, %r14
	cmpq	$36, %r14
	jne	.L19
	addl	$1, 28(%rsp)
	cmpl	$100, 28(%rsp)
	je	.L18
.L2:
	movl	$0, %r14d
	jmp	.L19
.L18:
	movl	$0, %ebx
.L23:
	cmpl	$0, 96(%rsp,%rbx)
	je	.L20
	vmovsd	144(%rsp,%rbx,2), %xmm0
	movq	304(%rsp,%rbx,2), %rdx
	vmovsd	144(%rsp), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	movl	$.LC11, %esi
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk
.L20:
	cmpl	$0, 48(%rsp,%rbx)
	je	.L21
	movq	304(%rsp,%rbx,2), %rdx
	movl	$.LC12, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L21:
	addq	$4, %rbx
	cmpq	$36, %rbx
	jne	.L23
	movl	$0, %eax
	addq	$392, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1059:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.align 8
.LC10:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
