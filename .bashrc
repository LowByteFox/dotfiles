export PATH="$PATH:$HOME/.local/bin"

export GPG_TTY="$(tty)"
export JAVA_HOME="/usr/local/jdk-17"

# Set up a red prompt for root and a yellow one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
MAGENTA="\[\e[38;2;255;0;136;1m\]"
if [[ $EUID == 0 ]] ; then
    PS1="$RED\u [ $NORMAL\w$RED ]# $NORMAL"
else
    PS1="$YELLOW\u [ $NORMAL\w$YELLOW ]\$ $NORMAL"
fi

# Shell options
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

alias vim="nvim"
alias la="ls -a"
alias ll="ls -l"

alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'

alias df='df -h'
alias free='free -h'

# Not enough disk space for self node
# I also used to mine monero on their pool
alias xmr-wallet="monero-wallet-cli --daemon-address nodes.hashvault.pro:18081 --trusted-daemon"
