#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/scripts

main () {
    echo -e "${RED}ERROR: Unknown command.${WHITE}"
    echo ""
    $PD/interactive_menu.sh
}

main
