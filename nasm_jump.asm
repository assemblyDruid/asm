        ;;
        ;; Assembler: nasm 2.13.02
        ;; 

        global _start

        section .text
_start:
        mov eax, 1
        mov ebx, 13
        jmp _exit
        mov ebx, 7              ; should not execute
_exit:
        int 0x80
