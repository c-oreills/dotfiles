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
plugins=(git python command-not-found pip ssh-agent vi-mode rvm virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

case "$TERM" in
"dumb")
    PROMPT='> '
    ;;
*)
    PROMPT='%{$fg_bold[red]%}� %{$fg_no_bold[green]%}%m%{$fg_bold[blue]%}:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
    ;;
esac
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
