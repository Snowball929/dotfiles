#!/usr/bin/env bash
# env > /tmp/freeze2.env
PATH=$PATH:/home/snow/.cargo/bin
pipe=$(mktemp -u).fifo
mkfifo "$pipe"
wayfreeze --after-freeze-timeout 100 --after-freeze-cmd "echo > $pipe" &
wayfreeze_pid=$!
read -r < "$pipe"
geometry=$(slurp -d)
if [[ -z "$geometry" ]]; then
  kill "$wayfreeze_pid" 2>/dev/null
  rm -f "$pipe"
  exit 1
fi
grim -g "$geometry" - | tee "/home/snow/Pictures/Screenshots/$(date +%Y-%m-%d_%H:%M:%S).png" | wl-copy
kill "$wayfreeze_pid" 2>/dev/null
rm -f "$pipe"
