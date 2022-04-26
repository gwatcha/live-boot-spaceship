# Command Line Aliases (doubles as essential command guide)

## Essentials
alias c='clear'            # Clear terminal
bindkey '^M' run_clear     # <Enter> Clear terminal if no command
alias pwd='pwd'            # Print name of current working directory
alias cd='cd'              # Change directory (press <Alt+c> for an interactive method)
bindkey '^[c' run_cd
alias view='bat'           # View the content of one or multiple file(s)
alias ls='exa --icons'     # List files in current directory in row
alias _='sudo'             # Run command as super-user
alias find='fd'            # Find files (press <Ctrl+t> for an interactive method)
bindkey '^T' run_find
alias scan='rg'            # Search through files and text
bindkey '^[s' run_scan     # <Alt+s> Scan text

### Tip: use <Ctrl+r> to search history of commands executed
bindkey '^R' run_search_history



## File Navigation
### use h,j,k,l to navigate - press '?' for help
### (and try out the custom bindings <C-f>, <A-c>, <C-e>, <C-g>)
alias ranger='ranger'      # Open Ranger
bindkey '^f' run_ranger    # <Ctrl+f> Open Ranger


## Package Management
### Try typing 'p -' in terminal and pressing <Tab> for completions
alias p='sudo pacman'      # Core system package managment utility
alias pi='p -S'            # Install package for system
alias pr='p -R'            # Remove Package
alias pq='p -Q'            # Get Package information
alias yay='yay'            # User package management utility
alias yi='yay -S'          # Same as pacman -S, only yay also has access to packages in the Arch Linux User Repository (AUR). I always use yay.


## Guides
### (also try adding '-h' to the end of a command to display help)
alias man='man'            # Open manual for command
alias tldr='tldr'          # Open condensed manual for command
alias manly='manly'        # Describe what a command and it's flags do
alias navi='navi'          # Navigate a list of commands
bindkey '^[h' _navi_widget # <Alt+h> Open navi widget


## Powerful Programs
alias e='spacemacs'        # Launch Spacemacs - a powerful text editting environment
alias edit='spacemacs'
alias jl='julia'           # Launch an interactive Julia Console - a scientific mathematics environment
alias calculate='julia'
alias overview='btop'       # Launch System Overview Console

## Tmux
#### A terminal-multiplexer for running command line processes in parallel. Use the following alias to create or rejoin the "Home" session. Try typing "<Ctrl+s>/" to split the terminal vertically. Type "<Ctrl+s>?" for a guide.
alias tm='tmux attach -t \
"Home" || tmux new-session\
 -c ~ -s "Home"'


## Command Line Goodies
alias sk='sk'              # Interactively fuzzy find
alias grep='rg'            # Search
alias sed='sd'             # Intuitive find and replace CLI
alias grex='grex'          # Generate regex (useful for commands)


## System Utilities
alias du='dust'            # Print local disk usage
alias df='rdf'             # Print filesystem disk usage
alias ps='procs'           # Show running processes
alias diff='delta'         # Show difference across files
alias clock='hyperfine'    # Time a command
alias summary='tokei'      # Print summary of directory content
alias dmesg='rmesg'        # Print kernel log


## Programming

### Golang
alias gb='go build'
alias ,='go run'

### Python
alias py='/usr/bin/python3.8'

### Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='git push'


## Misc
alias ..='cd ..'           # Change directory to parent directory ('.' -> current dir)
alias ...='cd ../../'      #
alias dig='dog'            # Command line DNS (Domain Name Server) client
alias cat='bat'            # Print and concatenate files
