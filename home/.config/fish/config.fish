if test (tty) = "/dev/tty1"
	clear
	exec startx &> /dev/null
end

set -gx GPG_TTY (tty) # Fixes "inapropriate Ioctl for device" errors
set -gx PATH $PATH ~/.cargo/bin # Add cargo binaries to path
set -gx EDITOR nvim
set fish_greeting ""
