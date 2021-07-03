#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
SD=$HOME/Projects/dots/scripts

main () {
    echo -e "${RED}[!] Unknown command.${WHITE}"
    echo ""
    $SD/interactive_menu.sh
}

main
