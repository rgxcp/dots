#!/bin/bash

CONFIG_PATH=$1
GREEN="\e[32m"
RED="\e[31m"
WHITE="\e[0m"
CD=$HOME/Projects/dots/configs

configure_rofi () {
    NAMES=()
    TITLES=()
    PATHS=()
    RL=$HOME/.config/rofi/scripts/edit-config/edit_config.sh

    while IFS= read -r LINE
    do
        NAMES+=($(echo ${LINE,,} | cut -d ":" -f 1 | tr " " "_"))
        TITLES+=($(echo $LINE | cut -d ":" -f 1 | tr " " "-"))
        PATHS+=($(echo $LINE | cut -d ":" -f 3))
    done < $CD/configs.txt

    echo -e "#!/bin/bash\n\nROFI=\"rofi -theme .config/rofi/scripts/edit-config/edit_config.rasi\"\n\n# Options" > $RL

    for ((I = 0; I < ${#NAMES[@]}; I++))
    do
        echo -e "${NAMES[$I]}=\"${TITLES[$I]}\"" >> $RL
    done

    echo -e "\nOPTIONS=(" >> $RL

    for NAME in ${NAMES[@]}
    do
        echo -e "\t\$$NAME" >> $RL
    done

    echo -e ")\n\nCHOSEN=\"\$(printf \"%s\\\n\" \"\${OPTIONS[@]}\" | \$ROFI -p \"Edit Config\" -dmenu -selected-row 0)\"\ncase \$CHOSEN in" >> $RL

    for ((I = 0; I < ${#NAMES[@]}; I++))
    do
        echo -e "\t\$${NAMES[$I]}) code ${PATHS[$I]};;" >> $RL
    done

    echo "esac" >> $RL
}

main () {
    # Check if config path is empty
    if [[ -z $CONFIG_PATH ]]
    then
        echo -e "${RED}[!] Please specify config path in the argument.${WHITE}"
        exit
    fi

    # Check if config already exists
    if cut $CD/configs.txt -d ":" -f 2 | grep -Fxq $CONFIG_PATH
    then
        echo -e "${RED}[!] This config already exists.${WHITE}"
        exit
    fi

    # Input config name
    read -p "[?] Config name: " CONFIG_NAME
    if [[ -z $CONFIG_NAME ]]
    then
        echo -e "${RED}[!] Please specify config name.${WHITE}"
        exit
    fi

    # Input copy path
    read -p "[?] Copy config to '.config' folder? [Y/n]: " CHOICE
    case $CHOICE in
        "Y"|"y") COPY_LOCATION=$CD/.config;;
        "n"|"n") COPY_LOCATION=$CD;;
        *) echo -e "${RED}[!] Invalid choice.${WHITE}"; exit;;
    esac

    # Begin copy
    # Check if config path is a directory
    if [[ -d $CONFIG_PATH ]]
    then
        # Input executable file
        read -p "[?] Executable file: " EXECUTABLE_FILE
        if [[ -n $EXECUTABLE_FILE && ! -e $CONFIG_PATH/$EXECUTABLE_FILE ]]
        then
            echo -e "${RED}[!] File not found.${WHITE}"
            exit
        elif [[ -n $EXECUTABLE_FILE && -e $CONFIG_PATH/$EXECUTABLE_FILE ]]
        then
            echo -e "${GREEN}[i] Adding config.${WHITE}"
            echo "$CONFIG_NAME:$CONFIG_PATH:$CONFIG_PATH/$EXECUTABLE_FILE" >> $CD/configs.txt
            # sed -i "s|$(echo $HOME)|\$HOME|g" $CD/configs.txt
            sort $CD/configs.txt -o $CD/configs.txt
            cp -r $CONFIG_PATH $COPY_LOCATION
            configure_rofi
        else
            echo -e "${GREEN}[i] Adding config.${WHITE}"
            echo "$CONFIG_NAME:$CONFIG_PATH:$CONFIG_PATH" >> $CD/configs.txt
            # sed -i "s|$(echo $HOME)|\$HOME|g" $CD/configs.txt
            sort $CD/configs.txt -o $CD/configs.txt
            cp -r $CONFIG_PATH $COPY_LOCATION
            configure_rofi
        fi
    else
        echo -e "${GREEN}[i] Adding config.${WHITE}"
        echo "$CONFIG_NAME:$CONFIG_PATH:$CONFIG_PATH" >> $CD/configs.txt
        # sed -i "s|$(echo $HOME)|\$HOME|g" $CD/configs.txt
        sort $CD/configs.txt -o $CD/configs.txt
        cp $CONFIG_PATH $COPY_LOCATION
        configure_rofi
    fi
}

main
