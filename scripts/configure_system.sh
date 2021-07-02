#!/bin/bash

RED="\e[31m"
WHITE="\e[0m"
PD=$HOME/Projects/dots/scripts

configure_yay () {
    echo -e "${GREEN}INFO: Configuring Yay.${WHITE}"
    cd $HOME/Projects
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    yay -S betterlockscreen polybar spotify ttf-iosevka visual-studio-code-bin
}

configure_dual_boot_and_grub_theme () {
    echo -e "${GREEN}INFO: Configuring dual boot & GRUB theme.${WHITE}"
    lsblk
    read -p "Windows drive boot block: " WINDOWS_DRIVE_BOOT_BLOCK
    sudo mount $WINDOWS_DRIVE_BOOT_BLOCK /mnt
    cd $HOME/Projects
    git clone https://github.com/vinceliuice/grub2-themes.git
    cd grub2-themes
    sudo ./install.sh -t vimix -i white
    cd ..
    rm -rf grub2-themes
}

configure_dual_boot_time () {
    echo -e "${GREEN}INFO: Configuring dual boot time.${WHITE}"
    timedatectl set-local-rtc 1 --adjust-system-clock
}

configure_git () {
    echo -e "${GREEN}INFO: Configuring Git.${WHITE}"
    read -p "User name: " USER_NAME
    git config --global user.name "$USER_NAME"
    read -p "User email: " USER_EMAIL
    git config --global user.email $USER_EMAIL
}

configure_display_manager () {
    echo -e "${GREEN}INFO: Configuring display manager.${WHITE}"
    sudo cp $HOME/Pictures/Wallpaper.jpg /usr/share/pixmaps
}

configure_shell () {
    echo -e "${GREEN}INFO: Configuring shell.${WHITE}"
    chsh -l
    read -p "Shell path: " SHELL_PATH
    chsh -s $SHELL_PATH
}

configure_lock_screen () {
    echo -e "${GREEN}INFO: Configuring lock screen.${WHITE}"
    betterlockscreen -u $HOME/Pictures/Wallpaper.jpg
}

configure_all () {
    read -p "Are you sure to configure all option? [Y/n]: " CHOICE
    if [[ $CHOICE == "y" || $CHOICE == "Y" ]]
    then
        configure_yay
        echo ""
        configure_dual_boot_and_grub_theme
        echo ""
        configure_dual_boot_time
        echo ""
        configure_git
        echo ""
        configure_display_manager
        echo ""
        configure_shell
        echo ""
        configure_lock_screen
        echo ""
        $PD/replace_config.sh
    fi
}

invalid_option () {
    echo -e "${RED}ERROR: Invalid option.${WHITE}"
    echo ""
    $PD/configure_system.sh
}

main () {
    echo "1. Configure Yay"
    echo "2. Configure Dual Boot & GRUB Theme"
    echo "3. Configure Dual Boot Time"
    echo "4. Configure Git"
    echo "5. Configure Display Manager"
    echo "6. Configure Shell"
    echo "7. Configure Lock Screen"
    read -p "Enter your choice: " CHOICE
    echo ""

    case $CHOICE in
        "1") configure_yay;;
        "2") configure_dual_boot_and_grub_theme;;
        "3") configure_dual_boot_time;;
        "4") configure_git;;
        "5") configure_display_manager;;
        "6") configure_shell;;
        "7") configure_lock_screen;;
        "") configure_all;;
        *) invalid_option;;
    esac
}

main
