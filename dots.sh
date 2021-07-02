#!/bin/bash

ARG=$1
PD=$HOME/Projects/dots/scripts

main () {
    echo "╔═══════════════════════════╗"
    echo "║ ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀█ ║"
    echo "║ ▒█░▒█ ▒█░░▒█ ░▒█░░ ░▀▀▀▄▄ ║"
    echo "║ ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█▄▄▄█ ║"
    echo "║          v1.0.0           ║"
    echo "╚═══════════════════════════╝"

    case $ARG in
        "-bc") $PD/backup_config.sh;;
        "-cs") $PD/configure_system.sh;;
        "-rc") $PD/replace_config.sh;;
        #"-scs") $PD/sync_color_scheme.sh;;
        "-su") $PD/system_update.sh;;
        "") $PD/interactive_menu.sh;;
        *) $PD/unknown_command.sh;;
    esac
}

main
