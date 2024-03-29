mkdir /home/$USER/.config
cp -r fish /home/$USER/.config
cp -r hypr /home/$USER/.config
cp -r kitty /home/$USER/.config
cp -r nvim /home/$USER/.config
cp -r waybar /home/$USER/.config
cp -r wofi /home/$USER/.config
cp -r .papes /home/$USER
#sudo cp -r Adwaita-dark /usr/share/themes
sudo cp -r themes/Dracula-theme /usr/share/themes/Dracula
sudo cp -r themes/Dracula-icons /usr/share/icons/Dracula


DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"

sudo pacman -Sq $DEPLIST --noconfirm

echo "options hid_apple fnmode=0" > /etc/modprobe.d/hid_apple.conf 
echo "options nvidia NVreg_RegistryDwords=\"PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3\"" > /etc/modprobe.d/nvidia.conf

sudo mkdir /etc/systemd/system/dhcpcd@eno1.service.d/
sudo echo "[Service]" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf
sudo echo "ExecStart=" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf
sudo echo "ExecStart=/usr/bin/dhcpcd -b -q %I" >> /etc/systemd/system/dhcpcd@eno1.service.d/no-wait.conf

sudo echo "noarp" >> /etc/dhcpcd.conf

sudo systemctl enable cpupower.service
sudo systemctl start cpupower.service

sudo echo "governor='performance'" >> /etc/default/cpupower

sudo echo "min_freq='4.3GHz'" >> /etc/default/cpupower

sudo echo "min_freq='4.8GHz'" >> /etc/default/cpupower

# Uncomment these lines to have yay automatically installed
#
#cd /home/$USER
#wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
#tar -xzf yay.tar.gz
#cd yay
#makepkg -csi

gsettings set org.gnome.desktop.interface font-name 'JetBrainsMonoNL NF Bold Mono 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMonoNL NF Bold Mono 11'
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

sudo mkinitcpio -P
chsh -s $(which fish)
