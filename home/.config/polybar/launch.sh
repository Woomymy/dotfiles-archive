#!/usr/bin/env bash
if [[ "$(ps -ef | grep -i polybar | grep -v grep)" ]]
then
	killall polybar 
	sleep 1
fi
BARS=(top)
for BAR in ${BARS[*]}
do
	nohup polybar -c "$HOME/.config/polybar/config.ini" $BAR > /dev/null &
done

