        ;;
        ;; MASM 6.14.8444
        ;;

        .386
        .model flat, stdcall
        option casemap: none

        include \masm32\include\kernel32.inc ; exit process
        include \masm32\include\masm32.inc   ; std out

        includelib \masm32\lib\kernel32.lib
        includelib \masm32\lib\masm32.lib

        .data
        message db "Hello world!", 0

        .code
main:
        invoke StdOut, addr message
        invoke ExitProcess, 0
        end main
