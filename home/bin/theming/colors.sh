#!/bin/bash
source "${HOME}/bin/config/colors.sh"
OPTS=""
for COL in ${COLORS[*]}
do
	OPTS="${OPTS}${COL}\n"
done
CH="$(echo -e "$OPTS" | rofi -dmenu)"
~/bin/wm/theming.sh $CH
