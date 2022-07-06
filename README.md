# Arch Linux ISO for Macs with T2No

Follow this to build your own iso:

```sh
git clone https://github.com/t2linux/archiso-t2
cd archiso-t2/
./prepare.sh
./build.sh

#after you did everything
./cleanup.sh
```

After everything has finished, you can grab your iso in './out'.

linux-t2 kernel is from https://github.com/Redecorating/mbp-16.1-linux-wifi (it will be automatically downloaded when building)

# Bonus! Wi-Fi firmware package for Macs with T2 (except ones with BCM4377, they aren't supported for now)

Follow this to build your own package:

```sh
git clone https://github.com/t2linux/archiso-t2
cd archiso-t2/firmware
makepkg -s
```
Or, grab a pre-compiled package:

```sh
wget https://mirror.funami.tech/arch-mact2/os/x86_64/apple-bcm-wifi-firmware-12.0-1-any.pkg.tar.zst
sudo pacman -U apple-bcm-wifi-firmware-12.0-1-any.pkg.tar.zst
```
# Credits
[Noa Himesaka](https://github.com/NoaHimesaka1873): Lead developer and maintainer
[Brad Pitcher](https://github.com/brad): Created GitHub Workflow build script
