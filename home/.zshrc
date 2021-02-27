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
export MAKEFLAGS="-j$(nproc)"
# Aliases

alias woman='man'
alias please='doas'
alias goodnight='pkill'
alias systemctl='echo fuck you'
alias boat='cargo'
alias bloat="echo SystemD"
alias gentoo="echo If it moves, compile it"

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
