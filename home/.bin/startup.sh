#!/usr/bin/env bash
wayland_start() {
    # Wayland-specific start
    export LOGFILE="/tmp/${USER}-sway-session.log"
    REQUIRED_PROCS=(
        dunst
        /usr/libexec/polkit-gnome-authentication-agent-1
    )
}

x11_start() {
    # X-Specific start
    LOGFILE="/tmp/${USER}-i3-session.log"
    # Setup dualscreen
    bash "${HOME}/.screenlayout/dualscreen.sh"
    REQUIRED_PROCS=(
        /usr/libexec/polkit-gnome-authentication-agent-1
        dunst
        picom
    )
}
common_start() {
    # Common start (valid for wayland and X)
    # Remove logs
    if [[ -f "${LOGFILE}" ]]
    then
        rm "${LOGFILE}"
    fi
    # Setup wallpapers
    python "${HOME}/.bin/theming/wallpapers.py"
    
    # Start all required background apps
    for PROC in ${REQUIRED_PROCS[*]}
    do
        if [[ "$(pidof "${PROC}")" ]]
        then
            killall "${PROC}"
        fi
        nohup "${PROC}" &> /dev/null &
    done
}

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]
then
    wayland_start # Wayland-specific start
else
    x11_start # X-Specific start
fi

common_start # Common start (start REQUIRED_PROCS, execute python scripts, ...)
