arg1="$1"
gcc src/$arg1.c -S -O0 -o att_assembler/$arg1.s -masm=att
