#! /usr/bin/bash
if [[ $(pactl list short sources) == *wivrn* ]]; then
  pactl set-default-sink wivrn.sink
elif [[ $(pactl get-default-sink) == *MOTU* ]]; then
  pactl set-default-sink alsa_output.pci-0000_0e_00.6.analog-stereo
  echo "test"
else
  pactl set-default-sink alsa_output.usb-MOTU_M2_M2MA0D10QA-00.HiFi__Line__sink
  echo "fail"
fi
