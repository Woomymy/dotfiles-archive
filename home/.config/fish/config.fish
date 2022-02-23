tmux_init &>/dev/null 2>/dev/null

thefuck --alias | source

if test (tty) = "/dev/tty1"
    clear
    if test -f /tmp/force-wayland
        exec ~/.bin/wayland-start.sh 2>"/tmp/errors-$USER.log" > "/tmp/session-$USER.log"
    else
        exec startx &>/dev/null
    end
end
set -gx GPG_TTY (tty) # Fixes "inapropriate Ioctl for device" errors
set -gx PATH $PATH ~/go/bin ~/.local/bin ~/.cargo/bin # Add cargo binaries to path

# Flutter
if test -d "$HOME/Dev/Flutter/flutter"
    set -gx PATH $PATH ~/Dev/Flutter/flutter/bin
end

## Android
set -gx PATH $PATH ~/Android/Sdk/tools/bin
set -gx EDITOR nvim
set fish_greeting ""

if not test -f "/tmp/SSH_ENV"
    ssh-agent -c | head -n 2 >/tmp/SSH_ENV
end
source "/tmp/SSH_ENV"
