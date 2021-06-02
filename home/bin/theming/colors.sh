#!/bin/bash
source "${HOME}/bin/config/colors.sh"
OPTS=""
for COL in ${COLORS[*]}
do
	OPTS="${OPTS}${COL}\n"
done
CH="$(echo -e "$OPTS" | rofi -dmenu)"
[[ -z "${CH}" ]] && exit # Make sure we won't use a random color
~/bin/wm/theming.sh $CH
