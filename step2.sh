ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime;
sed -i 's/^#th_TH.UTF-8/th_TH.UTF-8/;s/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen;
locale-gen && echo "LANG=en_US.UTF-8" > /etc/locale.conf;
echo "himei-city" > /etc/hostname;
echo -e "127.0.0.1   localhost\n::1         localhost\n127.0.1.1   himei-city" > /etc/hosts;
systemctl enable NetworkManager;
eval "echo -e \\"admin\nadmin\\" \\| passwd";
useradd -m -G wheel miyu;
eval "echo -e \\"admin\nadmin\\" \\| passwd miyu";
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers;
pacman -S grub efibootmgr os-prober xorg-server ly i3-wm i3status i3lock dmenu intel-ucode xf86-video-intel alacritty htop;
mount --mkdir /dev/sda1 /boot/efi;
grub-install --target=x86_64-efi --bootloader-id=grub;
grub-mkconfig -o /boot/grub/grub.cfg;
sed -i 's/^#GRUB_DISABLE_OS_PROBER=/GRUB_DISABLE_OS_PROBER=/' /etc/default/grub;
systemctl enable ly;
