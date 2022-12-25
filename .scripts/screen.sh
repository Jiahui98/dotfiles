 #!/bin/bash

## Use dmenu to configure your laptop's display output.
## simply switch "eDP-1" and "HDMI-1" for whatever xrandr likes to call your screens and you should be good to go.

CHOICES='hdmi2 only\nedp1 only\nleft extend\nright extend' # Separate each display option with \n
DMENU='dmenu -p Display -fn --fixed-bold-r-normal--16-----*-iso10646-1'

choice=$(echo -e "$CHOICES" | $DMENU)

case "$choice" in
"left extend") xrandr --output eDP-1 --mode 1920x1080 && sleep 3 && xrandr --output HDMI-1 --auto --left-of eDP-1 && sleep 3
;;
"right extend") xrandr --output eDP-1 --mode 1920x1080 && sleep 3 &&  xrandr --output HDMI-1 --auto --right-of eDP-1 && sleep 3
;;
"edp1 only") xrandr --output eDP-1 --mode 1920x1080 && sleep 3 && xrandr --output HDMI-1 --off
;;
"hdmi2 only") xrandr --output HDMI-1 --auto && sleep 3 && xrandr --output eDP-1 --off
esac
