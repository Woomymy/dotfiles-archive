#!/usr/bin/env bash
x11_start() {
    # Setup dualscreen
    bash "${HOME}/.screenlayout/dualscreen.sh"
}
common_start() {
    # Initialise systemd services
    ## Import envirronement variables
    systemctl --user import-environment PATH DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
    ## Start base "XSession" target to start user services with correct env
    systemctl --user --no-block start XSession.target

    # Common start (valid for wayland and X)
    ## Setup wallpapers
    python "${HOME}/.bin/theming/wallpapers.py"

    ~/.bin/desktop-apps-fix.sh || notify-send -u critical "Desktop-apps-fix" "Failed to apply/remove wayland-specific CLI to electron apps!" # Fix .desktop files to support Wayland/X.Org
}

if [[ "${XDG_SESSION_TYPE}" != "wayland" ]]; then
    x11_start # X-Specific start
fi

common_start # Common start (start REQUIRED_PROCS, execute python scripts, ...)
