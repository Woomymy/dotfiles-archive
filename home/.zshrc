export ZSH="$HOME/.oh-my-zsh"
# Set OMZ Theme to sulfurium
ZSH_THEME="sulfurium"

# Enable ZSH correction
ENABLE_CORRECTION="true"

# Add "sudo" ZSH plugin
plugins=(sudo)

# Loads OMZ
source $ZSH/oh-my-zsh.sh

# Set $EDITOR 
export EDITOR="vim"
# Aliases
alias woman='man'
alias please='sudo'
alias goodnight='pkill'
alias boat='cargo'
alias systemctl="echo fuck you"
alias systemd="echo fuck you"
alias uselinux="echo GNU/LINUX"
alias stallman="echo ❤️ "
alias gentoo="echo If it moves, compile it"
