#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

xrandr --output eDP-1 --mode 1920x1080 &
~/.fehbg &
#[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
(sleep 2 && xcompmgr -c) &

dwmstatus 2>&1 >/dev/null &
exec dwm
