#!/usr/bin/env bash

set -euo pipefail

FILE="$(mktemp -u)"
TEXT="$(lsb_release -d | awk -F ":	" '{print $2}')"

# Usage: screenshot SCREENSHOT_PATH
screenshot()
{
	SCREEN_PATH="${1}"
    if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]
    then
        grim -o "eDP-1" "${SCREEN_PATH}"
    else
	    maim > "${SCREEN_PATH}"
    fi
}

# Usage: apply_blur FILE
apply_blur()
{
	# Temporary file used for conversion
	TMP_FILE="$(mktemp -u)"	
	SCREENSHOT="${1}"
	
	convert "${SCREENSHOT}" -filter Gaussian -blur 0x8 "${TMP_FILE}"
	mv "${TMP_FILE}" "${SCREENSHOT}"
}

add_text()
{
	TMP_FILE="$(mktemp -u)"
	SCREENSHOT="${1}"
	convert -pointsize 72 -fill white -draw "text 50,1000 '${TEXT}'" "${SCREENSHOT}" "${TMP_FILE}"
	mv "${TMP_FILE}" "${SCREENSHOT}"
}

main()
{
	screenshot "${FILE}"
	apply_blur "${FILE}"
	add_text "${FILE}"
    if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]
    then
        swaylock -i "${FILE}"
    else
        i3lock -i "${FILE}"
    fi
}

main || {
	notify-send -u "critical" "Failed to lock"
}
