 #/bin/bash
 # avoid to need arch to work on arch, also allow different type of virtualisation to build any to any
 docker run --rm -it --privileged   -v "${PWD}:/app" archlinux:latest  bash -lc 'pacman -Sy --needed --noconfirm wget archiso grub arch-install-scripts git base-devel && sudo grub-install /dev/sda && mkarchiso -v "/app/archiso"'