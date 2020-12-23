#/bin/sh
CWD=$HOME/Projects/dots

cp /etc/bluetooth/main.conf $CWD/etc/bluetooth/main.conf
cp /etc/modprobe.d/nobeep.conf $CWD/etc/modprobe.d/nobeep.conf
cp $HOME/.config/neofetch/config.conf $CWD/.config/neofetch/config.conf
cp $HOME/.i3/config $CWD/.i3/config
cp $HOME/.dmenurc $CWD/.dmenurc
cp $HOME/.Xresources $CWD/.Xresources
cp $HOME/.zshrc $CWD/.zshrc

echo "# All" > $CWD/packages.txt
pacman -Qe >> $CWD/packages.txt
echo -e "\n# AUR" >> $CWD/packages.txt
pacman -Qm >> $CWD/packages.txt
