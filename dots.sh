#!/bin/bash

ARG=$1
SD=$HOME/Projects/dots/scripts

main () {
    echo "╔═══════════════════════════╗"
    echo "║ ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀█ ║"
    echo "║ ▒█░▒█ ▒█░░▒█ ░▒█░░ ░▀▀▀▄▄ ║"
    echo "║ ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█▄▄▄█ ║"
    echo "║          v1.0.0           ║"
    echo "╚═══════════════════════════╝"

    case $ARG in
        "-bc") $SD/backup_config.sh;;
        "-cs") $SD/configure_system.sh;;
        "-rc") $SD/replace_config.sh;;
        #"-scs") $SD/sync_color_scheme.sh;;
        "-su") $SD/system_update.sh;;
        "") $SD/interactive_menu.sh;;
        *) $SD/unknown_command.sh;;
    esac
}

main
