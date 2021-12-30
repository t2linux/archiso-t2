echo "This script will add local repository which contains necessary kernel to /etc/pacman.conf."
echo "After running pacstrap and before you go into chroot, please, *please* copy /t2kern to /mnt/t2kern"
 
cat /root/t2kern.txt >> /etc/pacman.conf
