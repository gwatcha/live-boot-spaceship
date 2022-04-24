# User configuration
source /etc/profile.d/locale.sh
source /usr/share/zsh/scripts/zplug/init.zsh

# Plugins ------------------------------------------------------

zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh, defer:1
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/zsh-completions",   from:oh-my-zsh, defer:1
zplug "plugins/golang",   from:oh-my-zsh
zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
# zplug "Aloxaf/fzf-tab", from:github, defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "subnixr/minimal", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export LOCAL_BIN=$HOME/Program/bin
export RACK_DIR=$HOME/Program/Rack-SDK

export EDITOR='emacsclient -c'
export VISUAL='emacsclient -c'
export ALTERNATE_EDITOR=''
export GOPATH=$HOME/Program/go
export GOBIN=$GOPATH/bin

# for rust lib jlrs to work
export JL_PATH=$JL_PATH:/usr/include/julia
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/julia/
#  :/usr/lib/julia/:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/i386/:/usr/lib/jvm/default/lib/i386/xawt/:/usr/lib/jvm/default/lib/i386/client/:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/i386/:/usr/lib/jvm/default/lib/i386/xawt/:/usr/lib/jvm/default/lib/i386/client/:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/i386/:/usr/lib/jvm/default/lib/i386/xawt/:/usr/lib/jvm/default/lib/i386/client/:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/i386/:/usr/lib/jvm/default/lib/i386/xawt/:/usr/lib/jvm/default/lib/i386/client/
export JULIA_EDITOR=vim

PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/Soft/trinkets/bin
PATH=$PATH:$HOME/Program/bin
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
PATH=$PATH:/opt/texlive/2020/bin/x86_64-linux
PATH=$PATH:$HOME/Program/Rack2Free
export PATH

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

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#removes my QT session management errors
unset SESSION_MANAGER

### aliases
alias py='/usr/bin/python3.8'
alias _='sudo'
alias l='exa -l --icons'
alias ls='exa --icons'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias s='spaceship'

alias du='dust'
alias df='pydf'
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
alias rc='rclone sync -u --progress'
alias rs='rclone sync -u --progress . box:/Org'
alias py='python'
alias fetch="bonsai -n -L 20 -g 35,20 > my_bonsai_art.txt
neofetch --ascii my_bonsai_art.txt --ascii_colors 11 3 10 2 0
rm my_bonsai_art.txt
"
# golang
alias gb='go build'
alias ,='go run'

#git
alias gs='git status'
autoload -U compinit && compinit

### bindings
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
bindkey -s '^b' 'ag --nobreak --noheading . | fzf --delimiter=: --nth=2..^M'

# fzf
export FZF_CTRL_R_COMMAND='--bind alt-j:down,alt-k:up'
export FZF_CTRL_T_COMMAND='ag --ignore-dir program --ignore-dir node_modules --ignore .git -g ""'
export FZF_CTRL_T_OPTS="--height 70% --preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_OPTS='--reverse --bind alt-j:down,alt-k:up,alt-u:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'

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
eval "$(navi widget zsh)"

clear

eval "$(starship init zsh)"

