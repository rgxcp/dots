#/bin/bash
FLAG=$1

update () {
    CWD=$HOME/Projects/dots

    cp /etc/bluetooth/main.conf $CWD/etc/bluetooth/main.conf
    cp /etc/modprobe.d/nobeep.conf $CWD/etc/modprobe.d/nobeep.conf
    cp $HOME/.config/dunst/dunstrc $CWD/.config/dunst/dunstrc
    cp $HOME/.config/neofetch/config.conf $CWD/.config/neofetch/config.conf
    cp $HOME/.dmenurc $CWD/.dmenurc
    cp $HOME/.i3/config $CWD/.i3/config
    cp $HOME/.Xresources $CWD/.Xresources
    cp $HOME/.zshrc $CWD/.zshrc

    echo "# All" > $CWD/packages.txt
    pacman -Qe >> $CWD/packages.txt
    echo -e "\n# AUR" >> $CWD/packages.txt
    pacman -Qm >> $CWD/packages.txt
}

replace () {
    CWD=$HOME/Projects/dots
    read -p "Are you sure to replace the original config? [Y/n]: " CHOICE

    if [ $CHOICE == "y" ] || [ $CHOICE == "Y" ]; then
        cp $CWD/etc/bluetooth/main.conf /etc/bluetooth/main.conf
        cp $CWD/etc/modprobe.d/nobeep.conf /etc/modprobe.d/nobeep.conf
        cp $CWD/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc
        cp $CWD/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf
        cp $CWD/.dmenurc $HOME/.dmenurc
        cp $CWD/.i3/config $HOME/.i3/config
        cp $CWD/.Xresources $HOME/.Xresources
        cp $CWD/.zshrc $HOME/.zshrc
    else
        echo "No operation were performed."
    fi
}

config () {
    FLAG=$1

    case $FLAG in
        "dmenu") code $HOME/.dmenurc;;
        "dunst") code $HOME/.config/dunst/dunstrc;;
        "i3") code $HOME/.i3/config;;
        "neofetch") code $HOME/.config/neofetch/config.conf;;
        "xres") code $HOME/.Xresources;;
        "zsh") code $HOME/.zshrc;;
        "") echo "Usage: dots <--config | -c> [file]";;
        *) echo "Unknown command";;
    esac
}

case $FLAG in
    "--update" | "-u") update;;
    "--replace" | "-r") replace;;
    "--config" | "-c") config $2;;
    "") echo "Usage: dots [--update | -u] [--replace | -r] [--config | -c]";;
    *) echo "Unknown command";;
esac
