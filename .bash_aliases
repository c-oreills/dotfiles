# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Handy shell opener
alias go='gnome-open'

# Paged ack
alias ackl='ack --pager="less -R"'

# Git aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gpl='git pull'
alias gcl='git clone'
alias gf='git fetch'
alias gr='git merge'
alias grf='git merge --ff-only'

# Port forwarding
function pf () { screen -d -m -S pf_$1_$2 bash -c "ssh -Nv -L $2:127.0.0.1:$2 $1"; } 
function pfd () { screen -d -m -S pf_$1_$2_$3 bash -c "ssh -Nv -L $2:127.0.0.1:$3 $1"; } 

### Home specific ###
if [ -f ~/.bash_aliases_home ]; then
    . ~/.bash_aliases_home
fi

### Work specific ###
if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi
