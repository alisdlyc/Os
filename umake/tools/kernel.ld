/* Simple linker script for the ucore kernel.
   See the GNU ld 'info' manual ("info ld") to learn the syntax. */

OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH(i386)
ENTRY(HariMain)

SECTIONS {
    /* Load the kernel at this address: "." means the current address */
    . = 0x280000;

    .text :  {
        *(.text .stub .text.* .gnu.linkonce.t.*)
    }

    PROVIDE(etext = .); /* Define the 'etext' symbol to this value */

    . = 0x310000;

    /* The data segment */
    .data : {
        *(.data .rodata .rodata.* .gnu.linkonce.r.* .bss)
    }

    PROVIDE(edata = .);
	
    /* Include debugging information in kernel memory */
    .stab : {
        PROVIDE(__STAB_BEGIN__ = .);
        *(.stab);
        PROVIDE(__STAB_END__ = .);
        BYTE(0)     /* Force the linker to allocate space
                   for this section */
    }

    .stabstr : {
        PROVIDE(__STABSTR_BEGIN__ = .);
        *(.stabstr);
        PROVIDE(__STABSTR_END__ = .);
        BYTE(0)     /* Force the linker to allocate space
                   for this section */
    }

 

    /DISCARD/ : {
        *(.eh_frame .note.GNU-stack)
    }
}
