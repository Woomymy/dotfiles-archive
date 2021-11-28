# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Copy of fish setenv() for compat
function setenv() { 
	eval "export ${1}=${2}"
}

. "$HOME/.cargo/env"

# Init prompt
CYAN="\e[96m"
RESET="\e[m"
export PROMPT_DIRTRIM=4 # Add max 4 folders to $PS1
export PS1='$(echo -e $CYAN)\u$(echo -e $RESET)@\H \w ($(date +%H:%M)) $(echo -e $CYAN)\$$(echo -e $RESET) '

# Aliases

alias ls="lsd"
alias cat="bat --decorations=never --paging=never"
alias dig="dog"

# Heritate SSH-Agent config from fish
# No need to respawn ssh-agent if file doesn't exist because fish is almost always started before BASH
if [[ -f "/tmp/SSH_ENV" ]]
then
	source /tmp/SSH_ENV	
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
