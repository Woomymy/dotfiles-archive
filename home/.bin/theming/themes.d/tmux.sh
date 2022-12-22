#!/usr/bin/env bash

set -euo pipefail

PAL="${2}"
DEST="${HOME}/.tmux.palette"

echo "" > "${DEST}"

jq -r ". | to_entries | .[].key" "${PAL}" | while read key; do
    echo "$key=\"$(jq -r ".${key}" "${PAL}")\"" >> "${DEST}"
done

# For some reason TMUX needs to be sourced 2 times
tmux -S "/tmp/tmux-$(id -u)/default" source-file "${HOME}/.tmux.conf" || true
tmux -S "/tmp/tmux-$(id -u)/default" source-file "${HOME}/.tmux.conf" || true

