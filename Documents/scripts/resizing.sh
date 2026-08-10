#! /usr/bin/bash
if [[ $(hyprctl activeworkspace | grep -e "tiledLayout:") == tiledLayout: dwindle ]]; then
	
elif [[ $(pactl get-default-sink) == *MOTU* ]]; then
	pactl set-default-sink alsa_output.pci-0000_28_00.3.analog-stereo
else
	pactl set-default-sink alsa_output.usb-MOTU_M2_M2MA0D10QA-00.HiFi__Line__sink
fi
