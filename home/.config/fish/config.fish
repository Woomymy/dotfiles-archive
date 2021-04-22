eval (ssh-agent -c) &> /dev/null
set fish_greeting ""
set -x EDITOR nvim
set -x GPG_TTY (tty)
set -gx PATH $PATH ~/.cargo/bin/ ~/.local/bin/
function gpg_tty --description "Reset GPG_TTY" 
	set -x GPG_TTY (tty)
end
