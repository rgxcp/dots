#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/scripts

invalid_option () {
    echo -e "${RED}ERROR: Invalid option.${WHITE}"
    echo ""
    $PD/interactive_menu.sh
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
        "1") $PD/backup_config.sh;;
        "2") $PD/configure_system.sh;;
        "3") $PD/replace_config.sh;;
        "4") $PD/sync_color_scheme.sh;;
        "5") $PD/system_update.sh;;
        "" | *) invalid_option;;
    esac
}

main
