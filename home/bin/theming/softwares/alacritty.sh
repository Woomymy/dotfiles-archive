#!/usr/bin/env bash

setup_theme() {
	source "${HOME}/bin/lib/colors.sh"
	get_color "${1}"
	TPL="${HOME}/bin/theming/templates/alacritty.yml"
	if [[ ! -f "${TPL}" ]]
	then 
    		echo "${TPL} not found!"
    		exit 1
	fi
	TMP_TPL="/tmp/alacritty.yml"
	cp "${TPL}" "${TMP_TPL}"
	sed -i "s/\@CURSOR_COLOR\@/${COLOR}/g" "${TMP_TPL}"
	cp "${TMP_TPL}" "${HOME}/.config/alacritty/alacritty.yml"
}
