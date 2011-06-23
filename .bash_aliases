# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Handy shell opener
alias go='gnome-open'

# Git aliases
alias ga='git add'
alias gp='git push'
alias gpp='git pull; git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpl='git pull'
alias gcl='git clone'


### Work specific ###
if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi
