#!/sbin/busybox sh

# /sbin/busybox mkdir -p /usr/sbin /usr/bin /bin
# /sbin/busybox --install -s
/sbin/busybox mkdir /usr

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
/sbin/busybox mknod -m a=rw /dev/btrfs-control c 10 234
/sbin/busybox mknod -m a=rw /dev/loop-control c 10 237
# ad hoc solution
/sbin/busybox mkdir /dev/mapper
/sbin/busybox mknod -m a=rw /dev/mapper/control c 10 236
/sbin/busybox mknod -m a=rw /dev/mapper/error-test b 253 0

# make device file (which will be passed by qemu)
/sbin/busybox mknod -m a=rw /dev/sda  b 8 0
/sbin/busybox mknod -m a=rw /dev/sda1 b 8 1
/sbin/busybox mknod -m a=rw /dev/sda2 b 8 2
/sbin/busybox mknod -m a=rw /dev/sda3 b 8 3
/sbin/busybox mknod -m a=rw /dev/sda4 b 8 4
/sbin/busybox mknod -m a=rw /dev/sda5 b 8 5
/sbin/busybox mknod -m a=rw /dev/sda6 b 8 6
/sbin/busybox mknod -m a=rw /dev/sda7 b 8 7
/sbin/busybox mknod -m a=rw /dev/sda8 b 8 8

/sbin/busybox mknod -m a=rw /dev/loop0 b 7 0
/sbin/busybox mknod -m a=rw /dev/loop1 b 7 1
/sbin/busybox mknod -m a=rw /dev/loop2 b 7 2
/sbin/busybox mknod -m a=rw /dev/loop3 b 7 3

/sbin/busybox mkdir /mnt
/sbin/busybox mkdir /tmp

/sbin/busybox modprobe loop
/sbin/busybox modprobe btrfs
/sbin/busybox modprobe xfs
/sbin/busybox modprobe dm-flakey

/sbin/busybox mount /dev/sda1 /mnt
# Require that device passed by qemu contains host binary/libarary
/sbin/busybox ln -s /mnt/usr/bin/ /usr
/sbin/busybox ln -s /mnt/usr/sbin/ /usr
/sbin/busybox ln -s /mnt/usr/lib64 /usr
/sbin/busybox ln -s /mnt/usr/lib /usr
/sbin/busybox ln -s /mnt/lib64/ /
/sbin/busybox ln -s /mnt/usr/lib/systemd /lib/
/sbin/busybox ln -s /proc/self/fd /dev

# /sbin/busybox --install -s

export PATH

# launch busybox shell (-l ... load .profile)
/sbin/busybox setsid /sbin/busybox cttyhack sh -l
