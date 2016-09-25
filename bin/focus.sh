#!/bin/sh
#
# Focuses a window.
# Usage: focus.sh <prev|next|wid>
# Dependencies: wmutils, xwinfo

cur=$(pfw)

# TODO: store focus history or something...
# This is just a hack to get a semblance of ordering.
list_windows() {
  wmctrl -l | cut -d' ' -f1 | while read -r wid; do
    wattr m "$wid" && printf "%s\n" "$wid"
  done
}

# TODO: store focus history or something...
case $1 in
  next) wid=$(list_windows | grep -A1 "$cur" | grep -v "$cur" || list_windows | head -1) ;;
  prev) wid=$(list_windows | grep -B1 "$cur" | grep -v "$cur" || list_windows | tail -1) ;;
  0x*) wattr "$1" && wid=$1 ;;
esac

if [ -z "$(lsw)" ]; then
  read -r w h << EOF
  $(wattr wh "$(lsw -r)")
EOF
  wmp -a $((w/2)) $((h/2))
  exit
elif [ "$wid" = "$cur" ]; then
  exit
fi

wtf "$wid"

read -r x y w h << EOF
$(wattr xywh "$wid")
EOF

case $(xwinfo -c "$wid") in
  chromium)
    chwso -l "$wid"
    restack
    wmp -a $((x + w)) $((y + h))
    ;;
  *)
    chwso -r "$wid"
    wmp -a $((x + w / 2)) $((y + h / 2))
    ;;
esac
