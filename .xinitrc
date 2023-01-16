#!/bin/sh

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

# my default resolution
xrandr --output eDP-1 --mode 1920x1080 &

# set the background
~/.fehbg &


[ -f ~/.xprofile ] && . ~/.xprofile

(sleep 2 && xcompmgr -c) &

# status bar
~/.scripts/status.sh >/dev/null &

# restart dwm without logging out applications
exec ~/.scripts/startdwm
