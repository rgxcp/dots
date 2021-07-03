#!/usr/bin/env bash

dir="~/.config/polybar/colorblocks/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
alacritty="Alacritty"
dunst="Dunst"
gtk2="GTK 2.0"
gtk3="GTK 3.0"
neofetch="Neofetch"
pcmanfm="PCManFM"
picom="Picom"
polybar="Polybar"
qtile="Qtile"
rofi="Rofi"
betterlockscreen="Better Lock Screen"
dolphin="Dolphin"
starship="Starship"
xresources="Xresources"
zsh="Zsh"

# Variable passed to rofi
options="$alacritty\n$dunst\n$gtk2\n$gtk3\n$neofetch\n$pcmanfm\n$picom\n$polybar\n$qtile\n$rofi\n$betterlockscreen\n$dolphin\n$starship\n$xresources\n$zsh"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $alacritty) code $HOME/.config/alacritty;;
    $dunst) code $HOME/.config/dunst;;
    $gtk2) code $HOME/.config/gtk-2.0;;
    $gtk3) code $HOME/.config/gtk-3.0;;
    $neofetch) code $HOME/.config/neofetch;;
    $pcmanfm) code $HOME/.config/pcmanfm;;
    $picom) code $HOME/.config/picom;;
    $polybar) code $HOME/.config/polybar;;
    $qtile) code $HOME/.config/qtile;;
    $rofi) code $HOME/.config/rofi;;
    $betterlockscreen) code $HOME/.config/betterlockscreen;;
    $dolphin) code $HOME/.config/dolphinrc;;
    $starship) code $HOME/.config/starship.toml;;
    $xresources) code $HOME/.Xresources;;
    $zsh) code $HOME/.zshrc;;
esac
