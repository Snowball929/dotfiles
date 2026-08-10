#!/usr/bin/env bash

# Current Theme ||||||||||||| Style-5 imports colors.rasi which imports nord.rasi which is my system wide colours
# Current Theme ||||||||||||| Style-5 imports colors.rasi which imports nord.rasi which is my system wide colours
# Current Theme ||||||||||||| Style-5 imports colors.rasi which imports nord.rasi which is my system wide colours
dir="$HOME/.config/rofi/wallpaperSwitcher/"
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
theme='style-5'


# Rofi CMD
rofi_cmd() {
	rofi -show-icons \
		-theme-str 'window {location: center; anchor: center; fullscreen: false; width: 1400px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 6; lines: 4; flow: horizontal;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p "Uptime: $uptime" \
		//-mesg "  Lock          Reboot     Shut Down" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -hide-icons \
		-theme-str 'window {location: center; anchor: center; fullscreen: false; width: 600;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 3; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Which Monitor?' \
		-theme $HOME/.config/rofi/powermenu/type-2/${theme}.rasi
}



# Ask for confirmation
monitor_select() {
	echo -e "HDMI-A-1\nBoth\nDP-1" | confirm_cmd
}

# Pass variables to rofi dmenu
generate_entries() {
    for img in "$WALLPAPER_DIR"/*.{png,jpg,jpeg,webp,gif,mp4}; do
        [ -e "$img" ] || continue
        filename="$(basename "$img")"
        printf "%s\0icon\x1f%s\n" "$filename" "$img"
    done
}

# Execute Command
run_cmd() {	
		selected="$(monitor_select)"
		echo $selected
		echo $chosen
		if [[ "$chosen" == "" ]]; then
			#echo "exited"
			exit
		elif [[ "$selected" == "" ]]; then
			#echo "exited"
			exit
		elif [[ "$selected" == "Both" ]]; then
			#hyprctl hyprpaper wallpaper DP-1, /home/snow/Pictures/wallpapers/$chosen, cover
			#hyprctl hyprpaper wallpaper HDMI-A-1, /home/snow/Pictures/wallpapers/$chosen, cover
			awww img --resize crop --transition-type outer --transition-step 255 --transition-duration 1.2 --transition-fps 165 ~/Pictures/wallpapers/$chosen
			exit
		else
			#hyprctl hyprpaper wallpaper $selected, /home/snow/Pictures/wallpapers/$chosen, cover
			awww img --resize crop --transition-type outer --transition-step 255 --transition-duration 1.2 --transition-fps 165 -o $selected ~/Pictures/wallpapers/$chosen
			exit
		fi
}

# Actions
chosen=$(generate_entries | rofi_cmd | tr -d '\0')
if [[ "$chosen" == "" ]]; then
			#echo "exited"
			exit
else
	run_cmd --${chosen}	
fi
