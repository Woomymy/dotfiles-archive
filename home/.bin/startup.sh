#!/usr/bin/env bash
wayland_start() {
    # Wayland-specific start
    export LOGFILE="/tmp/${USER}-sway-session.log"
    REQUIRED_PROCS=(
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
    )
}
common_start() {
    # Initialise systemd services
    ## Import envirronement variables
    systemctl --user import-environment PATH DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
    ## Start base "XSession" target to start user services with correct env
    systemctl --user --no-block start XSession.target

    # Common start (valid for wayland and X)
    # Remove logs
    if [[ -f "${LOGFILE}" ]]; then
        rm "${LOGFILE}"
    fi
    # Setup wallpapers
    python "${HOME}/.bin/theming/wallpapers.py"

    # Start all required background apps
    for PROC in ${REQUIRED_PROCS[*]}; do
        if [[ "$(pidof "${PROC}")" ]]; then
            killall "${PROC}"
        fi
        echo "Starting ${PROC}"
        nohup "${PROC}" &>/dev/null &
    done
    ~/.bin/desktop-apps-fix.sh || notify-send -u critical "Desktop-apps-fix" "Failed to apply/remove wayland-specific CLI to electron apps!" # Fix .desktop files to support Wayland/X.Org
}

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    wayland_start # Wayland-specific start
else
    x11_start # X-Specific start
fi

common_start # Common start (start REQUIRED_PROCS, execute python scripts, ...)
