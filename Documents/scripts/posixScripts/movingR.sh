#! /bin/sh
if [[ $(hyprctl activeworkspace) == *dwindle* ]]; then
	hyprctl "dispatch movefocus r"
else
	hyprctl "dispatch layoutmsg focus right"
fi
