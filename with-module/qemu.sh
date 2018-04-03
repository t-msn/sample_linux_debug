#!/bin/bash
linux_path="/usr/data/src/linux"

# need root privilege to pass a physical device
qemu-kvm -m 8G -smp 4 \
	-kernel "$linux_path/arch/x86_64/boot/bzImage" \
	-initrd initramfs.img \
	-append "console=ttyS0 nokaslr" \
	-drive file=/dev/sdc,format=raw \
	-nographic -nodefaults -serial stdio -s
