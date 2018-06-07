#!/usr/bin/env zsh

# Use emacs keybindings.
bindkey -e

# Install user-downloaded completions/functions
fpath+="~/.zfunc"

# Prefer nvim if it's available and use it as the $MANPAGER.
if command -v nvim > /dev/null; then
    EDITOR=nvim
    export MANPAGER="nvim -c 'set ft=man' -"
elif command -v vim > /dev/null; then
    EDITOR=vim
fi
alias vi="$EDITOR"
alias vim="$EDITOR"
VISUAL="$EDITOR"
export EDITOR VISUAL

# Check running jobs on the University of Melbourne HPC cluster `spartan'
if [ "$(hostname)" = "spartan.hpc.unimelb.edu.au" ]; then
    alias sq="squeue -u mscholz"
else
    alias sq="ssh spartan.hpc.unimelb.edu.au squeue -u mscholz"
fi

# Set my prompt
if [ "$(whoami)" = "mscholz" ]; then
    P_NAME=""
else
    P_NAME="%F{green}$(whoami) %F{white}at "
fi

if [ "$(hostname)" = "yokohama.local" ]; then
    P_WHERE=""
else
    P_WHERE="%F{yellow}%M %F{white}in "
fi

# Set the prompt
[ -f "$HOME/.zsh-prompt.zsh" ] && source "$HOME/.zsh-prompt.zsh"

if [[ "$TERM" = "dumb" || "$TERM" = "emacs" ]]; then
    unsetopt zle
fi

# Color `ls' output by default
if [ "$(uname)" = "Darwin" ]; then
    if [[ "$TERM" = "dumb" || "$TERM" = "emacs" ]]; then
        alias ls='TERM=xterm-256color ls -G'
    else
        alias ls='ls -G'
    fi
else
    if [[ "$TERM" = "dumb" || "$TERM" = "emacs" ]]; then
        alias ls='TERM=xterm-256color ls --color=auto'
    else
        alias ls='ls --color=auto'
    fi
fi

# Use a menu-style completion interface.
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Autocompletion for scp from remote computers.
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' '
l:|=* r:|=*'
fi

# Make it faster and easier to background/foreground vim.
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Load up `fzf' if it's there
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# Save a better history.
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=100000
SAVEHIST=100000
HISTCONTROL=ignoredups

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
