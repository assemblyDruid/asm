	.file	"buffer_overflow.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rdx, QWORD PTR -40[rbp]
	lea	rax, -32[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcpy@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	function, .-function
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 304
	mov	DWORD PTR -292[rbp], edi
	mov	QWORD PTR -304[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -276[rbp], 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -276[rbp]
	cdqe
	mov	BYTE PTR -272[rbp+rax], 65
	add	DWORD PTR -276[rbp], 1
.L4:
	cmp	DWORD PTR -276[rbp], 254
	jle	.L5
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	function
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
