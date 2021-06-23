#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
WHITE="\e[0m"

main () {
    if [[ -d $HOME/Projects/dots/configs ]]
    then
        read -p "Are you sure to replace all the config? [y/n]: " CHOICE
        if [[ $CHOICE == "y" || $CHOICE == "Y" ]]
        then
            echo -e "${GREEN}INFO: Replacing config.${WHITE}"
            cp -r $HOME/Projects/dots/configs $HOME/.config
            echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
        else
            echo -e "${YELLOW}WARNING: No operation was performed.${WHITE}"
        fi
    else
        echo -e "${YELLOW}WARNING: 'configs' folder was not exists in your dots directory.${WHITE}"
    fi
}

main
