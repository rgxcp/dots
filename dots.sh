#!/bin/bash

ARG=$1

main () {
    case $ARG in
        "-bc") ./scripts/backup_config.sh;;
        "-cc") ./scripts/clear_cache.sh;;
        "-cs") ./scripts/configure_system.sh;;
        "-rc") ./scripts/replace_config.sh;;
        "-scs") ./scripts/sync_color_scheme.sh;;
        "-su") ./scripts/system_update.sh;;
        "") ./scripts/print_usage.sh;;
        *) ./scripts/print_usage.sh;;
    esac
}

main
