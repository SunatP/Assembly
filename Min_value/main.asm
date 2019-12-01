	.file	"main.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii " %d\0"
LC1:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	sub	esp, 48
	call	___main
	mov	DWORD PTR [esp+40], 0
	jmp	L2
L3:
	lea	eax, [esp+28]
	mov	edx, DWORD PTR [esp+40]
	sal	edx, 2
	add	eax, edx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_scanf
	add	DWORD PTR [esp+40], 1
L2:
	cmp	DWORD PTR [esp+40], 2
	jle	L3
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp+44], eax
	mov	eax, DWORD PTR [esp+32]
	cmp	eax, DWORD PTR [esp+44]
	jge	L4
	mov	eax, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+44], eax
	mov	eax, DWORD PTR [esp+36]
	cmp	eax, DWORD PTR [esp+44]
	jge	L6
	mov	eax, DWORD PTR [esp+36]
	mov	DWORD PTR [esp+44], eax
	jmp	L6
L4:
	mov	eax, DWORD PTR [esp+36]
	cmp	eax, DWORD PTR [esp+44]
	jge	L6
	mov	eax, DWORD PTR [esp+36]
	mov	DWORD PTR [esp+44], eax
L6:
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	mov	eax, 0
	leave
	ret
	.ident	"GCC: (tdm-1) 5.1.0"
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
