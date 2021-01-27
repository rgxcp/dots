#!/bin/bash
FLAG=$1

update () {
    CWD=$HOME/Projects/dots

    cat /etc/bluetooth/main.conf > $CWD/etc/bluetooth/main.conf
    cat /etc/modprobe.d/nobeep.conf > $CWD/etc/modprobe.d/nobeep.conf
    cat $HOME/.config/dunst/dunstrc > $CWD/.config/dunst/dunstrc
    cat $HOME/.config/i3/config > $CWD/.config/i3/config
    cat $HOME/.config/i3status/config > $CWD/.config/i3status/config
    cat $HOME/.config/neofetch/config.conf > $CWD/.config/neofetch/config.conf
    cat $HOME/.dmenurc > $CWD/.dmenurc
    cat $HOME/.Xresources > $CWD/.Xresources
    cat $HOME/.zshrc > $CWD/.zshrc

    echo "# All" > $CWD/packages.txt
    pacman -Qe >> $CWD/packages.txt
    echo -e "\n# AUR" >> $CWD/packages.txt
    pacman -Qm >> $CWD/packages.txt
}

replace () {
    CWD=$HOME/Projects/dots
    read -p "Are you sure to replace the original config? [Y/n] " CHOICE

    if [ $CHOICE == "y" ] || [ $CHOICE == "Y" ]; then
        cat $CWD/etc/bluetooth/main.conf > /etc/bluetooth/main.conf
        cat $CWD/etc/modprobe.d/nobeep.conf > /etc/modprobe.d/nobeep.conf
        cat $CWD/.config/dunst/dunstrc > $HOME/.config/dunst/dunstrc
        cat $CWD/.config/i3/config > $HOME/.config/i3/config
        cat $CWD/.config/i3status/config > $HOME/.config/i3status/config
        cat $CWD/.config/neofetch/config.conf > $HOME/.config/neofetch/config.conf
        cat $CWD/.dmenurc > $HOME/.dmenurc
        cat $CWD/.Xresources > $HOME/.Xresources
        cat $CWD/.zshrc > $HOME/.zshrc
    else
        echo "No operation were performed."
    fi
}

config () {
    FLAG=$1

    case $FLAG in
        "dmenu") code $HOME/.dmenurc;;
        "dunst") code $HOME/.config/dunst/dunstrc;;
        "i3") code $HOME/.config/i3/config;;
        "i3status") code $HOME/.config/i3status/config;;
        "neofetch") code $HOME/.config/neofetch/config.conf;;
        "xres") code $HOME/.Xresources;;
        "zsh") code $HOME/.zshrc;;
        "") echo "Usage: dots <--config | -c> [file]";;
        *) echo "Unknown command";;
    esac
}

add_config () {
    echo "Working..."
}

clear_cache () {
    # sudo pacman -Scc
    # sudo pacman -Qdt
    # sudo pacman -Rs $(pacman -Qdt)
    # rm -rf ~/.cache/*
    # ~/.config
    # ~/.local
    # ~/.thumbnails
    # /var/log/journal/
    echo "Working..."
}

case $FLAG in
    "--update" | "-u") update;;
    "--replace" | "-r") replace;;
    "--config" | "-c") config $2;;
    "--add-config" | "-ac") add_config $2 $3;;
    "--clear-cache" | "-cc") clear_cache $2;;
    "") echo "Usage: dots [--update, -u] [--replace, -r] [--config, -c] [--add-config, -ac] [--clear-cache, -cc]";;
    *) echo "Unknown command";;
esac
