#!/usr/bin/env bash

set -euo pipefail

PAL="${1}"
OUT="${HOME}/.config/rofi/palette.rasi"
touch $OUT
# Redirect all our stdout
exec 1>$OUT

echo "* {"
jq -r ". | to_entries | .[].key" "${PAL}" | while read key; do
    # Don't inform rofi about scheme type
    if [[ "${key}" != "type" ]]
    then
        echo "    ${key}: $(jq -r ".${key}" "${PAL}");"
    fi
done
echo "}"

