#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css $HOME/.config/waybar/desktopclock/config $HOME/.config/waybar/desktopclock/style.css"

trap "killall waybar" EXIT

while true; do
	waybar -c $HOME/.config/waybar/config -s $HOME/.config/waybar/style.css &
	waybar -c $HOME/.config/waybar/desktopclock/config -s $HOME/.config/waybar/desktopclock/style.css
	killall waybar
done
