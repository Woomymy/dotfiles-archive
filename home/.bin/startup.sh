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
    if [[ -f "${LOGFILE}" ]]; then
        rm "${LOGFILE}"
    fi
    # Setup wallpapers
    python "${HOME}/.bin/theming/wallpapers.py"

    REQUIRED_PROCS+=("${HOME}/.bin/other/switch.sh")                     # Switch rcm tool, automatically inject hekate
    REQUIRED_PROCS+=("${HOME}/.bin/other/telegramMusicNotifications.sh") # Telegram desktop music notifications
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
