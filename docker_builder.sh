 #/bin/bash

 # so you don t need arch to build arch
 # fixed tag also allow to fix version
 # a .lock with version could be good as well
 docker run --rm -it --privileged   -v "${PWD}:/app" archlinux:latest  bash -lc 'pacman -Sy --needed --noconfirm wget archiso grub arch-install-scripts git base-devel && mkarchiso -o "/app/out" -v "/app/archiso"'
# https://docs.docker.com/engine/install/