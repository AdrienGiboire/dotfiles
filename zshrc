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

alias tomstart='/usr/local/bin/apache-tomcat-7.0.41/bin/startup.sh'
alias tomstop='/usr/local/bin/apache-tomcat-7.0.41/bin/shutdown.sh'

# PolySpot
alias cm='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/customer/service/gui/'
alias sg='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/schneider/gui/'
alias acm='cd /usr/local/bin/apache-tomcat-7.0.41/webapps/customer/service/admin-customer-matrix/src/main/webapp/gui'

# Le logiciel autojump <https://github.com/joelthelion/autojump> fournit un
# moyen d'accéder rapidement aux répertoires fréquemment visités, en tapant
# simplement �un_bout_du_nom_du_répertore"». Si vous souhaitez l'utiliser,
# installez le paquet autojump et décommentez la ligne suivant :
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/adrien/android-sdk/sdk/platform-tools:$PATH

autoload -Uz promptinit
promptinit
prompt adam2
