#!/bin/bash

ARG=$1

main () {
    echo "╔═══════════════════════════╗"
    echo "║ ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀█ ║"
    echo "║ ▒█░▒█ ▒█░░▒█ ░▒█░░ ░▀▀▀▄▄ ║"
    echo "║ ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█▄▄▄█ ║"
    echo "║          v1.0.0           ║"
    echo "╚═══════════════════════════╝"

    case $ARG in
        "-bc") ./scripts/backup_config.sh;;
        #"-cs") ./scripts/configure_system.sh;;
        "-rc") ./scripts/replace_config.sh;;
        #"-scs") ./scripts/sync_color_scheme.sh;;
        "-su") ./scripts/system_update.sh;;
        "") ./scripts/interactive_menu.sh;;
        *) ./scripts/unknown_command.sh;;
    esac
}

main
