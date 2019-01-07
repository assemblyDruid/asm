        ;;
        ;; Compiled w/ `gcc -S -o simple.s simple.c`
        ;;
        ;; Note that this is not Intel syntax, but AT&T/GAS syntax.
        ;; A few key differences:
        ;;      "$" signifies a constant (an immediate value).
        ;;      "%" denotes a register
        ;;      The source/destination order is reversed
        ;;      "()" is used to dereference memory
        ;;

        .file	"simple.c"      ;
	.text
	.globl	function
	.type	function, @function
function:
.LFB0:                          ; "L" = "local", FB0 = "Function Begin 0'
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax      ; efficient way to assign 0 to eax
	nop
	movq	-8(%rbp), %rax  ; Dereference value at register rbp, then subtract 8
	xorq	%fs:40, %rax    ; "%fs:40" is "segment:offset" notation
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:                          ; "L" = "local", "FE0" = "Function End 0"
	.size	function, .-function
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	function
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
