#!/bin/bash

sudo mkdir -pv ./{proc,sys,run,dev/{shm,pts,}}

sudo mount -v --bind /dev $PWD/dev
sudo mount -vt devpts devpts -o gid=5,mode=0620,newinstance $PWD/dev/pts
sudo mount -vt proc proc $PWD/proc
sudo mount -vt sysfs sysfs $PWD/sys
sudo mount -vt tmpfs tmpfs $PWD/run

if [ -h dev/shm ]; then
  install -v -d -m 1777 $PWD$(realpath /dev/shm)
else
  sudo mount -vt tmpfs -o nosuid,nodev tmpfs dev/shm
fi

sudo chroot . /bin/env -i TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/sbin:/usr/bin:/usr/sbin /bin/ash --login

sudo umount ./{proc,sys,run,dev/{shm,pts,}}