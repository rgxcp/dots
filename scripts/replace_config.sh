#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
CD=$HOME/Projects/dots/configs

main () {
    read -p "Are you sure to replace the config? [Y/n]: " CHOICE
    if [[ $CHOICE == "y" || $CHOICE == "Y" ]]
    then
        echo -e "${GREEN}[i] Replacing config.${WHITE}"
        cp -r $CD/. $HOME
    fi
}

main
