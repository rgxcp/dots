#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/packages

main () {
    echo -e "${GREEN}INFO: Updating Pacman packages.${WHITE}"
    sudo pacman -Syu
    echo ""
    echo -e "${GREEN}INFO: Updating Pacman packages list.${WHITE}"
    pacman -Qe > $PD/all.txt
    echo ""
    echo -e "${GREEN}INFO: Updating AUR packages.${WHITE}"
    yay -Syu
    echo ""
    echo -e "${GREEN}INFO: Updating AUR packages list.${WHITE}"
    pacman -Qm > $PD/aur.txt
    grep -vf $PD/aur.txt $PD/all.txt > $PD/pacman.txt
    rm $PD/all.txt
    echo ""
    echo -e "${GREEN}INFO: Removing orphan packages.${WHITE}"
    sudo pacman -Rns $(pacman -Qtdq)
    echo ""
    echo -e "${GREEN}INFO: Removing packages cache.${WHITE}"
    yay -Scc
}

main
