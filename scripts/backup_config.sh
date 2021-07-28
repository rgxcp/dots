#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"
CD=$HOME/Projects/dots/configs

main () {
    echo -e "${GREEN}[i] Copying config.${WHITE}"
    while IFS= read -r LINE
    do
        CL=$(echo $LINE | cut -d ":" -f 2)
        if [[ $CL == *".config"* ]]
        then
            if [[ -d $CL ]]
            then
                cp -r $CL $CD/.config
            else
                cp $CL $CD/.config
            fi
        else
            if [[ -d $CL ]]
            then
                cp -r $CL $CD
            else
                cp $CL $CD
            fi
        fi
    done < $CD/configs.txt
}

main
