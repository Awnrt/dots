mkdir /home/$USER/.config
cp -r fish /home/$USER/.config
cp -r hypr /home/$USER/.config
cp -r kitty /home/$USER/.config
cp -r nvim /home/$USER/.config
cp -r waybar /home/$USER/.config
cp -r wofi /home/$USER/.config


DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"

sudo pacman -Sq $DEPLIST --noconfirm

wget https://github.com/dracula/gtk/releases/download/v4.0.0/Dracula-cursors.tar.xz
tar -xf Dracula-cursors.tar.xz 

mkdir /home/$USER/.local
mkdir /home/$USER/.local/share
mkdir /home/$USER/.local/share/themes
mkdir /home/$USER/.local/share/icons
cp -r Dracula-cursors /home/$USER/.local/share/icons
cp -r papes /home/$USER/.local/share

gsettings set org.gnome.desktop.interface font-name 'JetBrainsMonoNL NF Bold Mono 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMonoNL NF Bold Mono 11'
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.wm.preferences theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface icon-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Dracula-cursors"

chsh -s $(which fish)
