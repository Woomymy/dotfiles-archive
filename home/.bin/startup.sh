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
bash "${HOME}/.screenlayout/dualscreen.sh"
# Setup wallpapers
python "${HOME}/.bin/theming/wallpapers.py"
REQUIRED_PROCS=(
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 # You can use another polkit agent
    picom
    dunst
)

for PROC in ${REQUIRED_PROCS[*]}
do
    if [[ "$(pidof "${PROC}")" ]]
    then
        killall "${PROC}"
    fi
    nohup "${PROC}" &> /dev/null &
done
