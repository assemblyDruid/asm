        ;;
        ;; Assembler: nasm
        ;; 

        global _start

_start:
        sub esp, 4              ; subtracted 4 from esp, effectively allocating 4 bytes
        mov [esp], byte 'H'
        mov [esp+1], byte 'e'
        mov [esp+2], byte 'y'
        mov [esp+3], byte '!'
        mov eax, 4              ; sys_write system call
        mov ebx, 1              ; stdout file descriptor
        mov ecx, esp            ; pointer to bytes to be written
        mov edx, 4              ; num bytes to write
        int 0x80                ; perform system call
        mov eax, 1              ; system_exit flag
        mov ebx, 0              ; exit code = 0
        int 0x08                ; call system
