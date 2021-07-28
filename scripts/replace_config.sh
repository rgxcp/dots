#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
CD=$HOME/Projects/dots/configs

main () {
    read -p "Are you sure to replace the config? [Y/n]: " CHOICE
    if [[ $CHOICE == "Y" || $CHOICE == "y" ]]
    then
        echo -e "${GREEN}[i] Replacing config.${WHITE}"
        cp -r $CD/. $HOME
        rm $HOME/configs.txt
    else
        echo -e "${GREEN}[i] No operation was performed.${WHITE}"
    fi
}

main
