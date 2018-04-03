#!/bin/bash
linux_path="/usr/data/src/linux"

qemu-kvm -m 8G -smp 4 \
	-kernel "$linux_path/arch/x86_64/boot/bzImage" \
	-initrd initramfs.img \
	-append "console=ttyS0 nokaslr" \
	-nographic -nodefaults -serial stdio -s

	# need root privilege to pass a physical drive
	# -drive file=/dev/sdc,format=raw \
