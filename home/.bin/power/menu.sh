#!/usr/bin/env bash
power_off="⏻ Power Off"
reboot="⭘ Reboot"
log_out=" Logout"
lock=" Lock"
opts="$lock\n$power_off\n$reboot\n$log_out"
ch="$(echo -e "$opts" | rofi -dmenu)"
case $ch in
    "${lock}")
	    exec ~/.bin/menu/lockscreen.sh
	    ;;
    "${power_off}")
	    loginctl poweroff
	;;
    "${reboot}")
	    loginctl reboot
	;;
    "${log_out}")
        i3-msg exit
        ;;
esac

