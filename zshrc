# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Aliases {{{

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'
alias ..='cd ..'
alias ...='..;..'

alias c='cd ~/code'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'

# PolySpot {{{
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home'
export CATALINA_OPTS='-Dpolyspot.home=/Users/Adrien/code/polyspot/standaloneHome -Dinstance.id=Default_matrix_ui'
alias tomstart='/usr/local/bin/apache-tomcat-7.0.41/bin/startup.sh && tail -f /usr/local/bin/apache-tomcat-7.0.41/logs/catalina.out ~/code/polyspot/standaloneHome/logs/matrix.log'
alias tomstop='/usr/local/bin/apache-tomcat-7.0.41/bin/shutdown.sh'

alias cm='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/customer/service/gui/'
alias sg='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/schneider/gui/'
alias startpesl='sh /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/bin/startall.sh && tail -f /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/home/logs/catalina.out && tail -f /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/home/logs/engine.log'
alias stoppesl='sh /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/bin/stopall.sh'
alias acm='cd /Users/Adrien/code/polyspot/cm/cm-angular/sara-manager'
# }}}

# }}}

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Red dots will be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

plugins=(brew git git-flow vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/adrien/android-sdk/sdk/platform-tools:$PATH
export PATH=/Users/Adrien/Library/Python/2.7/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PGDATA='/usr/local/var/postgres/data'

. '/Users/Adrien/code/powerline/powerline/bindings/zsh/powerline.zsh'

export LANG=en_US.UTF-8
