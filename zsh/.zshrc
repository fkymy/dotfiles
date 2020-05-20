# --------------------------
# oh-my-zsh
# --------------------------

# Path to your oh-my-zsh installation.
export ZSH=/Users/fkymy/.oh-my-zsh

ZSH_THEME="fkymy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bundler git github node npm pip python rails ruby textmate web-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# --------------------------
# user configuration
# --------------------------
# export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR='vim'

export DOTFILES=$HOME/dotfiles

## history config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# do not record dupes in history
setopt hist_ignore_all_dups

# ignore if space in front
setopt hist_ignore_space

# adds history incrementally
setopt inc_append_history

# share history across sessions
setopt share_history

# allow editing after calling history
setopt hist_verify

# allow japanese file names
setopt print_eight_bit

# disable beep
setopt no_beep

# disable Ctrl-S / Ctrl-Q flow control
setopt no_flow_control

# do not end zsh with Ctrl-D
setopt ignore_eof

# make autocomplete buffer
autoload -U compinit
compinit -u

# allow hjkl in autocomplete menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# -----------------------
# Prompt
# -----------------------
# autoload -U promptinit; promptinit
# autoload -Uz colors; colors
#
# # line 1
# PROMPT="%~ %# "
# # line 2
# PROMPT="%{${fg[white]}%}%n @%*%{${reset_color}%} %~
# $ "
#
# # vcs_info
# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook
#
# zstyle ':vcs_info:*' check-for-changes true
#
# zstyle ':vcs_info:*' formats '%F{white}on %b%u%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
#
# function _update_vcs_info_msg() {
#  LANG=en_US.UTF-8 vcs_info
#  RPROMPT="${vcs_info_msg_0_}"
# }
# add-zsh-hook precmd _update_vcs_info_msg

# https://github.com/morhetz/gruvbox/wiki/Terminal-specific
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# --------------------------
# alias
# --------------------------

# tmp
alias cutthevideo='ffmpeg -i video.mp4 -r 10 image%d.jpg'
alias asdf='echo 【=◈︿◈=】'
alias ct='cd ~/Dropbox/texts'
alias py='python3.6'

# cd
alias dc='cd'

# ls
alias la='ls -a'
alias lr='ls -hrtl'
alias lt='ls -htl'

# git
alias gut='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gls='git log --stat'
alias glo='git log --oneline'
alias glog="git log --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"

# vim
alias v='vim'

# nvim
# alias vim='nvim'

# less
alias less='less -NM'

# default flag
alias mv='mv -i'
alias mkdir='mkdir -p'
alias df='df -h'

# --------------------------
# C
# --------------------------

alias gcc='gcc -Wall -Werror -Wextra'

# --------------------------
# rake
# --------------------------

alias raket='RAILS_ENV=test rake'
alias raked='RAILS_ENV=development rake'
alias rakep='RAILS_ENV=production rake'

# --------------------------
# rbenv
# --------------------------

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# --------------------------
# pyenv
# --------------------------

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# --------------------------
# node.js
# --------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# source $HOME/.zshrc.custom

# --------------------------
# postgresql
# --------------------------
export PGDATA="/usr/local/var/postgres"

# --------------------------
# go
# --------------------------
export GOPATH=$HOME/go

# --------------------------
# google-cloud-sdk
# --------------------------
source /Users/fkymy/google-cloud-sdk/completion.zsh.inc
source /Users/fkymy/google-cloud-sdk/path.zsh.inc


# --------------------------
# move default ~/.config/nvim/init.vim to dotfiles
# --------------------------
export XDG_CONFIG_HOME=$HOME/dotfiles/vim/.config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source /Users/fkymy/Library/Preferences/org.dystroy.broot/launcher/bash/br

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

