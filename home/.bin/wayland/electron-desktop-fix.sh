#!/usr/bin/env bash

get_app_desktop_file() {
    for APPDIR in "/usr/share/applications"
    do
        if [[ -f "${APPDIR}/${1}.desktop" ]]
        then
            echo "${APPDIR}/${1}.desktop"
            break
        fi
    done
}

# Force `wayland` use for electron / chromium apps

FORCE_OPTIONS="--enable-features=UseOzonePlatform --ozone-platform=wayland" # Options required to force wayland support

APP="${1}" # Desktop file name

DEST_FILENAME="$(get_app_desktop_file "${APP}")"

[[ -z "${DEST_FILENAME}" ]] && {
    echo "- Application ${APP} not found!"
    exit 1
}

echo "- Found file ${DEST_FILENAME}, forcing wayland for ${APP}"

FILE_DEST="${HOME}/.local/share/applications/${APP}.desktop"

cp "${DEST_FILENAME}" "${FILE_DEST}"

# Fix: Fix when there are multiple ^Exec=.* lines (actual fix is to skip them)
EXEC_LINE="$(grep "^Exec=.*" "${FILE_DEST}" | head -n 1)"

echo "-- Found line ^Exec= line ${EXEC_LINE}"

FIXED_LINE="${EXEC_LINE} ${FORCE_OPTIONS}" # Add options to force electron support

# Use different delimiter to fix / in paths
sed -i "s|${EXEC_LINE}|${FIXED_LINE}|i" "${FILE_DEST}"

echo "-- Replaced ${EXEC_LINE} with ${FIXED_LINE}"

