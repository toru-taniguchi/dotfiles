echo "load zshrc"

## direnv
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=

## mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"

## rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

## imagemagic
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

## Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export -p

# basic
## color
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

## 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# alias
alias cdr='cd $(git rev-parse --show-toplevel)'

## SourceTree
alias "ost"="open /Applications/SourceTree.app/Contents/MacOS/SourceTree"

## git# {{{
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gbl='git blame'
alias gc='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff --color-words'
alias gf='git fetch'
alias ggr='git grep'
alias gl='git log'
alias gco='git commit'
alias grm='git remote'
alias gs='git status'
alias gv='git revert'
# }}}

## rails# {{{
alias be='bundle exec'
alias rc='rails console'
alias rs='rails server'
# }}}

# prompt
export GIT_PS1_SHOWCOLORHINTS=1
git_prompt_sh=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -e $git_prompt_sh ]; then
    source $git_prompt_sh
    precmd () { __git_ps1 "%F{cyan}%c%f" " $ " " (%s)" }
else
    PS1='%F{cyan}%c%f \$ '
fi

# completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

