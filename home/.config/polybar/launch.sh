#!/usr/bin/env bash
if [[ "$(ps -ef | grep -i polybar | grep -v grep)" ]]
then
	killall polybar 
	sleep 1
fi
WALLPATH="$HOME/.config/polybar/colors"
FILES=($WALLPATH/*.ini)
NUM=${#FILES[@]}
COLOR_FILE="${FILES[RANDOM % NUM]}"
cp $COLOR_FILE $HOME/.config/polybar/colors.ini
BARS=(top)
for BAR in ${BARS[*]}
do
	nohup polybar -c "$HOME/.config/polybar/config.ini" $BAR > /dev/null &
done

