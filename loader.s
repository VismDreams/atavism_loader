                                          ; nasm -f elf32 loader.s ;

global loader                           ; ELF - некая загрузочная программа для grub -> loader.elf

    ATAVISM_LOAD    equ 0x1FAMB002      ; инициализация LOAD константы
    FLAGS           equ 0x0             ; инициализация мультибута
    CHECKSUM        equ -ATAVISM_LOAD   ; ATAVISM_LOAD + FLAGS + CHECKSUM = 0 !!!

                                        ; Здесь стартует вся секция кода/текста
section .text:
    align 4                             ; инициализация предела для кода/текста - 4 байта

                                        ; подгрузка
        dd ATAVISM_LOAD
        dd FLAGS
        dd CHECKSUM

                                        ; Входная точка для линкера
loader:
    mov eax, ATAVISM_LOAD

                                        ; Я хз как это работает
.loop:
    jmp .loop
