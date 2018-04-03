#!/bin/bash

linux_path="/usr/data/src/linux"
cd $linux_path

# need to add "add-auto-safe-path path/to/linux/src" in ~/.gdbinit"
cgdb vmlinux -- \
	-ex="add-auto-load-safe-path $linux_path/scripts/gdb/vmlinux-gdb.py" \
	-ex="target remote :1234" \
	-ex="lx-symbols"
