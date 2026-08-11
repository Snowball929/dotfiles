#! /bin/sh
if [[ $(hyprctl activeworkspace) == *dwindle* ]]; then
	hyprctl "dispatch movefocus l"
else
	hyprctl "dispatch layoutmsg focus left"
fi
