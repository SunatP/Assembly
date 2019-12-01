# วิธีแปลง C เป็น Assembly (.S หรือ .asm)

## ต้องมีอะไรบ้าง 

1.  CodeBlocks หรือ MinGW ก็ได้ (ปกติลง CodeBlocks จะมี MinGW มาให้ละ)
2.  โค้ดที่เขียนเป็น .C หรือ .C++ หรือ .CPP (อันนี้จะแนะนำแค่ .C เท่านั้น)
3.  ตั้งค่า Path Environment ด้วยไม่งั้นมันจะไม่คอมไพล์ไฟล์ให้ 
```bash
C:\Program Files (x86)\CodeBlocks\MinGW\bin # ตั้ง Path นี้ไว้พอละ หรือไปลงไว้ที่ไหนที่หน้าตามันมี CodeBlocks\MinGW\bin ก็ไปก๊อปให้ถูกด้วย
```
4.  PowerShell หรือ Command Prompt หรือ Terminal อะไรก็ว่าไปใช้ได้หมดแหละ 
    1.  คราวนี้พอมีพวก Terminal อะไรแบบนี้แล้วก็ cd (Change Directory) ไปที่ ตำแหน่งที่ set Path แบบนี้

```bash
PS C:\cd C:\Program Files (x86)\CodeBlocks\MinGW\bin # ประมาณนี้
```
5.  ก๊อปไฟล์ภาษา C ไปวางไว้ในแฟ้มที่ตั้ง environment ไว้ จากนั้นกลับมาที่ terminal เพื่อทำการคอมไพล์จาก C เป็น assembly (.asm)

## เรื่มการแปลงไฟล์ C -> ASM

ขั้นตอนคือ เปิด cmd (Command Prompt) หรือ PowerShell ก็ได้ แล้วทำตามนี้

ถ้าใช้ PowerShell ก็ประมาณนี้

```bash
PS C:\cd C:\Program Files (x86)\CodeBlocks\MinGW\bin 
```

หรือ Command Prompt 

```bash
C:\cd C:\Program Files (x86)\CodeBlocks\MinGW\bin
```
จากนั้นพิมพ์ต่อมาตามนี้

```bash
gcc -S ชื่อไฟล์ที่เขียน.c -o ชื่อไฟล์ที่อยากได้.asm -masm=intel
```
ซึ่ง gcc จะทำการคอมไพล์ไฟล์ภาษา C ออกมาเป็น .asm ในรูปแปบ syntax masm (Microsoft Macro Assembler) intel x86 หรือ 32 bit ไฟล์ที่ได้ออกมาจะเป็น .asm ในแฟ้มแล้วเรียบร้อยถ้าไม่มีอะไรผิดพลาด


## แปลง C -> assembly (.S)

ก็ทำแบบเดิมแต่เปลี่ยนเป็น

```bash
gcc -O2 -S main.c 
```
ไฟล์จะออกมาเป็น .S ซึ่งโค้ดจะหน้าตาน่าเกลียดกว่าหน่อย


### เทียบ .asm กับ .S

เทียบเลย .asm อ่านง่ายกว่าเยอะ
อันแรกคือ **.asm**
```bash
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
```

อันนี้คือ **.S**

```bash
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
```