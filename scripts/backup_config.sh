#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
WHITE="\e[0m"

main () {
    if [[ -d $HOME/.config ]]
    then
        echo -e "${GREEN}INFO: Copying config.${WHITE}"
        cp -r $HOME/.config $HOME/Projects/dots/configs
        echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
    else
        echo -e "${YELLOW}WARNING: '.config' folder was not exists in your home directory.${WHITE}"
    fi
}

main
