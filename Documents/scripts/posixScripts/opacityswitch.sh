#! /bin/sh
ws=$(hyprctl -j activeworkspace | jq -r '.id')
rule="hl.window_rule({  \n  name = \"windowrule-opacity.sh\", \n  opacity = [=[1 override 1 override 1.0 override]=], \n  match = {workspace = $ws}, \n})"

current=$(cat ~/.config/hypr/modules/opacity.lua)
ws_old=$(cat ~/.config/hypr/modules/ws_old.txt)
if [ "$ws" != "$ws_old" ]; then #checks if the current workspace is not equal to the previously modified workspace 
	printf "$rule" > ~/.config/hypr/modules/opacity.lua
    echo "$ws" > ~/.config/hypr/modules/ws_old.txt
elif [ -z "$current" ]; then
    printf "$rule" > ~/.config/hypr/modules/opacity.lua
    echo "$ws" > ~/.config/hypr/modules/ws_old.txt
else
    echo "" > ~/.config/hypr/modules/opacity.lua
fi
