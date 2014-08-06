#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

################
# merger .Xresources | or use .Xdefaults
################
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

################
# input method
################
# export XMODIFIERS=@im=ibus
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -rxd
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
fcitx &

################
# applications
################
dropboxd &
# conky &

xset -b
xrandr --output LVDS1 --auto --primary --output VGA1 --auto --right-of LVDS1

exec awesome
# exec i3
# exec openbox-session
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

exec xmodmap ~/.xmodmaprc
