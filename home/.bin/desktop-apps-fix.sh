#!/usr/bin/env bash

set -e # Stop on errors

FORCE="false"

[[ "${1}" == "--force" ]] && FORCE="true"

LAST_SESSION_FILE="${HOME}/.cache/last-xdg-session-type"

if [[ -f "${LAST_SESSION_FILE}" ]]
then
    if [ "$(cat ${LAST_SESSION_FILE})" == "${XDG_SESSION_TYPE}" -a "${FORCE}" == "false" ]
    then
        exit 0 # Changes were already done at last session run
    fi
fi

echo "${XDG_SESSION_TYPE}" > "${LAST_SESSION_FILE}"

# Electron apps that require a fix
ELECTRON_APPS=(
    discord
    element-desktop
    joplin-bin
    vivaldi-stable
)

for ELECTRON_APP in ${ELECTRON_APPS[*]}
do
    echo "- Fixing electron app ${ELECTRON_APP}"
    if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]
    then
        ~/.bin/wayland/electron-desktop-fix.sh "${ELECTRON_APP}" # Add wayland electron fixes (see script for more details)
    else
        APP_DESKTOP_FILE="${HOME}/.local/share/applications/${ELECTRON_APP}.desktop"
        [[ -f "${APP_DESKTOP_FILE}" ]] && rm "${APP_DESKTOP_FILE}"
    fi
done
