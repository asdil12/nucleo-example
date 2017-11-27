printf "  CC      miniblink.c\n"
arm-none-eabi-gcc -Os -std=c99 -g -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -Wextra -Wshadow -Wimplicit-function-declaration -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes -fno-common -ffunction-sections -fdata-sections  -MD -Wall -Wundef  -DSTM32F407VG -DSTM32F4CCM -DSTM32F4  -I../libopencm3//include -o miniblink.o -c miniblink.c
printf "  GENLNK  STM32F407VG\n"
arm-none-eabi-gcc -E -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D_ROM=1024K -D_RAM=128K -D_CCM=64K -DSTM32F4CCM -D_CCM_OFF=0x10000000 -DSTM32F4 -D_ROM_OFF=0x08000000 -D_RAM_OFF=0x20000000  -P -E ../libopencm3//ld/linker.ld.S > generated.STM32F407VG.ld
printf "  LD      miniblink.elf\n"
arm-none-eabi-gcc --static -nostartfiles -Tgenerated.STM32F407VG.ld -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -Wl,-Map=miniblink.map -Wl,--gc-sections -L../libopencm3//lib miniblink.o -lopencm3_stm32f4 -Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group -o miniblink.elf
printf "  OBJCOPY miniblink.hex\n"
arm-none-eabi-objcopy -Oihex miniblink.elf miniblink.hex
