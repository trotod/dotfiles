#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb ~/.Xresources
xset +fp ~/.fonts
xset fp rehash

xsetroot -cursor_name left_ptr
hsetroot -solid \#f1f1f1
unclutter -root &
urxvtd -q -f -o
dunst &

# no screensaver
xset s noblank
xset s off

# wallpaper
if [ -f ~/.wallpaper ]; then
  hsetroot -fill ~/.wallpaper
fi

# ibus
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
fcitx

# panel
panel &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sxhkd &
exec openbox
