#!/usr/bin/env bash
LOGFILE="/tmp/${USER}-i3-session.log"

# Remove logs
if [[ -f "${LOGFILE}" ]]
then
    rm "${LOGFILE}"
fi

# Startup script:
# Setup wallpapers
# Setup applications

# Setup wallpapers

python "${HOME}/.bin/theming/wallpapers.py"
