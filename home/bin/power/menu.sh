#!/bin/bash
power_off=" Power Off"
reboot="⭘ Reboot"
log_out=" Logout"
opts="$power_off\n$reboot\n$log_out"

ch="$(echo -e "$opts" | rofi -dmenu -selected-row 2)"
case $ch in
    $power_off)
	loginctl poweroff
	;;
    $reboot)
        loginctl reboot
	;;
    $log_out)
        i3-msg exit
        ;;
esac

