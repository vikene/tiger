nasm -f aout -o start.o boot_code.asm

gcc -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o main.o main.c

ld -T link.ld -o kernel.bin start.o main.o


