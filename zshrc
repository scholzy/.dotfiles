#!/usr/bin/env zsh

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Make sure that oh-my-zsh is installed.
if [ ! -d "${ZSH}" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git "${ZSH}"
fi

# Set name of the theme to load. This is just a temporary workaround, since the prompt is reset later.
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Turn on ls colors in Emacs.
if [ ! -z "${INSIDE_EMACS}" ]; then
    alias ls="TERM=xterm ls"
fi

# Use neovim if it's there, but otherwise normal vim is ok.
if command -v nvim > /dev/null; then
    EDITOR=nvim
    export MANPAGER="nvim -c 'set ft=man' -"
elif command -v vim > /dev/null; then
    EDITOR=vim
fi

# But if we're inside Emacs, use that.
if [ ! -z "${INSIDE_EMACS}" ]; then
    EDITOR=emacsclient
fi

alias vi="$EDITOR"
alias vim="$EDITOR"
VISUAL="$EDITOR"
export EDITOR VISUAL

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

# Check jobs running on the spartan HPC cluster.
if [[ "$(hostname)" =~ "spartan*" ]]; then
    alias sq="squeue -u mscholz"
else
    alias sq="ssh spartan.hpc.unimelb.edu.au squeue -u mscholz"
fi

# Re-set the prompt. This is a version of the "gallifrey" oh-my-zsh theme, modified to remove any potentially funny non-ASCII characters.
if [ -z "${SSH_TTY}" ]; then
    SSH_COL="blue"
else
    SSH_COL="red"
fi

# Set the theme
fpath=( "$HOME/.zfunctions" $fpath )
[ -d "$HOME/.zfunctions" ] || mkdir "$HOME/.zfunctions"
[ -f "$HOME/.zfunctions/async" ] || curl -L https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh -o "$HOME/.zfunctions/async"
[ -f "$HOME/.zfunctions/prompt_pure_setup" ] || curl -L https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh -o "$HOME/.zfunctions/prompt_pure_setup"
if [ -z "${INSIDE_EMACS}" ]; then
    autoload -U promptinit; promptinit
    prompt pure
fi
