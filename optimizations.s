	.file	"optimizations.c"
	.text
	.type	openmp._omp_fn.0, @function
openmp._omp_fn.0:
.LFB1067:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, %rbx
	call	omp_get_num_threads
	movl	%eax, %ebp
	call	omp_get_thread_num
	movl	%eax, %esi
	movl	$1024, %eax
	cltd
	idivl	%ebp
	movl	%eax, %ecx
	movl	%edx, %edi
	cmpl	%edx, %esi
	jl	.L2
.L13:
	imull	%ecx, %esi
	leal	(%rsi,%rdi), %r15d
	leal	(%r15,%rcx), %eax
	movl	%eax, 12(%rsp)
	cmpl	%eax, %r15d
	jge	.L1
	movl	%r15d, %eax
	sall	$10, %eax
	movl	%eax, 4(%rsp)
	movl	%r15d, %eax
	negl	%eax
	sall	$10, %eax
	movl	%eax, 8(%rsp)
.L5:
	movl	4(%rsp), %r12d
	movl	%r12d, %r13d
	addl	8(%rsp), %r13d
	movl	$0, %ebp
.L7:
	movl	$0, %r10d
	leal	1024(%r12), %r11d
	jmp	.L4
.L16:
	addl	$1, %r15d
	addl	$1024, 4(%rsp)
	subl	$1024, 8(%rsp)
	cmpl	12(%rsp), %r15d
	jne	.L5
	jmp	.L1
.L17:
	addl	$1024, %r13d
	addl	$7, %ebp
	subl	$1024, %r12d
	cmpl	$49, %ebp
	jne	.L7
	jmp	.L16
.L4:
	leal	(%r10,%rbp), %edx
	movslq	%edx, %rdx
	movq	8(%rbx), %rax
	movzwl	(%rax,%rdx,2), %r9d
	movl	%r11d, %r8d
	subl	%r10d, %r8d
	movl	%r12d, %eax
	subl	%r10d, %eax
	leal	(%r10,%r13), %edi
	jmp	.L8
.L18:
	addl	$1, %r10d
	cmpl	$7, %r10d
	jne	.L4
	jmp	.L17
.L8:
	leal	(%rax,%rdi), %ecx
	movslq	%ecx, %rcx
	movq	(%rbx), %rdx
	movslq	%eax, %r14
	movq	16(%rbx), %rsi
	movzwl	(%rsi,%r14,2), %esi
	imulq	%r9, %rsi
	addq	%rsi, (%rdx,%rcx,8)
	addl	$1, %eax
	cmpl	%r8d, %eax
	jne	.L8
	jmp	.L18
.L2:
	leal	1(%rax), %ecx
	movl	$0, %edi
	jmp	.L13
.L1:
	addq	$24, %rsp
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
.LFE1067:
	.size	openmp._omp_fn.0, .-openmp._omp_fn.0
	.type	openmp_simd._omp_fn.1, @function
openmp_simd._omp_fn.1:
.LFB1068:
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
	andq	$-32, %rsp
	subq	$16, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %esi
	movl	$1024, %eax
	cltd
	idivl	%r12d
	movl	%eax, %ecx
	movl	%edx, %edi
	cmpl	%edx, %esi
	jl	.L21
.L32:
	imull	%ecx, %esi
	leal	(%rsi,%rdi), %r12d
	leal	(%r12,%rcx), %eax
	movl	%eax, 8(%rsp)
	cmpl	%eax, %r12d
	jge	.L20
	movl	%r12d, %r13d
	sall	$10, %r13d
.L24:
	movslq	%r13d, %r10
	salq	$3, %r10
	leaq	8192(%r10), %rdi
	movl	%r13d, %r15d
	movl	$0, %r14d
.L26:
	movslq	%r15d, %r8
	addq	%r8, %r8
	leaq	-14(%r8), %r11
	movl	%r14d, %r9d
	jmp	.L23
.L25:
	addl	$1, %r12d
	addl	$1024, %r13d
	cmpl	%r12d, 8(%rsp)
	jg	.L24
	jmp	.L20
.L33:
	subl	$1024, %r15d
	addl	$7, %r14d
	cmpl	$49, %r14d
	jne	.L26
	jmp	.L25
.L23:
	movslq	%r9d, %rdx
	movq	8(%rbx), %rax
	movzwl	(%rax,%rdx,2), %eax
	movl	%eax, 12(%rsp)
	vbroadcastss	12(%rsp), %ymm2
	movq	%r8, %rdx
	movq	%r10, %rax
	jmp	.L27
.L34:
	addl	$1, %r9d
	subq	$2, %r8
	cmpq	%r11, %r8
	jne	.L23
	jmp	.L33
.L27:
	movq	%rax, %rcx
	addq	(%rbx), %rcx
	vmovdqu	(%rcx), %ymm1
	movq	%rdx, %rsi
	addq	16(%rbx), %rsi
	vmovdqu	(%rsi), %ymm0
	vpmovzxwd	%xmm0, %ymm0
	vpmulld	%ymm0, %ymm2, %ymm0
	vpmovzxdq	%xmm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rcx)
	addq	$32, %rax
	addq	$8, %rdx
	cmpq	%rdi, %rax
	jne	.L27
	jmp	.L34
.L21:
	leal	1(%rax), %ecx
	movl	$0, %edi
	jmp	.L32
.L20:
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
.LFE1068:
	.size	openmp_simd._omp_fn.1, .-openmp_simd._omp_fn.1
	.type	openmp_simd_loopUnroll._omp_fn.2, @function
openmp_simd_loopUnroll._omp_fn.2:
.LFB1069:
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
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %esi
	movl	$1024, %eax
	cltd
	idivl	%r12d
	movl	%eax, %ecx
	movl	%edx, %edi
	cmpl	%edx, %esi
	jl	.L37
.L48:
	imull	%ecx, %esi
	leal	(%rsi,%rdi), %eax
	movl	%eax, 20(%rsp)
	addl	%eax, %ecx
	movl	%ecx, 12(%rsp)
	cmpl	%ecx, %eax
	jge	.L36
	sall	$10, %eax
	movl	%eax, 16(%rsp)
.L40:
	movl	16(%rsp), %eax
	movslq	%eax, %r13
	salq	$3, %r13
	leaq	8192(%r13), %r9
	movl	%eax, 24(%rsp)
	movl	$0, %r14d
.L42:
	movslq	24(%rsp), %r10
	addq	%r10, %r10
	leaq	-14(%r10), %r12
	movl	%r14d, %r11d
	jmp	.L39
.L51:
	addl	$1, 20(%rsp)
	addl	$1024, 16(%rsp)
	movl	20(%rsp), %eax
	cmpl	%eax, 12(%rsp)
	jg	.L40
	jmp	.L36
.L52:
	subl	$1024, 24(%rsp)
	addl	$7, %r14d
	cmpl	$49, %r14d
	jne	.L42
	jmp	.L51
.L39:
	movslq	%r11d, %rdx
	movq	8(%rbx), %rax
	movzwl	(%rax,%rdx,2), %eax
	movl	%eax, 28(%rsp)
	vbroadcastss	28(%rsp), %ymm0
	movq	%r10, %rcx
	movq	%r13, %rax
	jmp	.L43
.L53:
	addl	$1, %r11d
	subq	$2, %r10
	cmpq	%r12, %r10
	jne	.L39
	jmp	.L52
.L43:
	movq	(%rbx), %rdx
	leaq	(%rax,%rdx), %r15
	vmovdqu	(%r15), %ymm7
	leaq	32(%rax), %r8
	vmovdqu	32(%rdx,%rax), %ymm3
	leaq	64(%rax), %rdi
	vmovdqu	64(%rdx,%rax), %ymm6
	leaq	96(%rax), %rsi
	vmovdqu	96(%rdx,%rax), %ymm5
	movq	%rcx, %rdx
	addq	16(%rbx), %rdx
	vmovdqu	(%rdx), %ymm1
	vmovdqa	%xmm1, %xmm2
	vpmovzxwd	%xmm2, %ymm2
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxwd	%xmm1, %ymm1
	vpmulld	%ymm2, %ymm0, %ymm2
	vpmulld	%ymm1, %ymm0, %ymm1
	vmovdqa	%xmm2, %xmm4
	vpmovzxdq	%xmm4, %ymm4
	vpaddq	%ymm4, %ymm7, %ymm4
	vextracti128	$0x1, %ymm2, %xmm2
	vpmovzxdq	%xmm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vmovdqa	%xmm1, %xmm3
	vpmovzxdq	%xmm3, %ymm3
	vpaddq	%ymm3, %ymm6, %ymm3
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxdq	%xmm1, %ymm1
	vpaddq	%ymm1, %ymm5, %ymm1
	vmovdqu	%ymm4, (%r15)
	addq	(%rbx), %r8
	vmovdqu	%ymm2, (%r8)
	addq	(%rbx), %rdi
	vmovdqu	%ymm3, (%rdi)
	addq	(%rbx), %rsi
	vmovdqu	%ymm1, (%rsi)
	movq	(%rbx), %rdx
	leaq	128(%rdx,%rax), %r15
	vmovdqu	(%r15), %ymm7
	leaq	160(%rax), %r8
	vmovdqu	160(%rdx,%rax), %ymm3
	leaq	192(%rax), %rdi
	vmovdqu	192(%rdx,%rax), %ymm6
	leaq	224(%rax), %rsi
	vmovdqu	224(%rdx,%rax), %ymm5
	movq	16(%rbx), %rdx
	vmovdqu	32(%rdx,%rcx), %ymm1
	vmovdqa	%xmm1, %xmm2
	vpmovzxwd	%xmm2, %ymm2
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxwd	%xmm1, %ymm1
	vpmulld	%ymm2, %ymm0, %ymm2
	vpmulld	%ymm1, %ymm0, %ymm1
	vmovdqa	%xmm2, %xmm4
	vpmovzxdq	%xmm4, %ymm4
	vpaddq	%ymm4, %ymm7, %ymm4
	vextracti128	$0x1, %ymm2, %xmm2
	vpmovzxdq	%xmm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vmovdqa	%xmm1, %xmm3
	vpmovzxdq	%xmm3, %ymm3
	vpaddq	%ymm3, %ymm6, %ymm3
	vextracti128	$0x1, %ymm1, %xmm1
	vpmovzxdq	%xmm1, %ymm1
	vpaddq	%ymm1, %ymm5, %ymm1
	vmovdqu	%ymm4, (%r15)
	addq	(%rbx), %r8
	vmovdqu	%ymm2, (%r8)
	addq	(%rbx), %rdi
	vmovdqu	%ymm3, (%rdi)
	addq	(%rbx), %rsi
	vmovdqu	%ymm1, (%rsi)
	addq	$256, %rax
	addq	$64, %rcx
	cmpq	%r9, %rax
	jne	.L43
	jmp	.L53
.L37:
	leal	1(%rax), %ecx
	movl	$0, %edi
	jmp	.L48
.L36:
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
.LFE1069:
	.size	openmp_simd_loopUnroll._omp_fn.2, .-openmp_simd_loopUnroll._omp_fn.2
	.type	openmp_simd_loopUnroll_registerBlock._omp_fn.3, @function
openmp_simd_loopUnroll_registerBlock._omp_fn.3:
.LFB1070:
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
	andq	$-32, %rsp
	subq	$48, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r12
	call	omp_get_num_threads
	movl	%eax, %ebx
	call	omp_get_thread_num
	movl	%eax, %esi
	movl	$1024, %eax
	cltd
	idivl	%ebx
	movl	%eax, %ecx
	movl	%edx, %edi
	cmpl	%edx, %esi
	jl	.L56
.L65:
	imull	%ecx, %esi
	leal	(%rsi,%rdi), %eax
	movl	%eax, 12(%rsp)
	addl	%eax, %ecx
	movl	%ecx, 4(%rsp)
	cmpl	%ecx, %eax
	jge	.L55
	sall	$10, %eax
	movl	%eax, 8(%rsp)
.L59:
	movl	8(%rsp), %eax
	movslq	%eax, %r9
	salq	$3, %r9
	movl	%eax, 20(%rsp)
	movq	$0, 24(%rsp)
	leaq	32(%r9), %r14
	leaq	64(%r9), %r13
	leaq	96(%r9), %rbx
	leaq	128(%r9), %r11
	leaq	160(%r9), %r10
	leaq	192(%r9), %rax
	movq	%rax, 40(%rsp)
	leaq	224(%r9), %rax
	movq	%rax, 32(%rsp)
	jmp	.L58
.L68:
	addl	$1, 12(%rsp)
	addl	$1024, 8(%rsp)
	movl	12(%rsp), %eax
	cmpl	%eax, 4(%rsp)
	jg	.L59
	jmp	.L55
.L58:
	movq	8(%r12), %rax
	movq	24(%rsp), %rdx
	movzwl	(%rax,%rdx), %edi
	movl	%edi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm6
	movzwl	2(%rax,%rdx), %esi
	movl	%esi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm5
	movzwl	4(%rax,%rdx), %edi
	movl	%edi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm4
	movzwl	6(%rax,%rdx), %esi
	movl	%esi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm3
	movzwl	8(%rax,%rdx), %edi
	movl	%edi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm2
	movzwl	10(%rax,%rdx), %esi
	movl	%esi, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm1
	movzwl	12(%rax,%rdx), %eax
	movl	%eax, 16(%rsp)
	vbroadcastss	16(%rsp), %ymm0
	movslq	20(%rsp), %rax
	addq	%rax, %rax
	movl	$0, %edx
	jmp	.L60
.L69:
	addq	$14, 24(%rsp)
	subl	$1024, 20(%rsp)
	cmpq	$98, 24(%rsp)
	jne	.L58
	jmp	.L68
.L60:
	leaq	(%rdx,%r9), %r15
	movq	(%r12), %rcx
	addq	%rcx, %r15
	vmovdqu	(%r15), %ymm13
	leaq	(%r14,%rdx), %r8
	vmovdqu	(%rcx,%r8), %ymm12
	leaq	0(%r13,%rdx), %rdi
	vmovdqu	(%rcx,%rdi), %ymm15
	leaq	(%rbx,%rdx), %rsi
	vmovdqu	(%rcx,%rsi), %ymm11
	movq	16(%r12), %rcx
	vmovdqu	(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm6, %ymm8
	vpmulld	%ymm7, %ymm6, %ymm7
	vmovdqa	%xmm8, %xmm14
	vpmovzxdq	%xmm14, %ymm14
	vpaddq	%ymm14, %ymm13, %ymm14
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm9
	vpmovzxdq	%xmm9, %ymm9
	vpaddq	%ymm9, %ymm15, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-2(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm5, %ymm8
	vpmulld	%ymm7, %ymm5, %ymm7
	vmovdqa	%xmm8, %xmm13
	vpmovzxdq	%xmm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm13
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-4(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm4, %ymm8
	vpmulld	%ymm7, %ymm4, %ymm7
	vmovdqa	%xmm8, %xmm10
	vpmovzxdq	%xmm10, %ymm10
	vpaddq	%ymm10, %ymm13, %ymm10
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-6(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm3, %ymm8
	vpmulld	%ymm7, %ymm3, %ymm7
	vmovdqa	%xmm8, %xmm15
	vpmovzxdq	%xmm15, %ymm15
	vpaddq	%ymm15, %ymm10, %ymm15
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-8(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm2, %ymm8
	vpmulld	%ymm7, %ymm2, %ymm7
	vmovdqa	%xmm8, %xmm14
	vpmovzxdq	%xmm14, %ymm14
	vpaddq	%ymm14, %ymm15, %ymm14
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-10(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm1, %ymm8
	vpmulld	%ymm7, %ymm1, %ymm7
	vmovdqa	%xmm8, %xmm13
	vpmovzxdq	%xmm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm13
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	-12(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm0, %ymm8
	vpmulld	%ymm7, %ymm0, %ymm7
	vmovdqa	%xmm8, %xmm10
	vpmovzxdq	%xmm10, %ymm10
	vpaddq	%ymm10, %ymm13, %ymm10
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm8
	vmovdqa	%xmm7, %xmm12
	vpmovzxdq	%xmm12, %ymm12
	vpaddq	%ymm12, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm7
	vmovdqu	%ymm10, (%r15)
	addq	(%r12), %r8
	vmovdqu	%ymm8, (%r8)
	addq	(%r12), %rdi
	vmovdqu	%ymm9, (%rdi)
	addq	(%r12), %rsi
	vmovdqu	%ymm7, (%rsi)
	leaq	(%r11,%rdx), %r15
	movq	(%r12), %rcx
	addq	%rcx, %r15
	vmovdqu	(%r15), %ymm13
	leaq	(%r10,%rdx), %r8
	vmovdqu	(%rcx,%r8), %ymm12
	movq	40(%rsp), %rdi
	addq	%rdx, %rdi
	vmovdqu	(%rcx,%rdi), %ymm15
	movq	32(%rsp), %rsi
	addq	%rdx, %rsi
	vmovdqu	(%rcx,%rsi), %ymm11
	movq	16(%r12), %rcx
	vmovdqu	32(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm6, %ymm8
	vpmulld	%ymm7, %ymm6, %ymm7
	vmovdqa	%xmm8, %xmm14
	vpmovzxdq	%xmm14, %ymm14
	vpaddq	%ymm14, %ymm13, %ymm14
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm9
	vpmovzxdq	%xmm9, %ymm9
	vpaddq	%ymm9, %ymm15, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	30(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm5, %ymm8
	vpmulld	%ymm7, %ymm5, %ymm7
	vmovdqa	%xmm8, %xmm13
	vpmovzxdq	%xmm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm13
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	28(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm4, %ymm8
	vpmulld	%ymm7, %ymm4, %ymm7
	vmovdqa	%xmm8, %xmm10
	vpmovzxdq	%xmm10, %ymm10
	vpaddq	%ymm10, %ymm13, %ymm10
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	26(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm3, %ymm8
	vpmulld	%ymm7, %ymm3, %ymm7
	vmovdqa	%xmm8, %xmm15
	vpmovzxdq	%xmm15, %ymm15
	vpaddq	%ymm15, %ymm10, %ymm15
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	24(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm2, %ymm8
	vpmulld	%ymm7, %ymm2, %ymm7
	vmovdqa	%xmm8, %xmm14
	vpmovzxdq	%xmm14, %ymm14
	vpaddq	%ymm14, %ymm15, %ymm14
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	22(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm1, %ymm8
	vpmulld	%ymm7, %ymm1, %ymm7
	vmovdqa	%xmm8, %xmm13
	vpmovzxdq	%xmm13, %ymm13
	vpaddq	%ymm13, %ymm14, %ymm13
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm12
	vmovdqa	%xmm7, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm11
	vmovdqu	20(%rcx,%rax), %ymm7
	vmovdqa	%xmm7, %xmm8
	vpmovzxwd	%xmm8, %ymm8
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxwd	%xmm7, %ymm7
	vpmulld	%ymm8, %ymm0, %ymm8
	vpmulld	%ymm7, %ymm0, %ymm7
	vmovdqa	%xmm8, %xmm10
	vpmovzxdq	%xmm10, %ymm10
	vpaddq	%ymm10, %ymm13, %ymm10
	vextracti128	$0x1, %ymm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpaddq	%ymm8, %ymm12, %ymm8
	vmovdqa	%xmm7, %xmm12
	vpmovzxdq	%xmm12, %ymm12
	vpaddq	%ymm12, %ymm9, %ymm9
	vextracti128	$0x1, %ymm7, %xmm7
	vpmovzxdq	%xmm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm7
	vmovdqu	%ymm10, (%r15)
	addq	(%r12), %r8
	vmovdqu	%ymm8, (%r8)
	addq	(%r12), %rdi
	vmovdqu	%ymm9, (%rdi)
	addq	(%r12), %rsi
	vmovdqu	%ymm7, (%rsi)
	addq	$256, %rdx
	addq	$64, %rax
	cmpq	$8192, %rdx
	jne	.L60
	jmp	.L69
.L56:
	leal	1(%rax), %ecx
	movl	$0, %edi
	jmp	.L65
.L55:
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
.LFE1070:
	.size	openmp_simd_loopUnroll_registerBlock._omp_fn.3, .-openmp_simd_loopUnroll_registerBlock._omp_fn.3
	.globl	naive
	.type	naive, @function
naive:
.LFB1058:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movl	$0, %r15d
	jmp	.L72
.L77:
	leal	(%r9,%r10), %eax
	cltq
	movzwl	(%r12,%rax,2), %r8d
	movl	%r14d, %esi
	subl	%r9d, %esi
	movl	%r11d, %eax
	subl	%r9d, %eax
	leal	0(%r13,%r9), %edx
.L74:
	leal	(%rax,%rdx), %ecx
	movslq	%ecx, %rcx
	movslq	%eax, %rdi
	movzwl	0(%rbp,%rdi,2), %edi
	imulq	%r8, %rdi
	addq	%rdi, (%rbx,%rcx,8)
	addl	$1, %eax
	cmpl	%esi, %eax
	jne	.L74
	addl	$1, %r9d
	cmpl	$7, %r9d
	jne	.L77
	addl	$1024, %r13d
	addl	$7, %r10d
	subl	$1024, %r11d
	cmpl	$49, %r10d
	je	.L76
.L79:
	movl	$0, %r9d
	leal	1024(%r11), %r14d
	jmp	.L77
.L76:
	addl	$1024, %r15d
	cmpl	$1048576, %r15d
	je	.L71
.L72:
	movl	%r15d, %r11d
	movl	$0, %r10d
	movl	$0, %r13d
	jmp	.L79
.L71:
	addq	$8, %rsp
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
.LFE1058:
	.size	naive, .-naive
	.globl	openmp
	.type	openmp, @function
openmp:
.LFB1059:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%rbx, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movl	$0, %edx
	movq	%rsp, %rsi
	movl	$openmp._omp_fn.0, %edi
	call	GOMP_parallel_start
	movq	%rsp, %rdi
	call	openmp._omp_fn.0
	call	GOMP_parallel_end
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1059:
	.size	openmp, .-openmp
	.globl	simd
	.type	simd, @function
simd:
.LFB1060:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$16, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %r13
	movq	%rsi, %rbx
	movq	%rdx, %r12
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%r13, %rdi
	movl	$0, %r9d
	leaq	2048(%r12), %r13
	addq	$2034, %r12
	jmp	.L84
.L89:
	movslq	%r8d, %rax
	movzwl	(%rbx,%rax,2), %eax
	movl	%eax, 12(%rsp)
	vbroadcastss	12(%rsp), %ymm2
	leaq	-2048(%rcx), %rdx
	movq	%rdi, %rax
.L86:
	vmovdqu	(%rax), %ymm1
	vmovdqu	(%rdx), %ymm0
	vpmovzxwd	%xmm0, %ymm0
	vpmulld	%ymm0, %ymm2, %ymm0
	vpmovzxdq	%xmm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rax)
	addq	$32, %rax
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.L86
	addl	$1, %r8d
	subq	$2, %rcx
	cmpq	%rsi, %rcx
	jne	.L89
	subl	$1024, %r11d
	addl	$7, %r10d
	cmpl	$49, %r10d
	je	.L88
.L91:
	movslq	%r11d, %rsi
	addq	%rsi, %rsi
	leaq	0(%r13,%rsi), %rcx
	addq	%r12, %rsi
	movl	%r10d, %r8d
	jmp	.L89
.L88:
	addq	$8192, %rdi
	addl	$1024, %r9d
	cmpl	$1048576, %r9d
	je	.L83
.L84:
	movl	%r9d, %r11d
	movl	$0, %r10d
	jmp	.L91
.L83:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1060:
	.size	simd, .-simd
	.globl	cacheBlock
	.type	cacheBlock, @function
cacheBlock:
.LFB1061:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movl	$0, %r11d
	jmp	.L94
.L99:
	leal	0(%r13,%r10), %eax
	cltq
	movzwl	(%r12,%rax,2), %esi
	cmpl	%r11d, %edx
	jle	.L95
	movl	%r11d, %eax
	movl	%r14d, %r8d
	subl	%r10d, %r8d
.L96:
	leal	(%rax,%r9), %ecx
	movslq	%ecx, %rcx
	leal	(%r8,%rax), %edi
	movslq	%edi, %rdi
	movzwl	0(%rbp,%rdi,2), %edi
	imulq	%rsi, %rdi
	addq	%rdi, (%rbx,%rcx,8)
	addl	$1, %eax
	cmpl	%edx, %eax
	jl	.L96
.L95:
	addq	$1, %r10
	cmpq	$7, %r10
	jne	.L99
	addl	$7, %r13d
	subl	$1024, %r14d
	cmpl	$49, %r13d
	je	.L98
.L101:
	movl	$0, %r10d
	jmp	.L99
.L98:
	addl	$1024, %r9d
	cmpl	$1048576, %r9d
	je	.L100
.L103:
	movl	%r9d, %r14d
	movl	$0, %r13d
	jmp	.L101
.L100:
	addl	$512, %r11d
	cmpl	$1024, %r11d
	je	.L93
.L94:
	movl	$0, %r9d
	leal	512(%r11), %edx
	jmp	.L103
.L93:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1061:
	.size	cacheBlock, .-cacheBlock
	.globl	loopUnroll
	.type	loopUnroll, @function
loopUnroll:
.LFB1062:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%r12, %rdi
	movl	$0, %r13d
.L113:
	movl	%r13d, %r12d
	movl	$0, %r11d
	jmp	.L106
.L111:
	leal	(%rsi,%r11), %eax
	cltq
	movzwl	(%rbx,%rax,2), %r8d
	movq	%r10, %rcx
	movq	%rdi, %rax
	movl	$0, %r9d
.L108:
	movzwl	(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, (%rax)
	movzwl	2(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 8(%rax)
	movzwl	4(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 16(%rax)
	movzwl	6(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 24(%rax)
	movzwl	8(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 32(%rax)
	movzwl	10(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 40(%rax)
	movzwl	12(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 48(%rax)
	movzwl	14(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 56(%rax)
	movzwl	16(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 64(%rax)
	movzwl	18(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 72(%rax)
	movzwl	20(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 80(%rax)
	movzwl	22(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 88(%rax)
	movzwl	24(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 96(%rax)
	movzwl	26(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 104(%rax)
	movzwl	28(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 112(%rax)
	movzwl	30(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 120(%rax)
	movzwl	32(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 128(%rax)
	movzwl	34(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 136(%rax)
	movzwl	36(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 144(%rax)
	movzwl	38(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 152(%rax)
	movzwl	40(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 160(%rax)
	movzwl	42(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 168(%rax)
	movzwl	44(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 176(%rax)
	movzwl	46(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 184(%rax)
	movzwl	48(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 192(%rax)
	movzwl	50(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 200(%rax)
	movzwl	52(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 208(%rax)
	movzwl	54(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 216(%rax)
	movzwl	56(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 224(%rax)
	movzwl	58(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 232(%rax)
	movzwl	60(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 240(%rax)
	movzwl	62(%rcx), %edx
	imulq	%r8, %rdx
	addq	%rdx, 248(%rax)
	addl	$32, %r9d
	addq	$256, %rax
	addq	$64, %rcx
	cmpl	$1024, %r9d
	jne	.L108
	addl	$1, %esi
	subq	$2, %r10
	cmpl	$7, %esi
	jne	.L111
	subl	$1024, %r12d
	addl	$7, %r11d
	cmpl	$49, %r11d
	je	.L110
.L106:
	movslq	%r12d, %rax
	leaq	0(%rbp,%rax,2), %r10
	movl	$0, %esi
	jmp	.L111
.L110:
	addq	$8192, %rdi
	addl	$1024, %r13d
	cmpl	$1048576, %r13d
	jne	.L113
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1062:
	.size	loopUnroll, .-loopUnroll
	.globl	registerBlock
	.type	registerBlock, @function
registerBlock:
.LFB1063:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%rdi, %rbx
	movq	%rsi, 104(%rsp)
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movl	$0, 76(%rsp)
	movq	%rbx, 96(%rsp)
	movq	%rbp, %r11
	jmp	.L116
.L121:
	movq	88(%rsp), %rax
	movzwl	(%rax), %edx
	movq	%rdx, (%rsp)
	movzwl	2(%rax), %edx
	movq	%rdx, 56(%rsp)
	movzwl	4(%rax), %edx
	movq	%rdx, 8(%rsp)
	movzwl	6(%rax), %edx
	movq	%rdx, 32(%rsp)
	movzwl	8(%rax), %edx
	movq	%rdx, 16(%rsp)
	movzwl	10(%rax), %edx
	movq	%rdx, 24(%rsp)
	movzwl	12(%rax), %eax
	movq	%rax, 40(%rsp)
	movl	$0, %edx
	movl	84(%rsp), %eax
	addl	76(%rsp), %eax
	movl	%eax, 80(%rsp)
	movq	96(%rsp), %r10
.L118:
	movl	80(%rsp), %eax
	leal	(%rdx,%rax), %ebx
	movslq	%ebx, %rbx
	leaq	(%rbx,%rbx), %rax
	movzwl	-10(%r11,%rax), %r12d
	movzwl	-8(%r11,%rax), %ebp
	movzwl	-6(%r11,%rax), %ecx
	movzwl	-4(%r11,%rax), %edi
	movzwl	-2(%r11,%rax), %esi
	movzwl	(%r11,%rbx,2), %r8d
	addq	$1, %rbx
	leaq	(%rbx,%rbx), %r9
	movzwl	(%r11,%rbx,2), %ebx
	movzwl	2(%r11,%r9), %r15d
	movq	%r15, 48(%rsp)
	movzwl	4(%r11,%r9), %r9d
	movq	%r9, 64(%rsp)
	movl	76(%rsp), %r14d
	leal	(%rdx,%r14), %r9d
	movslq	%r9d, %r9
	salq	$3, %r9
	leaq	(%r10,%r9), %r13
	movq	(%rsp), %r15
	imulq	%r8, %r15
	addq	0(%r13), %r15
	movq	56(%rsp), %r14
	imulq	%rsi, %r14
	addq	%r14, %r15
	movq	32(%rsp), %r14
	imulq	%rcx, %r14
	addq	%r14, %r15
	movq	8(%rsp), %r14
	imulq	%rdi, %r14
	addq	%r14, %r15
	movq	24(%rsp), %r14
	imulq	%r12, %r14
	addq	%r14, %r15
	movq	16(%rsp), %r14
	imulq	%rbp, %r14
	addq	%r15, %r14
	movzwl	-12(%r11,%rax), %r15d
	imulq	40(%rsp), %r15
	addq	%r15, %r14
	movq	%r14, 0(%r13)
	leaq	8(%r10,%r9), %rax
	movq	56(%rsp), %r15
	movq	%r15, %r14
	imulq	%r8, %r14
	addq	(%rax), %r14
	movq	(%rsp), %r13
	imulq	%rbx, %r13
	addq	%r13, %r14
	movq	32(%rsp), %r13
	imulq	%rdi, %r13
	addq	%r13, %r14
	movq	8(%rsp), %r13
	imulq	%rsi, %r13
	addq	%r13, %r14
	movq	24(%rsp), %r13
	imulq	%rbp, %r13
	addq	%r13, %r14
	movq	16(%rsp), %r13
	imulq	%rcx, %r13
	addq	%r14, %r13
	imulq	40(%rsp), %r12
	addq	%r12, %r13
	movq	%r13, (%rax)
	leaq	16(%r10,%r9), %rax
	movq	8(%rsp), %r12
	imulq	%r8, %r12
	movq	%r12, %r13
	addq	(%rax), %r13
	movq	48(%rsp), %r12
	imulq	(%rsp), %r12
	addq	%r12, %r13
	movq	%r15, %r14
	movq	%r15, %r12
	imulq	%rbx, %r12
	addq	%r12, %r13
	movq	32(%rsp), %r15
	movq	%r15, %r12
	imulq	%rsi, %r12
	addq	%r12, %r13
	movq	24(%rsp), %r12
	imulq	%rcx, %r12
	addq	%r12, %r13
	movq	16(%rsp), %r12
	imulq	%rdi, %r12
	addq	%r13, %r12
	movq	40(%rsp), %r13
	imulq	%r13, %rbp
	addq	%rbp, %r12
	movq	%r12, (%rax)
	leaq	24(%r10,%r9), %rax
	imulq	%r15, %r8
	addq	(%rax), %r8
	movq	64(%rsp), %r9
	imulq	(%rsp), %r9
	addq	%r9, %r8
	movq	48(%rsp), %r9
	imulq	%r14, %r9
	addq	%r9, %r8
	imulq	8(%rsp), %rbx
	addq	%rbx, %r8
	imulq	24(%rsp), %rdi
	addq	%rdi, %r8
	imulq	16(%rsp), %rsi
	addq	%rsi, %r8
	imulq	%r13, %rcx
	addq	%rcx, %r8
	movq	%r8, (%rax)
	addl	$4, %edx
	cmpl	$1024, %edx
	jne	.L118
	addq	$14, 88(%rsp)
	subl	$1024, 84(%rsp)
	cmpl	$-7168, 84(%rsp)
	jne	.L121
	addl	$1024, 76(%rsp)
	cmpl	$1048576, 76(%rsp)
	je	.L115
.L116:
	movq	104(%rsp), %rax
	movq	%rax, 88(%rsp)
	movl	$0, 84(%rsp)
	jmp	.L121
.L115:
	addq	$120, %rsp
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
.LFE1063:
	.size	registerBlock, .-registerBlock
	.globl	openmp_simd
	.type	openmp_simd, @function
openmp_simd:
.LFB1064:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%rbx, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movl	$0, %edx
	movq	%rsp, %rsi
	movl	$openmp_simd._omp_fn.1, %edi
	call	GOMP_parallel_start
	movq	%rsp, %rdi
	call	openmp_simd._omp_fn.1
	call	GOMP_parallel_end
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1064:
	.size	openmp_simd, .-openmp_simd
	.globl	openmp_simd_loopUnroll
	.type	openmp_simd_loopUnroll, @function
openmp_simd_loopUnroll:
.LFB1065:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%rbx, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movl	$0, %edx
	movq	%rsp, %rsi
	movl	$openmp_simd_loopUnroll._omp_fn.2, %edi
	call	GOMP_parallel_start
	movq	%rsp, %rdi
	call	openmp_simd_loopUnroll._omp_fn.2
	call	GOMP_parallel_end
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1065:
	.size	openmp_simd_loopUnroll, .-openmp_simd_loopUnroll
	.globl	openmp_simd_loopUnroll_registerBlock
	.type	openmp_simd_loopUnroll_registerBlock, @function
openmp_simd_loopUnroll_registerBlock:
.LFB1066:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	movl	$8388608, %edx
	movl	$0, %esi
	call	memset
	movq	%rbx, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movl	$0, %edx
	movq	%rsp, %rsi
	movl	$openmp_simd_loopUnroll_registerBlock._omp_fn.3, %edi
	call	GOMP_parallel_start
	movq	%rsp, %rdi
	call	openmp_simd_loopUnroll_registerBlock._omp_fn.3
	call	GOMP_parallel_end
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1066:
	.size	openmp_simd_loopUnroll_registerBlock, .-openmp_simd_loopUnroll_registerBlock
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
