#include "system.h"
/*library routines .. 
*/
/* You will need to code these up yourself!  */
unsigned char *memcpy(unsigned char *dest, const unsigned char *src, int count)
{
   return 0;
}

unsigned char *memset(unsigned char *dest, unsigned char val, int count)
{
   return 0; 
}

unsigned short *memsetw(unsigned short *dest, unsigned short val, int count)
{
   return 0;
}

int strlen(const char *str)
{
    return 0;
}


unsigned char inportb (unsigned short _port)
{
    unsigned char rv;
    __asm__ __volatile__ ("inb %1, %0" : "=a" (rv) : "dN" (_port));
    return rv;
}

void outportb(unsigned short _port,unsigned char _data)
{
         __asm__ __volatile__ ("outb %1, %0" : : "dN" (_port), "a" (_data));
}
int  main()
{
    for(;;);
    return 0;
}