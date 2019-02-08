        ;; New instruction, `call`
        ;;   1) Pushes EIP to the stack
        ;;   2) Performas a jump to the argument supplied

        global _start

_start:
        call func
        mov eax, 1              ; sys_exit flag
        int 0x80                ; system call

func:
        mov ebx, 42             ; set exit code
        pop eax                 ; store location of instruction following the `call` op
        jmp eax
