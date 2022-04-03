#!/bin/bash

ARGS=($@)
SD=$HOME/Projects/dots/scripts

main () {
    echo "╔═══════════════════════════╗"
    echo "║ ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀█ ║"
    echo "║ ▒█░▒█ ▒█░░▒█ ░▒█░░ ░▀▀▀▄▄ ║"
    echo "║ ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█▄▄▄█ ║"
    echo "║          v1.0.0           ║"
    echo "╚═══════════════════════════╝"

    case ${ARGS[0]} in
        "-ac") $SD/add_config.sh ${ARGS[1]};;
        "-bc") $SD/backup_config.sh;;
        "-cs") $SD/configure_system.sh;;
        "-cw") $SD/change_wallpapers.sh ${ARGS[1]};;
        "-rc") $SD/replace_config.sh;;
        "-rmc") $SD/remove_config.sh ${ARGS[1]};;
        "-scs") $SD/sync_color_scheme.sh;;
        "-su") $SD/system_update.sh;;
        ""|*) $SD/unknown_command.sh;;
    esac
}

main
