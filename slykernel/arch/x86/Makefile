LDSCRIPT = arch/x86/linker.ld
ARCHFILES = x86io.adb binary_types.ads
ASFLAGS   = -f elf32 -o

img.c: kernel.bin
	MTOOLSRC=../../bochs/mtools.conf mtools -c mcopy -o ../../$< C:

loader.o:
	nasm $(ASFLAGS) loader.o loader.s

archdeps: kernel.ali
	gnatmake -u $(ARCHFILES) -d -P../../sly.gpr
	gnatbind -z ../../kernel.ali
kernel.adb:
	patch -d ../../ -bi arch/x86/patches/kernel.x86.patch

kernel.ali: kernel.adb
	gnatmake -u kernel.adb -d -P../../sly.gpr

kernel.bin: archdeps loader.o
	gnatlink  -v -o ../../kernel.bin loader.o ../../kernel.ali -T $(LDSCRIPT) -nostdlib -nostdinc -Xlinker -belf32-i386
