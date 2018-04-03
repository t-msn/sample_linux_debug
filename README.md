# Description
Small sample scripts for debugging linux kernel with qemu and gdb.

The scripts only works for x86_64 host/guest and just copies host binaries to create a simple initramfs by using gen_init_cpio. It is assumed that busybox/cgdb is installed on the host.

Debug detail: https://www.kernel.org/doc/html/v4.16/dev-tools/gdb-kernel-debugging.html


# Usage
1. compile linux kernel (with config according to the above link)
2. cd simple
3. change $linux_path in each script to actual path
4. ./make_initramfs
5. ./qemu.sh
6. ./cgdb.sh (on other terminal) 

See the above link for more detail about debugging.
