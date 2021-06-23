#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"

main () {
    echo -e "${GREEN}INFO: Updating Pacman packages.${WHITE}"
    sudo pacman -Syu
    echo -e "${GREEN}INFO: Updating Pacman packages list.${WHITE}"
    pacman -Qe > packages/all.txt
    echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
    echo ""
    echo -e "${GREEN}INFO: Updating AUR packages.${WHITE}"
    yay -Syu
    echo -e "${GREEN}INFO: Updating AUR packages list.${WHITE}"
    pacman -Qm > packages/aur.txt
    grep -vf packages/aur.txt packages/all.txt > packages/pacman.txt
    rm packages/all.txt
    echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
    echo ""
    echo -e "${GREEN}INFO: Removing orphan packages.${WHITE}"
    sudo pacman -Rns $(pacman -Qtdq)
    echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
    echo ""
    echo -e "${GREEN}INFO: Removing packages cache.${WHITE}"
    yay -Scc
    echo -e "${GREEN}INFO: Operation succeeded.${WHITE}"
}

main
