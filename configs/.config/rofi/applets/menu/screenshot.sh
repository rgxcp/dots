#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
window=""
area=""

# Variable passed to rofi
options="$screen\n$window\n$area"

chosen="$(echo -e "$options" | $rofi_command -p 'App : scrot' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot 'Screenshot_%Y-%m-%d-%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/Screenshots/'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/Screenshots/'
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			scrot -s 'Screenshot_%Y-%m-%d-%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/Screenshots/'
		else
			msg
		fi
        ;;
esac

