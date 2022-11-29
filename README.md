# Arch Linux ISO for Macs with T2

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

# Bonus! Wi-Fi and Bluetooth firmware package for Macs with T2

Follow this to build your own package:

```sh
git clone https://github.com/NoaHimesaka1873/apple-bcm-firmware
cd apple-bcm-firmware
makepkg -s
```
Or, grab a pre-compiled package:

```sh
wget https://mirror.funami.tech/arch-mact2/os/x86_64/apple-bcm-firmware-13.0-1-any.pkg.tar.zst
sudo pacman -U apple-bcm-firmware-13.0-1-any.pkg.tar.zst
```

If you need raw firmware files, you can grap them from [here](https://mirror.funami.tech/arch-mact2/firmware/).

# Credits

[Noa Himesaka](https://github.com/NoaHimesaka1873): Lead developer and maintainer

[Brad Pitcher](https://github.com/brad): Created GitHub Workflow build script

