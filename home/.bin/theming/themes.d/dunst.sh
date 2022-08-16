#!/usr/bin/env bash

set -euo pipefail

PAL="${1}"
DEST="${HOME}/.config/dunst/dunstrc"
TLP="${DEST}.template"

cp "${TLP}" "${DEST}"

jq -r ". | to_entries | .[].key" "${PAL}" | while read key; do
    sed -i "s/{${key}}/$(jq -r ".${key}" "${PAL}")/gim" "${DEST}"
done

