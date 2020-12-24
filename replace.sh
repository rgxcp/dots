#/bin/sh
read -p "Are you sure to replace the original config? [Y/n]: " CHOICE

if [ $CHOICE == "y" ] || [ $CHOICE == "Y" ]; then
    CWD=$HOME/Projects/dots
    cp $CWD/etc/bluetooth/main.conf /etc/bluetooth/main.conf
    cp $CWD/etc/modprobe.d/nobeep.conf /etc/modprobe.d/nobeep.conf
    cp $CWD/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc
    cp $CWD/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf
    cp $CWD/.i3/config $HOME/.i3/config
    cp $CWD/.dmenurc $HOME/.dmenurc
    cp $CWD/.Xresources $HOME/.Xresources
    cp $CWD/.zshrc $HOME/.zshrc
else
    echo "No operation were performed."
fi
