#!/usr/bin/env bash
# This script is responsible of starting all user services
# Exporting environnement to systemd user services
# Setting up wallpapers

session_init() {
    # Initialise systemd services
    ## Import envirronement variables
    systemctl --user import-environment PATH DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
    ## Start base "XSession" target to start user services with correct env
    systemctl --user --no-block start XSession.target

    ## Setup wallpapers
    python "${HOME}/.bin/theming/wallpapers.py"

    ## Setup dualscreen
    sh "${HOME}/.screenlayout/dualscreen.sh"
}

session_init
