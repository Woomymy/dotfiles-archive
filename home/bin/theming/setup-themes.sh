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
    COLORS=(blue darkblue darkblue-alt green grey lightblue lightgreen lightturquoise orange pink purple red turquoise yellow)
    NUM=${#COLORS[@]}
    COLOR="${COLORS[RANDOM % NUM]}"
fi
if [[ ! -f "$HOME/wallpapers/${COLOR}.jpg" ]]
then
    exit 1
fi
feh --bg-fill "${HOME}/wallpapers/${COLOR}.jpg"
$HOME/.config/polybar/launch.sh $COLOR