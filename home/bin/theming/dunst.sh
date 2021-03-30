#!/usr/bin/env bash
source "${HOME}/bin/lib/colors.sh"
get_color "${1}"
TPL="${HOME}/bin/theming/templates/dunstrc"
if [[ ! -f "${TPL}" ]]
then 
    echo "${TPL} not found!"
    exit 1
fi
TMP_TPL="/tmp/dunstrc"
cp "${TPL}" "${TMP_TPL}"
sed -i "s/\@FRAME_COLOR\@/${COLOR}/g" "${TMP_TPL}"
cp "${TMP_TPL}" "${HOME}/.config/dunst/dunstrc"
