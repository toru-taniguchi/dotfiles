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
alias bi='bundle install --path vendor/bundle'
alias rubocop='be rubocop --safe-auto-correct'
alias rc='be rails console'
alias rs='be rails server'
alias migrate='be rails db:migrate'
alias seed='bin/fast_seed'
alias envtest='RAILS_ENV=test'
alias setup='bi && migrate && seed && envtest migrate && envtest seed'
alias rsca='be rails server -b $CA_FQDN -p $CA_PORT'
alias rsiv='be rails server -b $IV_FQDN -p $IV_PORT'
alias rspa='be rails server -b $PA_FQDN -p $PA_PORT'
alias rsmy='be rails server -b $MY_FQDN -p $MY_PORT'
alias rsex='be rails server -b $EX_FQDN -p $EX_PORT'
alias rsmfcp='be rails server -p $PARTNER_PORT'
alias rsmid='setup && be rails server -b $CA_MID_HOST -p $CA_MID_PORT'
# }}}

## Redis
alias "redis"="redis-server /usr/local/etc/redis.conf"

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

