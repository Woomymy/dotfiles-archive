#!/usr/bin/env bash

set -euo pipefail

SCH="${1}"
OUT="${HOME}/.config/eww/scheme.scss"
SCSS=""

touch $OUT

exec 1>$OUT

jq -r ". | to_entries | .[].key" "${SCH}" | while read key; do
    echo "\$${key}: $(jq -r ".${key}" "${SCH}");"
done

eww reload # Ensure everything is reloaded

