#!/usr/bin/env bash
source "${HOME}/bin/lib/colors.sh"
get_color "${1}"
TPL="${HOME}/bin/theming/templates/theme.rasi"
if [[ ! -f "${TPL}" ]]
then 
    echo "${TPL} not found!"
    exit 1
fi
TMP_TPL="/tmp/theme.rasi"
cp "${TPL}" "${TMP_TPL}"
sed -i "s/\@FG\@/${COLOR}/g" "${TMP_TPL}"
sed -i "s/\@BG\@/${BG}/g" "${TMP_TPL}"
cp "${TMP_TPL}" "${HOME}/.config/rofi/theme.rasi"
