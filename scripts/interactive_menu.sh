#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"

invalid_option () {
    echo ""
    echo -e "${RED}ERROR: Invalid option.${WHITE}"
    echo ""
    ./scripts/interactive_menu.sh
}

main () {
    echo "1. Backup Config"
    echo "3. Configure System"
    echo "4. Replace Config"
    echo "5. Sync Color Schemes"
    echo "6. System Update"
    read -p "Enter your choice: " CHOICE

    case $CHOICE in
        "1") ./scripts/backup_config.sh;;
        "3") ./scripts/configure_system.sh;;
        "4") ./scripts/replace_config.sh;;
        "5") ./scripts/sync_color_scheme.sh;;
        "6") ./scripts/system_update.sh;;
        "" | *) invalid_option;;
    esac
}

main
