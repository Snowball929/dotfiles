#! /usr/bin/bash
if [[ $(hyprctl activeworkspace) == *dwindle* ]]; then
	hyprctl --batch "keyword misc:animate_manual_resizes true ; dispatch resizeactive -200 0 ; keyword misc:animate_manual_resizes false"
else
	hyprctl --batch "keyword misc:animate_manual_resizes true ; dispatch layoutmsg colresize -0.1 ; keyword misc:animate_manual_resizes false"
fi
