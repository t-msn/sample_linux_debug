#!/bin/bash
stty erase ^?

export PATH=/usr/lib64/ccache:/bin:/sbin:$PATH

ln -s /usr/bin/true /bin/true
alias vi='busybox vi'
