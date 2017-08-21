#!/bin/zsh
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Adrien Giboire <adrien.giboire@gmail.com>
#

LC_ALL="en_US"

# Disable auto-correct
unsetopt correct_all

# EXPORTS {{{
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Postgres data file path
export PGDATA='/usr/local/var/postgres/data'

# Set locale
export LANG=en_US.UTF-8

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:/usr/local/share/npm/bin"

# }}}

# ZSH CONFIG {{{

# Tell ZSH to use Vim mode navigation
bindkey -v

autoload -U promptinit && promptinit
autoload -U compinit && compinit -u
#
# }}}

# CHRUBY {{{

[[ -s /usr/local/opt/chruby/share/chruby/chruby.sh ]] && . /usr/local/opt/chruby/share/chruby/chruby.sh
[[ -s /usr/local/opt/chruby/share/chruby/auto.sh ]] && . /usr/local/opt/chruby/share/chruby/auto.sh

# }}}

# BUNDLER EXEC {{{

[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

# }}}

# AUTOJUMP {{{

command -v brew >/dev/null 2>&1 && [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# }}}

# ALIASES {{{
alias l='ls -lA'
alias ..='cd ..'
alias ...='..;..'

alias c='cd ~/code'
alias less='less --quiet'

# Rails {{{
alias be='bundle exec'
alias drake="RAILS_ENV=development bin/rake"
alias prake="RAILS_ENV=production bin/rake"
alias trake="RAILS_ENV=test bin/rake"
alias drails="INCLUDE_LIVERELOAD=t LES_VRAIS_BARBUS=t RAILS_ENV=development bin/rails"
alias prails="RAILS_ENV=production bin/rails"
alias trails="RAILS_ENV=test bin/rails"
alias reset_db="drake db:drop && drake db:create && drake db:migrate && drake db:seed"
alias rs="drails s"
alias rc="drails c"

alias pgstart="postgres -D /usr/local/var/postgres"
alias dyndblocal_start="java -Djava.library.path=~/.aws/dynamodb_local_2015-04-27_1.0/DynamoDBLocal_lib -jar ~/.aws/dynamodb_local_2015-04-27_1.0/DynamoDBLocal.jar -port 5678"
alias fd="fake_dynamo"

alias wr="which ruby"
alias rescue_tunnelblick="sudo kextunload -b net.sf.tuntaposx.tap && sudo kextunload -b net.sf.tuntaposx.tun"
alias clean_xcode="rm -rf ~/Library/Developer/Xcode/DerivedData/ && rm -rf ~/Library/Caches/com.apple.dt.Xcode"

alias reload=". ~/.zshrc"

alias pgcli_staging="PGPASSWORD=jol4ev7pe8hyash3jea9hod9 psql -h  octoly-staging.c7qtiwv4d8mv.us-east-1.rds.amazonaws.com -U octolyrds -d octoly_production"

alias octoly='tmux -f ~/.tmux/octoly.conf a'
alias partitio='tmux -f ~/.tmux/partitio.conf a'
alias evc='cd ~/.dotfiles && vim .vimrc'

# }}}

# FUNCTIONS {{{

function migrate() {
  # if we have a name for the migration AND some `field:type` property
  if [ 2 -le $# ]; then
    drails g migration $@
    drake db:migrate

  # if we just have a migration name
  elif [ 1 -le $# ]; then
    drails g migration $@

  # if we have nothing we just migrate the DB
  elif [ 0 -le $# ]; then
    drake db:migrate
  fi
}

function up() {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  git stash save "before updating the master branch" &&
  git co master &&
  git fa &&
  git pullr &&
  git co $current_branch &&
  git rebase master &&
  bundle install &&
  drake db:migrate &&
  git stash pop
}

function deploy() {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  local target_branch=$1
  local force_mode=$2

  git stash save --include-untracked "before deploying '$current_branch' to '$target_branch'" &&
  git pullr &&
  git push &&
  git co $target_branch &&
  git pullr &&
  git merge $current_branch &&
  git push &&
  sh .travis/deploy.sh $target_branch &&
  git co $current_branch &&
  git stash pop
}

function update_current_branch() {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  local source_branch='master'

  # if we have a branch as argument
  if [ 1 -le $# ]; then
    source_branch=$1
  fi

  git stash save "before updating '$current_branch' from '$source_branch'"
  git co $source_branch
  git pullr
  git co $current_branch
  git merge $source_branch
  git stash pop
}

function update_db() {
  echo "dropping db" && drake db:drop
  echo "creating db" && drake db:create
  echo "migrating db" && drake db:migrate

  cd /tmp
  if [ -f /tmp/octoly_production.sql ]; then
    rm -fr /tmp/octoly_production.sql
  fi

  echo "dumping data from production"
  source ~/.env
  ssh octo-redis "PGPASSWORD=$PG_PASS pg_dump --data-only -h $PG_HOST -U $PG_USER -d $PG_DB -c > octoly_production.sql"

  echo "downloading data" && scp octo-redis:/mnt/tmp/octoly_production.sql /tmp
  echo "restoring data"
  PGPASSWORD=octoly psql -U octoly -d octoly_development < octoly_production.sql

  echo "clean production" && ssh octo-redis 'rm -fr /mnt/tmp/octoly_production.sql'
  cd -
}

# }}}

# vim: foldmarker={{{,}}} foldmethod=marker foldlevel=0:
