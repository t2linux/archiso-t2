# Arch Linux ISO for Macs with T2

Follow this to build your own iso

```sh
git clone https://github.com/NoaHimesaka1873/archiso-t2
cd archiso/
./prepare.sh
./build.sh

#after you did everything
./cleanup.sh
```

After everything has finished, you can grab your iso in './out'.

linux-t2 kernel is from https://github.com/Redecorating/mbp-16.1-linux-wifi (it will be automatically downloaded when building)