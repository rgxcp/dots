#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
CD=$HOME/Projects/dots/configs

main () {
    echo -e "${GREEN}[i] Copying config.${WHITE}"
    cp -r $HOME/.config/alacritty $CD/.config
    cp -r $HOME/.config/dunst $CD/.config
    cp -r $HOME/.config/gtk-2.0 $CD/.config
    cp -r $HOME/.config/gtk-3.0 $CD/.config
    cp -r $HOME/.config/neofetch $CD/.config
    cp -r $HOME/.config/pcmanfm $CD/.config
    cp -r $HOME/.config/picom $CD/.config
    cp -r $HOME/.config/polybar $CD/.config
    cp -r $HOME/.config/qtile $CD/.config
    cp -r $HOME/.config/rofi $CD/.config
    cp $HOME/.config/betterlockscreenrc $CD/.config
    cp $HOME/.config/dolphinrc $CD/.config
    cp $HOME/.config/starship.toml $CD/.config
    cp $HOME/.Xresources $CD
    cp $HOME/.zshrc $CD
}

main
