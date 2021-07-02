#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/configs

main () {
    echo -e "${GREEN}INFO: Copying config.${WHITE}"
    cp -r $HOME/.config $PD
    cp $HOME/.Xresources $PD
    cp $HOME/.zshrc $PD
}

main
