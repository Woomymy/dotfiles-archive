# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
