# Long, full, colorized output, add file type indicator, and put sizes in human readable format
alias ls='ls -laGFh'
alias l='ls'
alias ..='cd ..'
alias ...='..;..'

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

# }}}

alias pgstart="postgres -D /usr/local/var/postgresql"
alias start="./start.rb --bind 0.0.0.0 --port 3002 --no-restart-redis --no-restart-dynamo"

alias wr="which ruby"
alias rescue_tunnelblick="sudo kextunload -b net.sf.tuntaposx.tap && sudo kextunload -b net.sf.tuntaposx.tun"
alias clean_xcode="rm -rf ~/Library/Developer/Xcode/DerivedData/ && rm -rf ~/Library/Caches/com.apple.dt.Xcode"

alias reload=". ~/.zshrc"

alias pgcli_staging="PGPASSWORD=jol4ev7pe8hyash3jea9hod9 psql -h  octoly-staging.c7qtiwv4d8mv.us-east-1.rds.amazonaws.com -U octolyrds -d octoly_production"

alias octoly='tmux -f ~/.tmux/octoly.conf a'
alias partitio='tmux -f ~/.tmux/partitio.conf a'

alias config='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias clean_locales='rm config/locales/de-DE.yml config/locales/en-US.yml config/locales/fr-FR.yml config/locales/es-ES.yml config/locales/it-IT.yml; drake phraseapp:download'

alias vim='nvim'
alias vi='nvim'
alias n='nvim'
alias nt='nvim +terminal'
