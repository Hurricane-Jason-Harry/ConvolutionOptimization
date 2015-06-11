	.file	"utils.c"
	.text
	.globl	compare_matrix
	.type	compare_matrix, @function
compare_matrix:
.LFB1045:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	jne	.L4
	movl	$0, %eax
.L3:
	movq	8(%rsi,%rax), %rdx
	cmpq	%rdx, 8(%rdi,%rax)
	jne	.L5
	addq	$8, %rax
	cmpq	$8388600, %rax
	jne	.L3
	jmp	.L6
.L4:
	movl	$1, %eax
	ret
.L5:
	movl	$1, %eax
	.p2align 4,,2
	ret
.L6:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1045:
	.size	compare_matrix, .-compare_matrix
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
