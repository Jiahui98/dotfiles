#!/bin/sh

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

[ -f ~/.xprofile ] && . ~/.xprofile

# set the default resolution for all screens
default_resolution='1920x1080'
xrandr -q | grep -E ' connected' | awk '{print $1}' | while read line; do
	xrandr --output $line --mode $default_resolution
done

# Decrease key repeat delay to 300ms and increase key repeat rate to 50 per second.
xset r rate 300 50

# set the background
~/.fehbg &

# disable beep sound
xset -b

#
hsetroot -solid "#000000"
(sleep 1 && xcompmgr -c -t-5 -l-5 -r4.2 -o.55) &

# status bar
~/.scripts/status.sh >/dev/null &

# restart dwm without logging out applications
exec ~/.scripts/startdwm #exec dwm
