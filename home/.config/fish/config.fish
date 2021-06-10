if test (tty) = "/dev/tty1"
	clear
	exec startx &> /dev/null
end
set fish_greeting ""
set -x EDITOR nvim
set -x GPG_TTY (tty)
set -gx PATH $PATH ~/go/bin/ ~/.cargo/bin/ ~/.local/bin/ /usr/local/bin
eval (ssh-agent -c) &> /dev/null
