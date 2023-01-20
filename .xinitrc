#!/bin/sh

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

# my default resolution
#xrandr --output eDP-1 --mode 1920x1080 &

# set the background
~/.fehbg &

[ -f ~/.xprofile ] && . ~/.xprofile

# disable beep sound
xset -b

(sleep 2 && xcompmgr -c) &

# status bar
~/.scripts/status.sh >/dev/null &

# Decrease key repeat delay to 300ms and increase key repeat rate to 50 per second.
xset r rate 300 50

# restart dwm without logging out applications
#exec ~/.scripts/startdwm
exec dwm
