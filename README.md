## Welcome to Magnetism Linux!
a wacky linux distro! its *WIP* right now (probably always will be) that even has its own package manager!

Requirements:
* `bash`

In case you have missing dependencies, run these commands:
```shell
# Debian / Ubuntu
sudo apt install bash

# Arch or Pacman-based
sudo pacman -S bash

# Red Hat-based (including Fedora, CentOS, etc.)
sudo dnf install bash
# or
sudo yum install bash
# Magnetism isn't self hosting... right now.
```

### To chroot in, run:


```bash
sudo mkdir -pv ./{proc,sys,run,dev/{shm,pts,}}

sudo mount -v --bind /dev dev
sudo mount -vt devpts devpts -o gid=5,mode=0620,newinstance dev/pts
sudo mount -vt proc proc proc
sudo mount -vt sysfs sysfs sys
sudo mount -vt tmpfs tmpfs run

if [ -h dev/shm ]; then
  install -v -d -m 1777 $PWD/$(realpath /dev/shm)
else
  sudo mount -vt tmpfs -o nosuid,nodev tmpfs dev/shm
fi

sudo chroot . /bin/env -i TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/sbin:/usr/bin /bin/ash --login

# When done:
sudo umount ./{proc,sys,run,dev/{shm,pts,}}
```
#### Where do I chat?
You can use our Scratch Studio: https://scratch.mit.edu/studios/51798003/
