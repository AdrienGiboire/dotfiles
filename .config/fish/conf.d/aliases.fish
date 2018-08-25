# Long, full, colorized output, add file type indicator, and put sizes in human readable format
alias ls='ls -laGFh'
alias l='ls'
alias ..='cd ..'
alias ...='..;..'

alias less='less --quiet'

# Rails {{{

alias be='bundle exec'
alias drake="set RAILS_ENV development; and bin/rake"
alias prake="set RAILS_ENV production; and bin/rake"
alias trake="set RAILS_ENV test; and bin/rake"
alias drails="set INCLUDE_LIVERELOAD t; and set LES_VRAIS_BARBUS t; and set RAILS_ENV development; and bin/rails"
alias prails="set RAILS_ENV production; and bin/rails"
alias trails="set RAILS_ENV test; and bin/rails"
alias reset_db="drake db:drop; and drake db:create; and drake db:migrate; and drake db:seed"
alias rs="drails s"
alias rc="drails c"

# }}}

alias pgstart="brew services start postgresql"
alias start="./start.rb -b 0.0.0.0 --port 3002 --no-restart-redis --no-restart-dynamo"

alias wr="which ruby"
alias rescue_tunnelblick="sudo kextunload -b net.sf.tuntaposx.tap; and sudo kextunload -b net.sf.tuntaposx.tun"
alias clean_xcode="rm -rf ~/Library/Developer/Xcode/DerivedData/; and rm -rf ~/Library/Caches/com.apple.dt.Xcode"

alias reload=". ~/.zshrc"

alias pgcli_staging="set PGPASSWORD jol4ev7pe8hyash3jea9hod9; and psql -h  octoly-staging.c7qtiwv4d8mv.us-east-1.rds.amazonaws.com -U octolyrds -d octoly_production"

alias octoly='tmux -f ~/.tmux/octoly.conf a'
alias partitio='tmux -f ~/.tmux/partitio.conf a'

alias config="/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias clean_locales='rm config/locales/de-DE.yml config/locales/en-US.yml config/locales/fr-FR.yml config/locales/es-ES.yml config/locales/it-IT.yml; drake phraseapp:download'

# alias vim='nvim'
# alias vi='nvim'
alias pvim='vim -u ~/code/essential.vim'
alias n='nvim'
alias nt='nvim +terminal'

alias web-ext-sign='web-ext sign --api-key user:6364965:835 --api-secret 46f252c86675e20a2d5ab3d989bb16686b277fd6c7e38658f73168867487dc37'

alias todo='nvim ~/code/notes/todo.todo'
alias journal='nvim ~/code/notes/journal.md'
