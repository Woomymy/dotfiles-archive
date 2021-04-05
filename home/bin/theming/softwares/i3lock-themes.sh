#!/usr/bin/env bash
[[ "$(command -v convert)" ]] || exit 1
WALL="${HOME}/wallpapers/${1}.jpg"
[[ -f "${WALL}" ]] || exit 1
source "${HOME}/bin/lib/colors.sh"
get_color "${1}"
COLOR="$(echo "${COLOR}" | cut -d "#" -f 2)"
echo "${COLOR}" > /tmp/i3lock_color
