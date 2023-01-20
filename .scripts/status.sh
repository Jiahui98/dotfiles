#/bin/sh

# My status bar

getcpuload() {
	cache=/tmp/cpubarscache
	# id total idle
	stats=$(awk '/cpu[0-9]+/ {printf "%d %d %d\n", substr($1,4), ($2 + $3 + $4 + $5), $5 }' /proc/stat)
	[ ! -f $cache ] && echo "$stats" > "$cache"
	old=$(cat "$cache")
	printf "🪨"
	echo "$stats" | while read -r row; do
		id=${row%% *}
		rest=${row#* }
		total=${rest%% *}
		idle=${rest##* }
		case "$(echo "$old" | awk '{if ($1 == id)
			printf "%d\n", (1 - (idle - $3)  / (total - $2))*100 /12.5}' \
			id="$id" total="$total" idle="$idle")" in
			"0") printf "▁";;
			"1") printf "▂";;
			"2") printf "▃";;
			"3") printf "▄";;
			"4") printf "▅";;
			"5") printf "▆";;
			"6") printf "▇";;
			"7") printf "█";;
			"8") printf "█";;
		esac
	done; printf "\\n"
	echo "$stats" > "$cache"
}

getcputemp () {
	echo -n $(sensors | awk '/(CPU|Core 0)/ {print "🌡" $3}')
}


getvolumelevel () {
	vol=$(pactl list sinks | grep '^[[:space:]]Volume:' |\
		head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
	case 1 in
		$((vol >= 70)) ) icon="🔊" ;;
		$((vol >= 30)) ) icon="🔉" ;;
		$((vol >= 1)) ) icon="🔈" ;;
		* ) echo -n 🔇 && exit ;;
	esac
	echo -n "$icon$vol%"
}

getwifi () {
	# Show wifi 📶 and percent strength or 📡 if none.
	# Show 🌐 if connected to ethernet or ❎ if none.
	# Show 🔒 if a vpn connection is active
	if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
		wifiicon="$(awk '/^\s*w/ { print "📶", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
	elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
		grep -xq '0x1003' /sys/class/net/w*/flags && wifiicon="📡 " || wifiicon="❌ "
	fi
	#
	echo -n "$wifiicon"\
		#"$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate)"
		#"$(sed "s/.*/🔒/" /sys/class/net/tun*/operstate 2>/dev/null)"
}

# get time date
getdate () {
	echo -n "⏰ $(date '+%Y-%m-%d %H:%M:%S')"
}

# get battery status
getbattery () {
	for battery in /sys/class/power_supply/BAT?*; do
		# If non-first battery, print a space separator.
		[ -n "${capacity+x}" ] && echo -n ' '
		# Sets up the status and capacity
		case "$(cat "$battery/status" 2>&1)" in
			"Full")
				status="⚡" ;;
			"Discharging")
				status="🔋" ;;
			"Charging")
				status="🔌" ;;
			"Not charging")
				status="🛑" ;;
			"Unknown")
				status="♻️" ;;
			*) exit 1 ;;
		esac
		capacity="$(cat "$battery/capacity" 2>&1)"
		# Will make a warn variable if discharging and low
		[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
		# Prints the info
		echo -n "$status""$warn""$capacity"%; unset warn
	done
}

while :; do
	xsetroot -name "$(getcpuload) | $(getcputemp) | $(getvolumelevel) | $(getwifi) | $(getbattery) | $(getdate)"
	sleep 1
done
