        ;;
        ;; Assembler: nasm 2.13.02
        ;; 
        
        global _start

        section .text
_start:
        mov ecx, 101
        mov ebx, 42             ; exit stats: 42
        mov eax, 1              ; sys_exit system call
        cmp ecx, 100
        jg skip
        mov ebx, 13             ; should not execute

skip:
        int 0x80
        
        ;; 
        ;; (Most) Kinds of Jumps:
        ;; 
        ;; jl:  jump if less
        ;; jg:  jump if greater
        ;; jge: jump if greater or equal
        ;; jle: jump if greater or less
        ;; jne: jump if not equal
        ;; je:  jump if equal
