#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
SD=$HOME/Projects/dots/scripts

main () {
echo -e "${RED}[!] Unknown command.${WHITE}"
cat << EOF
usage: ./dots.sh [-ac <PATH>]  - Add config
                 [-bc]         - Backup config
                 [-cs]         - Configure system
                 [-cw <PATH>]  - Change wallpapers
                 [-rc]         - Replace config
                 [-rmc <PATH>] - Remove config
                 [-scs]        - Sync color scheme
                 [-su]         - System update
EOF
}

main
