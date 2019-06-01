        global _start

_start:
        section .text

        mov rsi, msg            ; msg to print
        mov rdx, msglen         ; len of msg
        call write_to_stdout

        mov rsi, msgbuff
        mov rdx, msgbufflen
        call read_from_stdin

        jmp exit_program

        ;;
        ;;  Fn exit_program
        ;;
exit_program:
        mov rax, 60             ; exit
        mov rdi, 0              ; with 0
        syscall


        ;;
        ;;  Fn write_to_stdout
        ;;
        ;; set rsi with message string
        ;; set rdx with message length
write_to_stdout:
        mov rax, 1              ; write flag
        mov rdi, 1              ; stdout file descriptor
        syscall
        ret

        ;;
        ;; Fn get_fron_stdin
        ;;
        ;; set rsi with message buffer
        ;; set rdx with message buffer length
read_from_stdin:
        xor rax, rax            ; read flag
        xor rdi, rdi            ; stdin file descriptor
        syscall

        ;; print <num> returned from read syscall
        mov rsi, rax
        mov rdx, 2
        call write_to_stdout

        ;; print "bytes read.\n"
        mov rsi, readBytesStr
        mov rdx, readBytesStrLen
        call write_to_stdout

        ret



        section .rodata
msg:                    db "Calculate your heart's desire: "
msglen:                 equ $ - msg
msgbuff:                times 100 db 0
msgbufflen:             equ $ -msgbuff
readBytesStr:           db "bytes read.", 10
readBytesStrLen:        equ $ -readBytesStr
