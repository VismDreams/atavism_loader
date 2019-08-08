/* LINKER.LD */
/* С помощью линкера GRUB будет загружать ядро */
/* по адрессу память большему или равному 1мб */
/* (т.к адреса памяти ниже 1мб занимают GRUB */
/* BIOS и "memory-mapped" Input/Out  (I/O)) */

/* *(.NAME) - привязка файлов в какому-либо "размеру памяти" */
/* rodata - read-only data */

/* ld -T link.ld -melf_i386 loader.o -o kernel.elf */

ENTRY(loader)

SECTIONS {
    . = 0x0010000;               /* Предел загрузки кода >= 1мб */

    .text ALIGN (0x1000): {      /* Привязка текстовых файлов к 4кб */
        *(.text)
    }

    .rodata ALIGN (0x1000): {
        *(.rodata*)
    }

    .data ALIGN (0x1000): {
        *(.data)
    }

    .bss ALIGN (0x1000): {
        *(COMMON)
        *(.bss)
    }
}