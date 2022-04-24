zstyle ':znap:*' repos-dir ~/Dotfiles/zsh-plugins
source ~/Dotfiles/zsh-snap/znap.zsh
# User configuration
source /etc/profile.d/locale.sh


# `znap prompt` makes your prompt visible in just 15-40ms!
# znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# znap source jeffreytse/zsh-vi-mode

znap source subnixr/minimal
znap source softmoth/zsh-vim-mode
znap source hackerchai/skim-zsh

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenn

export EDITOR='emacsclient -c'
export VISUAL='emacsclient -c'
export ALTERNATE_EDITOR='vim'

SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

# Optional Exports
LUA_PATH='/home/michael/.luarocks/share/lua/5.3/?.lua;/home/michael/.luarocks/share/lua/5.3/?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;;./?.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua'
LUA_PATH=$LUA_PATH:'/home/michael/.config'
export LUA_PATH
export MANPATH=:$MANPATH:/opt/texlive/2020/texmf-dist/doc/man
export INFOPATH=:$MANPATH:/opt/texlive/2020/texmf-dist/doc/info
export NODE_PATH=/usr/lib/node_modules:$HOME/.config/yarn/global/node_modules
source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export JAVA_HOME=/usr/lib/jvm/default
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_HOME/lib/:$JAVA_HOME/lib/i386/:$JAVA_HOME/lib/i386/xawt/:$JAVA_HOME/lib/i386/client/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_HOME/lib/:$JAVA_HOME/lib/i386/:$JAVA_HOME/lib/i386/xawt/:$JAVA_HOME/lib/i386/client/
export JL_PATH=$JL_PATH:/usr/include/julia
export JULIA_EDITOR=vim
export LOCAL_BIN=$HOME/Program/bin
export RACK_DIR=$HOME/Program/Rack-SDK
export GOPATH=$HOME/Program/go
export GOBIN=$GOPATH/bin

# Path

PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/Program/bin
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
PATH=$PATH:/opt/texlive/2020/bin/x86_64-linux
PATH=$PATH:$HOME/Program/Rack2Free
export PATH


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#removes my QT session management errors
unset SESSION_MANAGER

### Aliases ~~~

alias py='/usr/bin/python3.8'
alias _='sudo'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias s='spaceship'

# Termina Rust lPower-Up 
alias l='exa -l --icons'
alias ls='exa --icons'
alias cp='xcp'
alias du='dust'
alias df='rdf'
alias find='fd'
alias dig='dog'
alias sed='sd'
alias ps='procs'
alias diff='delta'
alias time='hyperfine'
alias clock='tokei'
alias cat='bat'
alias _='sudo'
alias l='exa -l --icons'
alias ls='exa --icons'
alias z='zoxide'
alias dmesg='rmesg'
alias ag='rg'
alias grex='grex'

alias be="bulk edit --editor 'emacsclient -c %{file}'"

# packages
alias p='sudo pacman'
alias pi='sudo pacman -S'
alias pr='sudo pacman -R'
alias y='yay'
alias yi='yay -S'
alias yr='yay -R'
# apps
# alias e='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias jl='julia'
alias tm='tmux attach -t "Home" || tmux new-session -c ~ -s "Home"'

# golang
alias gb='go build'
alias ,='go run'

#git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='git push'
autoload -U compinit && compinit

# skim
export SKIM_CTRL_R_COMMAND='--bind alt-j:down,alt-k:up'
export SKIM_CTRL_T_COMMAND='ag --ignore-dir program --ignore-dir node_modules --ignore .git -g ""'
export SKIM_CTRL_T_OPTS="--height 70% --preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
export SKIM_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export SKIM_DEFAULT_OPTS='--reverse --bind alt-j:down,alt-k:up,alt-u:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'

ZSH_CACHE_DIR=$HOME/.cache/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_BEEP
export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE=$HOME/.zsh_history

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export MNML_USER_CHAR=' ϻ'
# export MNML_USER_CHAR=' Ϟ'

# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
export GIT_PAGER='delta'

clear

eval "$(navi widget zsh)"
eval "$(zoxide init zsh)"
bindkey '^[h' _navi_widget
bindkey '^e' __z_oxide

eval "$(starship init zsh)"

### Bindings
run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger
bindkey '^f' run_ranger

# bindkey  '^I' expand-or-complete

bindkey "\e[3~" delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey -s '^g' 'rg . | sk --delimiter=: --nth=2..^M'
