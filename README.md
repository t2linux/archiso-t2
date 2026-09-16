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

linux-t2 kernel is from https://github.com/NoaHimesaka1873/linux-t2-arch (it will be automatically downloaded when building)

# Wi-Fi and Bluetooth firmware

The live system ships `apple-bcm-firmware-fetcher`, which extracts the Wi-Fi and Bluetooth firmware from the macOS volume on the internal SSD (via the APFS driver in `linux-t2`). It runs automatically on the first login of the live system, so Wi-Fi is usable right away as long as macOS is still installed.

If it failed (for example because macOS was wiped), run it again as root:

```sh
apple-bcm-firmware-fetcher
```

For other ways to obtain the firmware, see the [t2linux wiki](https://wiki.t2linux.org/guides/wifi-bluetooth/).

# Credits

[Noa Himesaka](https://github.com/NoaHimesaka1873): Lead developer and maintainer

[Brad Pitcher](https://github.com/brad): Created GitHub Workflow build script

