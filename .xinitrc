#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

###############
# X11 settings
##############
xset -b
# xrandr --output LVDS1 --auto --primary --output VGA1 --auto --right-of LVDS1
# setxkbmap -option ctrl:nocaps
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

################
# merger .Xresources | or use .Xdefaults
################
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

################
# input method
################
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon -rxd
# export XMODIFIERS="@im=fcitx"
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# fcitx &

################
# applications
################
# dropboxd &
# conky &

wmname LG3D
exec awesome
# exec i3
# exec openbox-session
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
