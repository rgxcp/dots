#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"

main () {
    echo -e "${RED}ERROR: Unknown command.${WHITE}"
    echo ""
    ./scripts/interactive_menu.sh
}

main
