#/bin/sh
cp /etc/bluetooth/main.conf $HOME/Projects/dots/etc/bluetooth/main.conf
cp /etc/modprobe.d/nobeep.conf $HOME/Projects/dots/etc/modprobe.d/nobeep.conf
cp $HOME/.config/neofetch/config.conf $HOME/Projects/dots/.config/neofetch/config.conf
cp $HOME/.i3/config $HOME/Projects/dots/.i3/config
cp $HOME/.dmenurc $HOME/Projects/dots/.dmenurc
cp $HOME/.Xresources $HOME/Projects/dots/.Xresources
cp $HOME/.zshrc $HOME/Projects/dots/.zshrc
echo "# All" > $HOME/Projects/dots/packages.txt
pacman -Qe >> $HOME/Projects/dots/packages.txt
echo -e "\n# AUR" >> $HOME/Projects/dots/packages.txt
pacman -Qm >> $HOME/Projects/dots/packages.txt
