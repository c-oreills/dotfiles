# Disable zsh over emacs TRAMP
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    # General shell
    command-not-found
    dotenv
    # globalias # Turn me on for pairing
    ssh-agent
    vi-mode
    # Git
    git
    # Python
    python
    pip
    pipenv
    pyenv
    # Ruby
    rbenv
)

source $ZSH/oh-my-zsh.sh

case "$TERM" in
"dumb")
    PROMPT='> '
    ;;
*)
    PROMPT='${ret_status} %{$fg_no_bold[green]%}%m%{$fg_bold[blue]%}:%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
    ;;
esac
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[red]%}"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Use vi bindings
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^?" backward-delete-char
bindkey "kk" vi-cmd-mode
bindkey "e[1~" beginning-of-line # Home
bindkey "e[4~" end-of-line # End
bindkey "e[3~" delete-char # Del

# Sort completion by modification date
zstyle ':completion:*' file-sort modification

# Check swapiness on shell boot
# To change:
# Edit /etc/sysctl.conf to include
# vm.swappiness = 10
# then
# sudo sysctl -p
if [[ -f /proc/sys/vm/swappiness && $(cat /proc/sys/vm/swappiness) -ne 10 ]];
    then echo 'vm.swappiness != 10';
fi;
