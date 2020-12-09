#!/bin/bash
# Set random wallpaper
WALLPATH="$HOME/Pictures/wallpapers"
if [[ ! -d "${WALLPATH}" ]] 
then
	notify-send -u critical "WALLPAPER DIR NOT FOUND!" ${WALLPATH}
	exit 1
fi
files=($WALLPATH/*)
num=${#files[@]}
wall="${files[RANDOM % num]}"
wal -i "${wall}"
