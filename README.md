## Welcome to Magnetism Linux!
A wacky linux distro! its *WIP* right now (probably always will be) that even has its own package manager!

# Note for contributors:
Currently, Magnetism linux is having a full rewrite for it's new update model.
Please don't contribute while we are having a rewrite. Thank you!

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

### Systems that work for development
Tested:
* Debian
* Arch

May work:
* Alpine
* Fedora/RHEL based

Doesn't work, yet:
* Self-hosting (Magnetism Linux)


### To chroot in, run:
Run:
```bash
chmod +x ./hooks/chroot.sh && ./hooks/chroot.sh
```

Note: Any other way to chroot in other running the hook is not supported.
If you follow any other way, we won't provide support in the bug tracker.

In case of (un)mounting errors, **reboot immediately** your Linux device. It is usually due to incorrect mounting.

## Where do I chat?
You can use our Scratch Studio: https://scratch.mit.edu/studios/51798003/
