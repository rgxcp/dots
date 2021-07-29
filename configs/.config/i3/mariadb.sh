#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"

if ! systemctl is-active --quiet mariadb
then
    echo -e "${GREEN}[i] Starting MariaDB service.${WHITE}"
    sudo systemctl start mariadb
fi

echo -e "${GREEN}[i] Entering MariaDB.${WHITE}"
mysql -u northern -p
