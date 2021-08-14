
x86:
	make -C arch/x86/

gba:
	make -C arch/ARM/GBA/

clean:
	gnat clean -r -P./sly.gpr
	rm -f kernel.bin
	rm -rf ./doc
	rm -f *.elf
	rm -f *.gba
	rm -f *.ali
	rm -f *.o
	rm -f *.map
	rm -f *.metrix
	mv kernel.adb.orig kernel.adb

docs:
	robodoc --debug
	gnat metric -vx -P./sly.gpr
