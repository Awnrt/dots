mkdir /home/$USER/.config
cp -r fish /home/$USER/.config
cp -r hypr /home/$USER/.config
cp -r kitty /home/$USER/.config
cp -r nvim /home/$USER/.config
cp -r waybar /home/$USER/.config
cp -r wofi /home/$USER/.config
cp -r .papes /home/$USER

DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"

sudo pacman -Sq $DEPLIST --noconfirm

wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip

wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip Dracula.zip

wget https://github.com/dracula/gtk/releases/download/v4.0.0/Dracula-cursors.tar.xz
tar -xf Dracula-cursors.tar.xz 

mkdir /home/$USER/.local
mkdir /home/$USER/.local/share
mkdir /home/$USER/.local/share/themes
mkdir /home/$USER/.local/share/icons
cp -r gtk-master /home/$USER/.local/share/themes/Dracula
cp -r Dracula /home/$USER/.local/share/icons
cp -r Dracula-cursors /home/$USER/.local/share/icons

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
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"

chsh -s $(which fish)
