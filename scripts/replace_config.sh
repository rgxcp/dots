#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/configs

main () {
    read -p "Are you sure to replace the config? [Y/n]: " CHOICE
    if [[ $CHOICE == "y" || $CHOICE == "Y" ]]
    then
        echo -e "${GREEN}INFO: Replacing config.${WHITE}"
        cp -r $PD/. $HOME
    fi
}

main
