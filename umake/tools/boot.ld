OUTPUT_FORMAT("elf32-i386")
OUTPUT_ARCH(i386)

SECTIONS {
    . = 0xC200;

    .startup : {
        *asmhead.o(.text)
    }

    .text : { *(.text) }
    .data : { *(.data .rodata) }
    
    /DISCARD/ : { *(.eh_*) }
}
