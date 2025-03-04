export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH="/Users/$LOGNAME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git brew npm fnm)
plugins+=(fasd)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

source $ZSH/oh-my-zsh.sh

export VISUAL=nvim
export EDITOR="$VISUAL"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="/opt/local/bin:$PATH"
export PATH=~/.fzf/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/mysql-8.0.31-macos12-arm64/bin:$PATH
export PATH="/usr/local/go/bin:$PATH"
export PATH="/Users/aakashsigdel/Downloads:$PATH"
export PATH="~/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# ------ Rust -----
export CARGO_HOME="/Users/$USER/.config/cargo"

# ----- Android ----
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# ---
alias ip="ifconfig | grep 192"
alias tmux="tmux -2"
alias zconfig="vim ~/.zshrc"
alias act="act --container-architecture linux/amd64"
alias rg="rg --hidden"
alias emulator="~/Library/Android/sdk/emulator/emulator"

alias v="vim"
alias vi="vim"
alias vim="nvim"

alias g='git'
alias gs="git status"
alias ga="git add"
alias gl="git log"
alias gcm="git commit -m"
alias gck="git checkout"
alias gpl="git pull origin"
alias gpo="git push origin"

# ------ cURL -----
alias cgt="curl -X GET"
alias cpt="curl -X POST"
cjs() {
    curl -X POST $1 -H 'Content-Type: application/json' -d $2
}
# -----------

alias tat="tmux at -t"
alias mux=tmuxinator

alias y="yarn"
alias yw="yarn workspace"

# ---

set -o vi
bindkey '^r' history-incremental-search-backward

# 10ms timeout for key sequences
KEYTIMEOUT=1

#initialize zoxide
eval "$(zoxide init zsh)"

# FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# GPG keys
export GPG_TTY=$(tty)

# TOKENS

# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
eval "$(fnm env --use-on-cd)"

# temp flags
eval export PATH="/Users/aakashsigdel/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.6/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

eval "$(starship init zsh)"

# Shopify Hydrogen alias to local projects
# alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

eval "$(direnv hook zsh)"
# eval "$(~/.local/bin/mise activate zsh)"

# bun completions
[ -s "/Users/aakashsigdel/.bun/_bun" ] && source "/Users/aakashsigdel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
