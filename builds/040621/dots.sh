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
    cp -R -u $HOME/.config/polybar $CWD/.config
    cp -R -u $HOME/.config/rofi $CWD/.config

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
        cp -R $CWD/.config/polybar $HOME/.config
        cp -R $CWD/.config/rofi $HOME/.config
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
        "polybar") code $HOME/.config/polybar;;
        "rofi") code $HOME/.config/rofi;;
        "xres") code $HOME/.Xresources;;
        "zsh") code $HOME/.zshrc;;
        "") echo "Usage: dots <--config | -c> [file]";;
        *) echo "Unknown command";;
    esac
}

clear_cache () {
    # sudo pacman -Scc
    # sudo pacman -Qtdq
    # sudo pacman -Rns $(pacman -Qtdq)
    # rm -rf ~/.cache/*
    # ~/.config
    # ~/.local
    # ~/.thumbnails
    # /var/log/journal/
    echo "Working..."
}

system_update () {
    echo "=== UPDATING PACMAN PACKAGES ==="
    sudo pacman -Syu

    echo "=== UPDATING AUR PACKAGES ==="
    yay -Syu

    echo "=== REMOVING ORPHAN PACKAGES ==="
    sudo pacman -Rns $(pacman -Qtdq)

    echo "=== REMOVING CACHES ==="
    yay -Scc

    echo "=== SYNCING WITH DOTS ==="
    update
}

case $FLAG in
    "--update" | "-u") update;;
    "--replace" | "-r") replace;;
    "--config" | "-c") config $2;;
    "--clear-cache" | "-cc") clear_cache $2;;
    "--system-update" | "-su") system_update;;
    "") echo "Usage: dots [args]
    Available args:
    [--update, -u]
    [--replace, -r]
    [--config, -c]
    [--add-config, -ac]
    [--clear-cache, -cc]
    [--system-update, -su]";;
    *) echo "Unknown command";;
esac
