	.file	"example04.heroc"
	.global	main
	.text
swap:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$16, %rsp

	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	xorq	%r10, %r11
	pushq	%r11

	popq	%rax
	movq	%rax, %r12
	movq	-8(%rbp), %rax
	movq	%r12, (%rax)

	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	xorq	%r10, %r11
	pushq	%r11

	popq	%rax
	movq	%rax, %r12
	movq	-16(%rbp), %rax
	movq	%r12, (%rax)

	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	xorq	%r10, %r11
	pushq	%r11

	popq	%rax
	movq	%rax, %r12
	movq	-8(%rbp), %rax
	movq	%r12, (%rax)
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movq	$666, %rax
	movq	%rax, %r12
	movq	%r12, -8(%rbp)
	movq	$999, %rax
	movq	%rax, %r12
	movq	%r12, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %r12
	movq	%r12, -24(%rbp)
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	call	swap
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	leave	
	ret	
	.ident	"HEROCOMP - Tomas Mikula 2017"

