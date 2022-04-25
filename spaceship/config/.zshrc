export ZSH_HOME="$HOME/Dotfiles"
source $ZSH_HOME/zsh-config/skim

source $ZSH_HOME/zsh-config/plugins
source $ZSH_HOME/zsh-config/aliases
source $ZSH_HOME/zsh-config/paths

clear

eval "$(navi widget zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $ZSH_HOME/zsh-config/bindings

autoload -U compinit && compinit

my-accept-line () {
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        clear
    fi
    zle accept-line
}
zle -N my-accept-line
bindkey '^M' my-accept-line
