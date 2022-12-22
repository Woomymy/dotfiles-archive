tmux_init &>/dev/null 2>/dev/null

if test -n $TMUX
    tmux source-file $HOME/.tmux.conf
end

if test (tty) = "/dev/tty1"
    clear
    if test -f /tmp/force-wayland
        exec ~/.bin/wayland-start.sh 2>"/tmp/errors-$USER.log" > "/tmp/session-$USER.log"
    else
        exec startx &>/dev/null
    end
end
set -gx GPG_TTY (tty) # Fixes "inapropriate Ioctl for device" errors
set PATH $PATH ~/.dart/bin ~/go/bin ~/.local/bin ~/.cargo/bin ~/.deno/bin # Add cargo binaries to path

## Android
set PATH $PATH ~/Android/Sdk/tools/bin ~/.sdkman/candidates/kotlin/current/bin ~/.config/Code/User/globalStorage/fwcd.kotlin/langServerInstall/server/bin
set -gx EDITOR nvim
set fish_greeting ""

if not test -f "/tmp/SSH_ENV"
    ssh-agent -c | head -n 2 >/tmp/SSH_ENV
end
source "/tmp/SSH_ENV"

# The next line updates PATH for the Google Cloud SDK.
if test -f '/home/woomy/google-cloud-sdk/path.fish.inc' 
    . '/home/woomy/google-cloud-sdk/path.fish.inc'
end

