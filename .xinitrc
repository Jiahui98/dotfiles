#!/bin/sh

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources


# set the default resolution for all screens
default_resolution='1920x1080'
xrandr -q | grep -E ' connected' | awk '{print $1}' | while read line; do
	xrandr --output $line --mode $default_resolution
done

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
exec ~/.scripts/startdwm
#exec dwm
