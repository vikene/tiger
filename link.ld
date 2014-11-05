/*OUTPUT_ARCH ( "i386" )

OUTPUT_FORMAT("binary")*/

OUTPUT_FORMAT(elf32-i386)

ENTRY(start)

phys = 0x00100000;

SECTIONS

{

   /*Set the virtual address:*/
   
      . = phys;
      
         /*
         
            * http://wiki.osdev.org/Grub_Error_13
            
               */
               
               
               
                  /* .__mbHeader will begin @ 'phys' */
                  
                  .__mbHeader : AT ( ADDR( .__mbHeader ) ) {
                     
                           /* mboot = .;*/
                           
                           *(.__mbHeader)
                                 
                                 }
                                    
                                    
                                    
                                    .text ALIGN(4096) : AT(ADDR(.text)) {
                                       
                                             code = .;
                                             
                                             *(.text)
                                                   
                                                   *(.rodata)
                                                         
                                                         }
                                                            
                                                            .data ALIGN(4096) : AT(ADDR(.data)) /*Voila*/
                                                               
                                                               {
                                                                  
                                                                        data = .;
                                                                        
                                                                        *(.data)
                                                                              
                                                                              }
                                                                                 
                                                                                 .bss ALIGN(4096) : AT ( ADDR (.bss) )
                                                                                    
                                                                                    {
                                                                                       
                                                                                             bss = .;
                                                                                             
                                                                                             *(.bss)
                                                                                                   
                                                                                                   }
                                                                                                      
                                                                                                         end = .;
                                                                                                         
                                                                                                         }
