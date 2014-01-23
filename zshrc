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
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'

# PolySpot
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home'
export CATALINA_OPTS='-Dpolyspot.home=/Users/Adrien/code/polyspot/standaloneHome -Dinstance.id=Default_matrix_ui'
alias tomstart='/usr/local/bin/apache-tomcat-7.0.41/bin/startup.sh && tail -f /usr/local/bin/apache-tomcat-7.0.41/logs/catalina.out ~/code/polyspot/standaloneHome/logs/matrix.log'
alias tomstop='/usr/local/bin/apache-tomcat-7.0.41/bin/shutdown.sh'

alias cm='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/customer/service/gui/'
alias sg='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/schneider/gui/'
alias startpesl='sh /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/bin/startall.sh && tail -f /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/home/logs/catalina.out'
alias stoppesl='sh /Users/Adrien/code/polyspot/polyspot-community-package-6.3.0-SNAPSHOT/bin/stopall.sh'
alias acm='cd /Users/Adrien/code/polyspot/cm/cm-angular/sara-manager'

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/adrien/android-sdk/sdk/platform-tools:$PATH
export PATH=/Users/Adrien/Library/Python/2.7/bin:$PATH

export PGDATA='/usr/local/var/postgres/data'

. '/Users/Adrien/code/powerline/powerline/bindings/zsh/powerline.zsh'
