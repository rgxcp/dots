#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
SD=$HOME/Projects/dots/scripts

invalid_option () {
    echo -e "${RED}[!] Invalid option.${WHITE}"
    echo ""
    $SD/interactive_menu.sh
}

main () {
    echo "1. Backup Config"
    echo "2. Configure System"
    echo "3. Replace Config"
    echo "4. Sync Color Scheme"
    echo "5. System Update"
    read -p "Enter your choice: " CHOICE
    echo ""

    case $CHOICE in
        "1") $SD/backup_config.sh;;
        "2") $SD/configure_system.sh;;
        "3") $SD/replace_config.sh;;
        "4") $SD/sync_color_scheme.sh;;
        "5") $SD/system_update.sh;;
        "" | *) invalid_option;;
    esac
}

main
