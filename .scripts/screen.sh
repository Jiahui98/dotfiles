 #!/bin/bash

## Use dmenu to configure your laptop's display output.
## simply switch "eDP-1" and "HDMI-2" for whatever xrandr likes to call your screens and you should be good to go.

CHOICES='eDP-1 only\nHDMI-2 only\nleft extend\nright extend' # Separate each display option with \n
DMENU='dmenu -p Display -fn --fixed-bold-r-normal--16-----*-iso10646-1'

choice=$(echo -e "$CHOICES" | $DMENU)

case "$choice" in
	"eDP-1 only")
		xrandr --output eDP-1 --mode 1920x1080 && sleep 3 && xrandr --output HDMI-2 --off
	;;
	"HDMI-2 only")
		xrandr --output HDMI-2 --auto && sleep 3 && xrandr --output eDP-1 --off
	;;
	"left extend")
		xrandr --output eDP-1 --mode 1920x1080 && sleep 3 \
		&& xrandr --output HDMI-2 --auto --left-of eDP-1 && sleep 3
	;;
	"right extend")
		xrandr --output eDP-1 --mode 1920x1080 && sleep 3 \
		&&  xrandr --output HDMI-2 --auto --right-of eDP-1 && sleep 3
esac
