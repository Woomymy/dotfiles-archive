#!/bin/bash
# Set random wallpaper
WALLPATH="$HOME/Pictures/wallpapers"
files=($WALLPATH/*)
num=${#files[@]}
wall="${files[RANDOM % num]}"
feh --bg-fill "${wall}"
