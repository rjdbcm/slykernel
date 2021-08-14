LDSCRIPT = arch/x86/linker.ld
ARCHFILES = x86io.adb

img.c: kernel.bin
	MTOOLSRC=../../bochs/mtools.conf mtools -c mcopy -o ../../$< C:

loader.o:
	nasm -f elf -o loader.o loader.s

archdeps: kernel.ali
	gnatmake -u $(ARCHFILES) -d -P../../sly.gpr
	gnatbind -z ../../kernel.ali
kernel.adb:
	patch -d ../../ -bi arch/x86/patches/kernel.x86.patch

kernel.ali: kernel.adb
	gnatmake -u kernel.adb -d -P../../sly.gpr

kernel.bin: archdeps loader.o
	gnatlink -o ../../kernel.bin loader.o ../../kernel.ali -T $(LDSCRIPT) \
			-nostdlib -nostdinc
