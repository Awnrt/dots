DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"

sudo pacman -Sq $DEPLIST --noconfirm

mkdir /home/$USER/.config
cp -r fish /home/$USER/.config
cp -r hypr /home/$USER/.config
cp -r kitty /home/$USER/.config
cp -r nvim /home/$USER/.config
cp -r waybar /home/$USER/.config
cp -r wofi /home/$USER/.config


