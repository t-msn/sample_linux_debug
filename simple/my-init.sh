#!/sbin/busybox sh

/sbin/busybox mkdir -p /usr/sbin /usr/bin /bin

/sbin/busybox mkdir /proc
/sbin/busybox mkdir /sys
/sbin/busybox mkdir /run
/sbin/busybox mount -t proc none /proc
/sbin/busybox mount -t sysfs none /sys
/sbin/busybox mount -t debugfs none /sys/kernel/debug
/sbin/busybox mount -t tmpfs cgroup /sys/fs/cgroup
/sbin/busybox mkdir /sys/fs/cgroup/cpu
/sbin/busybox mkdir /sys/fs/cgroup/devices
/sbin/busybox mount -t cgroup -o cpu cgroup /sys/fs/cgroup/cpu
/sbin/busybox mount -t cgroup -o devices cgroup /sys/fs/cgroup/devices
/sbin/busybox mount -t tmpfs none /run

/sbin/busybox mknod -m a=r /dev/zero c 1 5 
/sbin/busybox mknod -m a=r /dev/null c 1 3 
/sbin/busybox mknod -m a=r /dev/urandom c 1 9
/sbin/busybox mknod -m a=rw /dev/ttyS0 c 4 64

/sbin/busybox mkdir /mnt
/sbin/busybox --install -s

export PATH
# launch busybox shell (-l ... load .profile)
/sbin/busybox setsid /sbin/busybox cttyhack sh -l
