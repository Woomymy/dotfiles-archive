#!/usr/bin/env bash
if [[ ! -d "$HOME/wallpapers" ]]
then
    exit 1
fi
COLOR=""
if [[ -f "${HOME}/wallpapers/${1}.jpg" ]]
then
    COLOR=$1
else 
    COLORS=(blue darkblue green lightblue lightgreen lightturquoise orange pink purple red turquoise yellow)
    NUM=${#COLORS[@]}
    COLOR="${COLORS[RANDOM % NUM]}"
fi
if [[ ! -f "$HOME/wallpapers/${COLOR}.jpg" ]]
then
    exit 1
fi
feh --bg-fill "${HOME}/wallpapers/${COLOR}.jpg"
$HOME/bin/theming/alacritty.sh $COLOR
$HOME/.config/polybar/launch.sh $COLOR
$HOME/bin/theming/i3lock-themes.sh $COLOR