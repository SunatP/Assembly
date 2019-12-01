	.file	"main.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii " %d\0"
LC1:
	.ascii "%d\0"
	.section	.text.unlikely,"x"
LCOLDB2:
	.section	.text.startup,"x"
LHOTB2:
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	leal	20(%esp), %eax
	movl	$LC0, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	leal	24(%esp), %eax
	movl	$LC0, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	leal	28(%esp), %eax
	movl	$LC0, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	20(%esp), %eax
	movl	24(%esp), %edx
	cmpl	%edx, %eax
	jle	L2
	movl	28(%esp), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
L3:
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	xorl	%eax, %eax
	leave
	ret
L2:
	movl	28(%esp), %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	jmp	L3
	.section	.text.unlikely,"x"
LCOLDE2:
	.section	.text.startup,"x"
LHOTE2:
	.ident	"GCC: (tdm-1) 5.1.0"
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
