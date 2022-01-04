#!/usr/bin/env bash
power_off="⏻ Power Off"
reboot="⭘ Reboot"
log_out=" Logout"
lock=" Lock"
opts="$lock\n$power_off\n$reboot\n$log_out"
ch="$(echo -e "$opts" | rofi -dmenu)"
case $ch in
    "${lock}")
	    exec bash -c "${HOME}/.bin/power/lockscreen.sh"
	    ;;
    "${power_off}")
	    loginctl poweroff
	;;
    "${reboot}")
	    loginctl reboot
	;;
    "${log_out}")
        MSG_PROG="i3-msg"
        [[ "${XDG_SESSION_TYPE}" == "wayland" ]] && MSG_PROG="swaymsg"
        "${MSG_PROG}" exit
        ;;
esac

