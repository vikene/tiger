OUTPUT_FORMAT("binary")
ENTRY("start")
phys = 0x00100000;
SECTIONS
{
    .text phys: AT(phys){
        code=.;
        *(.text)
        .=align(4096);
        
    }
    .data: AT(phys +(data-code)){
    
        data=.;
        *(.data)
        .=align(4096);
    }
    
    .bss: AT(phys + (bss-code)){
        bss=.;
        *(.bss)
        .= align(4096);
    }
    
    end=.;

}