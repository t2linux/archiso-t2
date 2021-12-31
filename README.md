# Arch Linux ISO for Macs with T2

This symlink is required so mkarchiso could access to local packages.

```sh
doas ln -s airootfs/t2kern /t2kern
doas mkarchiso -v archiso
```
(replace doas to sudo if you don't use doas.)

After everything has finished, you can grab your iso in './out'. you can delete 'work' directory if everything went well.

The MOTD contains instruction to enable local packages.

linux-t2 kernel was directly downloaded from https://github.com/Redecorating/mbp-16.1-linux-wifi but if you are skeptical just compare hash or download it yourself.
