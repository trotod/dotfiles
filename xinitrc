#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb ~/.Xresources
xset +fp ~/.local/share/fonts
xset fp rehash

xsetroot -cursor_name left_ptr
hsetroot -fill ~/Pictures/wallpapers/deer.jpg
unclutter -root &
urxvtd -q -f -o

# no screensaver
xset s noblank
xset s off

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sxhkd &
exec $HOME/.config/bspwm/wm
