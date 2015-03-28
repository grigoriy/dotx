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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
unclutter -grab &
setxkbmap -option caps:swapescape
xflux -l 59.87 -g 30.33 &
xbindkeys &
xscreensaver &
xss-lock -- xscreensaver-command -lock &
exec xmonad
