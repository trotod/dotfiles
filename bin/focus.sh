#!/bin/sh
#
# Focuses a window.
# Usage: focus.sh <prev|next|wid>

cur=$(pfw)

case $1 in
  next) wid=$(lsw | grep -A1 "$cur" | grep -v "$cur" || lsw | head -n1) ;;
  prev) wid=$(lsw | grep -B1 "$cur" | grep -v "$cur" || lsw | tail -n1) ;;
  0x*) wattr "$1" && wid=$1 ;;
esac

# Move mouse cursor to center if there are no windows to focus.
if [ -z "$wid" ]; then
  read -r w h << EOF
  $(wattr wh "$(lsw -r)")
EOF
  wmp -a $((w/2)) $((h/2))
  exit
fi

wtf "$wid"

read -r x y w h << EOF
$(wattr xywh "$wid")
EOF

wmp -a "$x" "$y"
wmp -r $((w-1)) $((h-1))
