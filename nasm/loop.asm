        ;;
        ;; Assembler: nasm 2.13.02
        ;;

        global _start

        section .text
_start:
        mov ebx, 1
        mov ecx, 6              ; number of iterations
calc:   
        dec ecx                 ; dec = "decrement"; faster than "sub"
        add ebx, ebx            ; double ebx
        cmp ecx, 0
        jg calc
        mov eax, 1              ; prep for sys_exit
        int 0x80
        
        
