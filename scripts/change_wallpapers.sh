#!/bin/bash

IMAGE_PATH=$1
GREEN="\e[32m"
RED="\e[31m"
WHITE="\e[0m"

main () {
    # Check if image path is empty
    if [[ -z $IMAGE_PATH ]]
    then
        echo -e "${RED}[!] Please specify image path in the argument.${WHITE}"
        exit
    fi

    # Check if image path is a file
    if [[ -d $IMAGE_PATH ]]
    then
        echo -e "${RED}[!] Path must be an image.${WHITE}"
        exit
    fi

    # Check if image path is exists
    if [[ ! -f $IMAGE_PATH ]]
    then
        echo -e "${RED}[!] Image is not exists.${WHITE}"
        exit
    fi

    echo -e "${GREEN}[i] Changing Better Lock Screen Wallpaper.${WHITE}"
    betterlockscreen -u $IMAGE_PATH --fx dim
    echo -e "]n${GREEN}[i] Changing LightDM Wallpaper.${WHITE}"
    sudo cp $IMAGE_PATH /usr/share/pixmaps/Wallpaper.jpg
}

main
