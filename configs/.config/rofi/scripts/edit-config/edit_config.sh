#!/bin/bash

ROFI="rofi -theme .config/rofi/scripts/edit-config/edit_config.rasi"

# Options
alacritty="Alacritty"
better_lock_screen="Better-Lock-Screen"
dolphin="Dolphin"
dunst="Dunst"
gtk_2="GTK-2"
gtk_3="GTK-3"
i3="i3"
neofetch="Neofetch"
network_manager="Network-Manager"
pcmanfm="PCManFM"
picom="Picom"
polybar="Polybar"
qbittorrent="qBittorrent"
rofi="Rofi"
starship="Starship"
tmux="Tmux"
vim="Vim"
xresources="Xresources"
zsh="Zsh"

OPTIONS=(
	$alacritty
	$better_lock_screen
	$dolphin
	$dunst
	$gtk_2
	$gtk_3
	$i3
	$neofetch
	$network_manager
	$pcmanfm
	$picom
	$polybar
	$qbittorrent
	$rofi
	$starship
	$tmux
	$vim
	$xresources
	$zsh
)

CHOSEN="$(printf "%s\n" "${OPTIONS[@]}" | $ROFI -p "Edit Config" -dmenu -selected-row 0)"
case $CHOSEN in
	$alacritty) code /home/northern/.config/alacritty/alacritty.yml;;
	$better_lock_screen) code /home/northern/.config/betterlockscreenrc;;
	$dolphin) code /home/northern/.config/dolphinrc;;
	$dunst) code /home/northern/.config/dunst/dunstrc;;
	$gtk_2) code /home/northern/.config/gtk-2.0/gtkfilechooser.ini;;
	$gtk_3) code /home/northern/.config/gtk-3.0/settings.ini;;
	$i3) code /home/northern/.config/i3/config;;
	$neofetch) code /home/northern/.config/neofetch/config.conf;;
	$network_manager) code /home/northern/.config/networkmanager-dmenu/config.ini;;
	$pcmanfm) code /home/northern/.config/pcmanfm/default/pcmanfm.conf;;
	$picom) code /home/northern/.config/picom/picom.conf;;
	$polybar) code /home/northern/.config/polybar;;
	$qbittorrent) code /home/northern/.config/qBittorrent/qBittorrent.conf;;
	$rofi) code /home/northern/.config/rofi;;
	$starship) code /home/northern/.config/starship.toml;;
	$tmux) code /home/northern/.tmux.conf;;
	$vim) code /home/northern/.config/nvim/init.vim;;
	$xresources) code /home/northern/.Xresources;;
	$zsh) code /home/northern/.zshrc;;
esac
