        ;;
        ;; nasm 2.14.02
        ;;

        global _start
_start:
        mov eax, 1
        mov ebx, 42
        int 0x80
