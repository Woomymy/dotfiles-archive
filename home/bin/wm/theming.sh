#!/usr/bin/env bash
[[ -d "${HOME}/wallpapers" ]] || exit 1
[[ -f "${HOME}/bin/config/colors.sh" ]] || { 
	echo "Color configs not found!"
	exit 1
}
# shellcheck disable=SC1090
source "${HOME}/bin/config/colors.sh"
source "/tmp/${USER}_startup.sh"
ERRORS=()
COLOR=""
if [[ -f "${HOME}/wallpapers/${1}.jpg" ]]
then
	COLOR="${1}"
else

	NUM=${#COLORS[@]}
	COLOR="${COLORS[RANDOM % NUM]}"
fi
if [[ ! -f "${HOME}/wallpapers/${COLOR}.jpg" ]]
then
	exit 1
fi
if [[ "$(command -v "feh")" ]]
then
	feh --bg-fill "${HOME}/wallpapers/${COLOR}.jpg"
else
	ERRORS+=("feh not found!")
fi
for ERR in ${ERRORS[*]}
do
    echo "${ERR}" >> "${STARTUP_TEMPDIR}/errors.log"
done
"${HOME}/bin/theming/alacritty.sh" "${COLOR}"
"${HOME}/bin/theming/dunst.sh" "${COLOR}"
"${HOME}/.config/polybar/launch.sh" "${COLOR}"
"${HOME}/bin/theming/i3lock-themes.sh" "${COLOR}"
