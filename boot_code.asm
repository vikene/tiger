[BITS 32]
global start
start:
    mov esp, _sys_stack ; starting my stack area 
    jmp stublet

;MultiBoot header XOXO
ALIGN 4
mboot:
    MULTIBOOT_PAGE_ALIGN equ 1<<0
    MULTIBOOT_MEMORY_INFO equ 1<<1
    MULTIBOOT_AOUT_KLUDGE equ 1<<16
    MULTIBOOT_HEADER_MAGIC equ 0x1BADB002
    MULTIBOOT_HEADER_FLAGS equ MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO | MULTIBOOT_AOUT_KLUDGE
    MULTIBOOT_CHECKSUM  equ - (MULTIBOOT_HEADER_MAGIC+MULTIBOOT_HEADER_FLAGS)
    EXTERN code, bss,end
    
    ; Grub multiboot header 
    dd MULTIBOOT_HEADER_MAGIC
    dd MULTIBOOT_HEADER_FLAGS
    dd MULTIBOOT_CHECKSUM 
    
    ;AOUT KLUDGE 
        
    dd mboot
    dd code
    dd bss
    dd end
    dd start
    
; endless loop
    stublet:
        extern main
        call main
        jmp $

;GDT init 

global gdt_flush
extern gp

gdt_flush:
    lgdt [gp]
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp 0x08: flush2

flush2:
    ret

;  ISR -todo

;BSS section np data area .. static init later 

SECTION .bss
    resb 8192
_sys_stack:
