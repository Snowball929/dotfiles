#!/bin/bash

ws=$(hyprctl -j activeworkspace | jq -r '.id')
current=$(hyprctl -j activeworkspace | jq -r '.tiledLayout')
if [ "$current" = "scrolling" ]; then
    hyprctl eval "hl.workspace_rule({ workspace = \"$ws\", layout = \"dwindle\" })"
else
    hyprctl eval "hl.workspace_rule({ workspace = \"$ws\", layout = \"scrolling\" })"
fi
