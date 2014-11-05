nasm -f aout -o start.o boot_loader.asm

ld -T link.ld -0 kernel.bin start.o


