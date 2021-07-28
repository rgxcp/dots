#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/packages

main () {
    echo -e "${GREEN}[i] Updating Pacman packages.${WHITE}"
    sudo pacman -Syu
    echo -e "\n${GREEN}[i] Updating Pacman packages list.${WHITE}"
    pacman -Qe > $PD/all.txt
    echo -e "\n${GREEN}[i] Updating AUR packages.${WHITE}"
    yay -Syu
    echo -e "\n${GREEN}[i] Updating AUR packages list.${WHITE}"
    pacman -Qm > $PD/aur.txt
    grep -vf $PD/aur.txt $PD/all.txt > $PD/pacman.txt
    rm $PD/all.txt
    ORPHANS=$(pacman -Qtdq)
    if [[ $ORPHANS ]]
    then
        echo -e "\n${GREEN}[i] Removing orphan packages.${WHITE}"
        sudo pacman -Rns ORPHANS
        # sudo pacman -Rns ${ORPHANS[@]}
    fi
    echo -e "\n${GREEN}[i] Removing packages cache.${WHITE}"
    yay -Scc
}

main
