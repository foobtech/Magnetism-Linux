Welcome to Magnetism Linux! o/
a wacky linux distro! its WIP right now (probably always will be) that even has its own package manager!

To chroot in, run:
sudo mount -v --bind /dev dev
sudo mount -vt devpts devpts -o gid=5,mode=0620,newinstance dev/pts
sudo mount -vt proc proc proc
sudo mount -vt sysfs sysfs sys
sudo mount -vt tmpfs tmpfs run

if \[ -h dev/shm \]; then
  install -v -d -m 1777 $PWD/$(realpath /dev/shm)
else
  sudo mount -vt tmpfs -o nosuid,nodev tmpfs dev/shm
fi

sudo chroot . /bin/env -i TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/sbin:/usr/bin /bin/ash --login

When done:
sudo umount ./{proc,sys,run,dev/{shm,pts,}}
