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
NEW_THEME_COLOR="${COLOR}" # We need to copy $COLOR because some scripts may change its value
for SOFT in "${HOME}/bin/theming/softwares/"*
do
	unset setup_theme # Unset old functions
	source "${SOFT}"
	if [[ "$(command -v "setup_theme")" ]]
	then
		setup_theme "${NEW_THEME_COLOR}"
	else
		ERRORS+=("${SOFT} has not setup_theme function")
	fi
done
for ERR in "${ERRORS[@]}"
do
	echo -e "${ERR}" >> "${STARTUP_TEMPDIR}/errors.log"
done
