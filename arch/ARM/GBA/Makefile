LDSCRIPT = arch/ARM/GBA/linker.ld
PREFIX = /opt/arm/arm-ada/bin/arm-none-eabi-
GNAT = $(PREFIX)gnat
ARCHFILES = gbaio.adb
LIBS = binary_types.ads

kernel.gba: archdeps
	$(GNAT)link -o ../../../kernel.elf ../../../kernel.ali -T $(LDSCRIPT) \
			-nostdlib -nostdinc
	$(PREFIX)objcopy -v -O binary ../../../kernel.elf ../../../$@

archdeps: kernel.ali adafiles
	$(GNAT)make -u $(ARCHFILES) -d -P../../../sly.gpr
	$(GNAT)bind -z ../../../kernel.ali

adafiles:
	$(GNAT)make -u $(LIBS) -d -P../../../sly.gpr

kernel.adb:
	patch -d ../../../ -bi arch/ARM/GBA/patches/kernel.GBA.patch

kernel.ali: kernel.adb
	$(GNAT)make -u kernel.adb -d -P../../../sly.gpr
