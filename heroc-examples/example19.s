	.file	"example19.heroc"
	.global	main
	.text
fib:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp

	movq	$1, %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	cmpq	%r10, %r11
	movq	$0, %rax
	movq	$1, %r12
	cmovleq	%r12, %rax
	pushq	%rax

	popq	%rax
	cmpq	$0, %rax
	je	IF4_ELSE
	movq	-8(%rbp), %rax
	leave	
	ret	
	jmp	IF4_END
IF4_ELSE:

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9

	movq	$2, %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	subq	%r10, %r11
	pushq	%r11

	popq	%rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rax


	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9

	movq	$1, %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	subq	%r10, %r11
	pushq	%r11

	popq	%rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	pushq	%rax


	popq	%r11
	popq	%r10
	addq	%r10, %r11
	pushq	%r11

	popq	%rax
	leave	
	ret	
IF4_END:
	leave	
	ret	
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	$0, %rax
	movq	%rax, %r12
	movq	%r12, -8(%rbp)
LOOP45:

	movq	$15, %rax
	pushq	%rax


	movq	-8(%rbp), %rax
	pushq	%rax


	popq	%r11
	popq	%r10
	cmpq	%r10, %r11
	movq	$0, %rax
	movq	$1, %r12
	cmovlq	%r12, %rax
	pushq	%rax

	popq	%rax
	cmpq	$0, %rax
	je	LOOP45_END
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fib
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
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
LOOP45_NEXT:
	movq	-8(%rbp), %rax
	pushq	%rax
	incq	%rax
	movq	%rax, -8(%rbp)
	popq	%rax
	jmp	LOOP45
LOOP45_END:
	leave	
	ret	
	.ident	"HEROCOMP - Tomas Mikula 2017"

