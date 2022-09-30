#!/usr/bin/env bash

set -euo pipefail

PAL="${1}"
OUT="${HOME}/.config/eww/palette.scss"
SCSS=""

touch $OUT

exec 1>$OUT

jq -r ". | to_entries | .[].key" "${PAL}" | while read key; do
    echo "\$${key}: $(jq -r ".${key}" "${PAL}");"
done

eww reload # Ensure everything is reloaded

