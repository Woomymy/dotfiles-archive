#!/usr/bin/env bash
if [[ ! -d "$HOME/wallpapers" ]]
then
    exit 1
fi
COLORS=(blue darkblue darkblue-alt green grey lightblue lightgreen lightturquoise orange pink purple red turquoise yellow)
NUM=${#COLORS[@]}
COLOR="${COLORS[RANDOM % NUM]}"
COLOR="blue"
if [[ ! -f "$HOME/wallpapers/${COLOR}.jpg" ]]
then
    exit 1
fi
feh --bg-fill "${HOME}/wallpapers/${COLOR}.jpg"
$HOME/.config/polybar/launch.sh $COLOR