# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# include home settings if home file exists
if [ -f "$HOME/.profile_home" ]; then
    . "$HOME/.profile_home"
fi

RUBYOPT=rubygems
export CLOJURE_EXT=$HOME/.clojure
export CLOJURESCRIPT_HOME=$HOME/.clojurescript

if [ -d "$CLOJURESCRIPT_HOME" ] ; then
    PATH="$CLOJURESCRIPT_HOME/bin:$PATH"
fi

PATH=./node_modules/.bin:$PATH # Preferentially use local node binaries

export ERL_AFLAGS="-kernel shell_history enabled"

# Colour stderr red by preloading stderred
export LD_PRELOAD="$HOME/.libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"

# Add rbenv shims to PATH
export PATH="$HOME/.rbenv/shims:$PATH"

# Add homebrew
if [ -f "/opt/homebrew/bin/brew" ] ; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# include work settings if work file exists
if [ -f "$HOME/.profile_work" ]; then
    . "$HOME/.profile_work"
fi

