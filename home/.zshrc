# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
# Set OMZ Theme to sulfurium
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable ZSH correction
ENABLE_CORRECTION="true"

# Add "sudo" ZSH plugin
plugins=(sudo node)

# Loads OMZ
source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.local/bin/:$HOME/.cargo/bin"
alias pfetch='curl -s https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch | sh'
# Set $EDITOR 
export EDITOR="nvim"
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/woomy/.sdkman"
[[ -s "/home/woomy/.sdkman/bin/sdkman-init.sh" ]] && source "/home/woomy/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
