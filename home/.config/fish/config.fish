if test (tty) = "/dev/tty1"
	clear
	exec startx &> /dev/null
end
set -gx GPG_TTY (tty) # Fixes "inapropriate Ioctl for device" errors
set -gx PATH $PATH ~/.cargo/bin # Add cargo binaries to path

## Android
set -gx PATH $PATH ~/Android/Sdk/tools/bin
set -gx EDITOR nvim
set fish_greeting ""

if not test -f "/tmp/SSH_ENV"
	ssh-agent -c | head -n 2 > /tmp/SSH_ENV
end
source "/tmp/SSH_ENV"
