# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
#zmodload zsh/zprof

# Setup Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
zstyle :prompt:pure:path color white
zstyle :prompt:pure:prompt:success color red
zstyle :prompt:pure:prompt:error color magenta
prompt pure

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# --------------------------
# user configuration
# --------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR='vim'

export DOTFILES=$HOME/dotfiles
export PATH="$DOTFILES/bin:$PATH"

export XDG_CONFIG_HOME=$HOME/dotfiles/.config

export PATH=$PATH:$DOTFILES/.config/coc/extensions/coc-clangd-data/install/12.0.0/clangd_12.0.0/bin

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

# --------------------------
# alias
# --------------------------

alias vim='nvim'
alias v='vim'

alias la='ls -a'
alias lr='ls -hrtl'
alias lsx='exa --icons'

alias cutthevideo='ffmpeg -i video.mp4 -r 10 image%d.jpg'
alias ct='cd ~/Dropbox/texts'
alias py='python3.6'
alias gogh='bash -c  "$(curl -sLo- https://git.io/vQgMr)"'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gls='git log --stat'
alias glo='git log --oneline'
alias glog="git log --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"

alias less='less -NM'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias df='df -h'

alias dc='docker-compose'

# alias norminette="~/.norminette/norminette.rb"

alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias ta='tmux a -t'
alias tnew='tmux new -s'

alias ..='cd ..'
alias ...='cd ./../'
alias back='cd $(git rev-parse --show-toplevel)'

alias vimrc='vim ~/dotflies/.config/nvim/init.vim'

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -A'
alias gcam='git commit --amend --no-edit'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gt='git tree'
alias gri='git rm -r --cached .; git add -A ; git commit -m "🧹 reflect .gitignore" '
alias gls='git log --stat'
alias glo='git log --oneline'
alias glp='git log -p'
alias glog="git log --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"

dstop() { docker stop $(docker ps -a -q); }
drm() { docker rm -f $(docker ps -aq); }
drmi() { docker rmi -f $(docker images -aq); }
dup() { docker-compose up -d;  }
dupr() { docker-compose restart; }
ddown() { docker-compose down; }
alias dl="docker ps -l -q"

INT_MIN="-2147483648"
INT_MAX="2147483647"
UINT_MAX="4294967295"
LONG_MAX="9223372036854775807"
LONG_MIN="-9223372036854775808"
ULONG_MAX="18446744073709551615"

# --------------------------
# C
# --------------------------


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
export PATH=$PATH:~/.npm/node_modules/.bin # Global modules
# export NVM_DIR=$HOME/.nvm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# https://github.com/nvm-sh/nvm/issues/782
# export PATH=$PATH:~/.npm/node_modules/.bin # Global modules
# export NVM_DIR=$HOME/.nvm
# nvm_load () { . $NVM_DIR/nvm.sh && $NVM_DIR/bash_completion; }
# alias node='unalias node; nvm_load; node $@'
# alias npm=' unalias npm;  nvm_load; npm  $@'

export NVM_DIR="$HOME/dotfiles/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --------------------------
# postgresql
# --------------------------
export PGDATA="/usr/local/var/postgres"

# --------------------------
# go
# --------------------------
# export GOPATH=$HOME/go

# --------------------------
# Rust
# --------------------------
export PATH="$HOME/.cargo/env:$PATH"

# --------------------------
# google-cloud-sdk
# --------------------------
# source /Users/fkymy/google-cloud-sdk/completion.zsh.inc
# source /Users/fkymy/google-cloud-sdk/path.zsh.inc


source /Users/fkymy/Library/Preferences/org.dystroy.broot/launcher/bash/br

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

# For zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export PROJECT_HOME=$HOME/Devel
# source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh

# Setup virtualenv home
export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# source /Users/fkymy/.pyenv/shims/virtualenvwrapper.sh
source $PYENV_ROOT/versions/3.8.2/bin/virtualenvwrapper.sh

# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Set the pyenv shims to initialize
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

KUBECONFIG=~/.kube/config
#zprof

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
