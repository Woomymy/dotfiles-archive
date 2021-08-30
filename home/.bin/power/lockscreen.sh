#!/usr/bin/env bash

set -euo pipefail

FILE="$(mktemp -u)"

# Usage: screenshot SCREENSHOT_PATH
screenshot()
{
	SCREEN_PATH="${1}"

	maim > "${SCREEN_PATH}"
}

# Usage: apply_blur FILE
apply_blur()
{
	# Temporary file used for conversion
	TMP_FILE="$(mktemp -u)"	
	SCREENSHOT="${1}"
	
	convert "${SCREENSHOT}" -filter Gaussian -blur 0x8 "${TMP_FILE}"
	mv "${TMP_FILE}" "${SCREENSHOT}"
}

main()
{
	screenshot "${FILE}"
	apply_blur "${FILE}"
	i3lock -i "${FILE}"
}

main || notify-send -u "critical" "Failed to lock"
