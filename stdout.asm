        global _start
        
        section .data
        addr db "yellow"        ; varaible "addr" of type db holding the memory "yellow"
        
        section .text
_start: 
        mov eax, 4
        mov [addr], byte 'H'    ; Dereference `addr` at the first byte (zero indexed), and write "H"
        mov [addr+5], byte '!'  ; Dereference `addr` at the fifth byte (zero indexed), and write "!"
        mov ebx, 1              ; std out file desc
        mov ecx, addr           ; bytes to be writen
        mov edx, 6              ; number of bytes to write
        int 0x80                ; call system
        mov eax ,1              ; sys_exit code for system call
        mov ebx, 0              ; exit status 0
        int 0x80                ; call system
