#!/bin/bash

sudo mkdir -pv ./rootfs/{proc,sys,run,dev/{shm,pts,}} # Create the necessary mount points

# Mount virtual filesystems.
sudo mount -v --bind /dev $PWD/rootfs/dev
sudo mount -vt devpts devpts -o gid=5,mode=0620,newinstance $PWD/rootfs/dev/pts
sudo mount -vt proc proc $PWD/rootfs/proc
sudo mount -vt sysfs sysfs $PWD/rootfs/sys
sudo mount -vt tmpfs tmpfs $PWD/rootfs/run

if [ -h dev/shm ]; then
  install -v -d -m 1777 $PWD/rootfs$(realpath /dev/shm)
else
  sudo mount -vt tmpfs -o nosuid,nodev tmpfs ./rootfs/dev/shm
fi

# Create missing folders
sudo mkdir -pv ./rootfs/{bin,etc,home,lib,sbin,tmp,usr,var}

# Chroot in.
sudo chroot ./rootfs /bin/env -i TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/sbin:/usr/bin:/usr/sbin /bin/ash --login

# Unmount virtual filesystems
sudo umount ./rootfs/{proc,sys,run,dev/{shm,pts,}}