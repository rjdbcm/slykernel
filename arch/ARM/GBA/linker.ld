/****************************************************************************/
/* gba.x                                                                    */
/****************************************************************************/
/*
	Linker script for GBA

	by Dark Fader
		v2.0 - Better multiboot switch (heap in iwram)

	by Jeff Frohwein:
		v1.0 - Original release
		v1.1 - Added proper .data section support
		v1.2 - Added support for c++ & iwram overlays
		     - Major contributions by Jason Wilkins.
*/

/*
	This file is released into the public domain for commercial or non-commercial use with no
	restrictions placed upon it.
	
	You can use the following to view section addresses in your .elf file:  objdump -h file.elf
	Please note that empty sections may incorrectly list the lma address as the vma address for
	some versions of objdump.

	The linker script function "var1 += var2;" sometimes reports incorrect values in the *.map file,
	but the actual value it calculates is usually, if not always, correct.		
	If you leave out the ". = ALIGN(4);" at the end of each section then the
	return value of SIZEOF() is sometimes incorrect and "var1 += var2;" appears to not work as well.
	"var1 += var2" style functions are avoided below as a result.                              

	The linker script MEMORY directive is not used here due to the fact that __text_start is not always a fixed value.

	gcc uses crtbegin.o to find the start of the constructors, so we make sure it is first.
	Because this is a wildcard, it doesn't matter if the user does not actually link against crtbegin.o;
	the linker won't look for a file to match a wildcard.
	The wildcard also means that it doesn't matter which directory crtbegin.o is in.
*/

/* misc settings */
OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

/* fixed addresses */
__text_start		= DEFINED(__gba_multiboot) ? 0x2000000 : 0x8000000;
__iwram_start		= 0x3000000;
__ewram_start		= 0x2000000;

/* heap */
__eheap_start		= DEFINED(__gba_multiboot) ? __iheap_start : __xheap_start;
__eheap_end			= __eheap_start + 0x40000;
__iheap_end			= 0x3008000 - 0x400;

/* stack */
__sp_usr			= 0x3008000 - 0x100;
__sp_irq			= 0x3008000 - 0x60;
__intr_vector_buf	= 0x3008000 - 0x4;
__sp_usr_offset		= __sp_usr - __iwram_start;
__intr_vect_offset	= __intr_vector_buf - __sp_usr;

/* sections */
SECTIONS
{
	/* text - code */
	.text __text_start :
	{
		*(EXCLUDE_FILE (*text.iwram*) .text)
		*(.text.*)
		. = ALIGN(4);  
	} = 0xff
	/*  laddr = ADDR(.text) + SIZEOF(.text); */
	__text_end = .;

	/* rodata - const data */
	.rodata :
	{
		*(.rodata)
		*all.rodata*(*)
		*(.roda)
		*(.rodata.*)
		. = ALIGN(4);
	} = 0xff
	/* laddr += SIZEOF(.rodata); */

	/* __iwram_lma = laddr; */
	__iwram_lma = (ADDR(.text) + SIZEOF(.text) + SIZEOF(.rodata) + 3) & ~ 3;

	/* internal work RAM */
	.iwram __iwram_start : AT(__iwram_lma)
	{
    	__iwram_start = ABSOLUTE(.) ;
    	*(.iwram)
		*iwram.*(.text)
		. = ALIGN(4);
	} = 0xff
	/* laddr += SIZEOF(.iwram); */
	/* __data_lma = laddr; */
	__data_lma = ADDR(.text) + SIZEOF(.text) + SIZEOF(.rodata) + SIZEOF(.iwram);
	__iwram_end = .;

	/* bss - zero initialized global variables */
	.bss ALIGN(4):
	{
		__bss_start = ABSOLUTE(.);
		__bss_start__ = ABSOLUTE(.);
		*(.dynbss)
		*(COMMON)
		. = ALIGN(4);    
	}
	__bss_end = .;
	__bss_end__ = .;

	/* data - initialized global/static variables */
	.data ALIGN(4) : AT(__data_lma)
	{
		__data_start = ABSOLUTE(.);
		*(.data)
		*(.data.*)
		. = ALIGN(4);  
	} = 0xff
	/* laddr += SIZEOF(.data); */
	/* __iwram_overlay_lma = laddr; */
	__iwram_overlay_lma = ADDR(.text) + SIZEOF(.text) + SIZEOF(.rodata) + SIZEOF(.iwram) + SIZEOF(.data);
	__data_end = .;
	PROVIDE(edata = .);
	/* __data_lma = LOADADDR(.data); */
	__iwram_overlay_start = .;

	/* internal work RAM overlay */
	OVERLAY : NOCROSSREFS AT(__iwram_overlay_lma)
	{
		.iwram0 { *(.iwram0) . = ALIGN(4); }
		.iwram1 { *(.iwram1) . = ALIGN(4); }
		.iwram2 { *(.iwram2) . = ALIGN(4); }
		.iwram3 { *(.iwram3) . = ALIGN(4); }
		.iwram4 { *(.iwram4) . = ALIGN(4); }
		.iwram5 { *(.iwram5) . = ALIGN(4); }
		.iwram6 { *(.iwram6) . = ALIGN(4); }
		.iwram7 { *(.iwram7) . = ALIGN(4); }
		.iwram8 { *(.iwram8) . = ALIGN(4); }
		.iwram9 { *(.iwram9) . = ALIGN(4); }
	} = 0xff
	/* laddr += (SIZEOF(.iwram0)+SIZEOF(.iwram1)+SIZEOF(.iwram2)+SIZEOF(.iwram3)+SIZEOF(.iwram4)+SIZEOF(.iwram5)+SIZEOF(.iwram6)+SIZEOF(.iwram7)+SIZEOF(.iwram8)+SIZEOF(.iwram9)); */
	/* __ewram_lma = laddr; */
	__ewram_lma = ADDR(.text) + SIZEOF(.text) + SIZEOF(.rodata) + SIZEOF(.iwram) + SIZEOF(.data) + SIZEOF(.iwram0)+SIZEOF(.iwram1)+SIZEOF(.iwram2)+SIZEOF(.iwram3)+SIZEOF(.iwram4)+SIZEOF(.iwram5)+SIZEOF(.iwram6)+SIZEOF(.iwram7)+SIZEOF(.iwram8)+SIZEOF(.iwram9);

	/* __iwram_overlay_lma = LOADADDR (.iwram0); */
	__iwram_overlay_end = .;
	_end = .;
	__end__ = .;
	PROVIDE (end = .);
	__iheap_start = .;

	/* wram - external work RAM */
	.ewram __ewram_start : AT(__ewram_lma)
	{
		__ewram_start = ABSOLUTE(.);
		*(.ewram)
		. = ALIGN(4);  
	} = 0xff
	/* laddr += SIZEOF(.ewram); */
	/* __ewram_overlay_lma = laddr; */
	__ewram_overlay_lma = ADDR(.text) + SIZEOF(.text) + SIZEOF(.rodata) + SIZEOF(.iwram) + SIZEOF(.data) + SIZEOF(.iwram0)+SIZEOF(.iwram1)+SIZEOF(.iwram2)+SIZEOF(.iwram3)+SIZEOF(.iwram4)+SIZEOF(.iwram5)+SIZEOF(.iwram6)+SIZEOF(.iwram7)+SIZEOF(.iwram8)+SIZEOF(.iwram9) + SIZEOF(.ewram);
	/* __ewram_lma = LOADADDR(.ewram); */
	__ewram_end = .;
	__ewram_overlay_start = .;

	/* external work RAM overlay */
	OVERLAY ALIGN(4): NOCROSSREFS AT(__ewram_overlay_lma)
	{
		.ewram0 { *(.ewram0) . = ALIGN(4); }
		.ewram1 { *(.ewram1) . = ALIGN(4); }
		.ewram2 { *(.ewram2) . = ALIGN(4); }
		.ewram3 { *(.ewram3) . = ALIGN(4); }
		.ewram4 { *(.ewram4) . = ALIGN(4); }
		.ewram5 { *(.ewram5) . = ALIGN(4); }
		.ewram6 { *(.ewram6) . = ALIGN(4); }
		.ewram7 { *(.ewram7) . = ALIGN(4); }
		.ewram8 { *(.ewram8) . = ALIGN(4); }
		.ewram9 { *(.ewram9) . = ALIGN(4); }
	} = 0xff
	__ewram_overlay_end = .;
	__xheap_start = .;
}
