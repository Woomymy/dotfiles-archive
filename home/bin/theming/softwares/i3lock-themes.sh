#!/usr/bin/env bash
setup_theme() {
	source "${HOME}/bin/lib/colors.sh"
	get_color "${1}"
	COLOR="$(echo "${COLOR}" | awk -F "#" '{print $2}')"
	echo "${COLOR}" > /tmp/i3lock_color
}
