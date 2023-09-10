# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.local/bin/:$HOME/zig/master/files/"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export GPG_TTY=$(tty)

# Set up a red prompt for root and a green one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
MAGENTA="\[\e[38;2;255;0;136;1m\]"
if [[ $EUID == 0 ]] ; then
    PS1="$RED[ $NORMAL\w$RED ]# $NORMAL"
else
    PS1="$MAGENTA[ $NORMAL\w$MAGENTA ]\$ $NORMAL"
fi

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   unzstd $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        if [ "$#" -eq 0 ]; then
            echo "help: ex <file>"
        else
            echo "'$1' is not a valid file"
        fi
    fi
}

### ALIASES ###
# navigation
up() {
    local d=""
    local limit="$1"

    # Default to limit of 1
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i=1;i<=limit;i++)); do
        d="../$d"
    done

    # perform cd. Show error if cd fails
    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs.";
    fi
}

alias vim="nvim"
alias la="ls -a"
alias ll="ls -l"

alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'

alias df='df -h'
alias free='free -h'

# tty
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1FF4F58" #darkred
    echo -en "\e]P9FF4F58" #red
    echo -en "\e]P273D936" #darkgreen
    echo -en "\e]PA73D936" #green
    echo -en "\e]P3FFDD33" #brown
    echo -en "\e]PBFFDD33" #yellow
    echo -en "\e]P496A6C8" #darkblue
    echo -en "\e]PC96A6C8" #blue
    echo -en "\e]P59E95C7" #darkmagenta
    echo -en "\e]PD9E95C7" #magenta
    echo -en "\e]P696A6C8" #darkcyan
    echo -en "\e]PE96A6C8" #cyan
    echo -en "\e]P7E4E4E4" #lightgrey
    echo -en "\e]PFE4E4E4" #white
    clear
fi

