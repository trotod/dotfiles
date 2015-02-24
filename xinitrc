#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb ~/.Xresources
xset +fp ~/.fonts
xset fp rehash

xsetroot -cursor_name left_ptr
hsetroot -solid \#212121
unclutter -root &
urxvtd -q -f -o
dunst &

# no screensaver
xset s noblank
xset s off

# ibus
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
fcitx

# bspwm
export PANEL_FIFO=/tmp/panel.fifo
export BSPWM_TREE=/tmp/bspwm.tree
export BSPWM_HISTORY=/tmp/bspwm.history
export BSPWM_STACK=/tmp/bspwm.stack

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

sxhkd &
exec $HOME/.config/bspwm/wm
