# /etc/zsh/zshrc ou ~/.zshrc
# Fichier de configuration principal de zsh, lu au lancement des shells interactifs
# (et non des shells d'interprétation de fichier)

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'

alias c='cd ~/code'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
alias m='mutt -y'
alias md='mkdir'
alias rd='rmdir'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'

alias tomstart='/usr/local/bin/apache-tomcat-7.0.41/bin/startup.sh'
alias tomstop='/usr/local/bin/apache-tomcat-7.0.41/bin/shutdown.sh'

# Le logiciel autojump <https://github.com/joelthelion/autojump> fournit un
# moyen d'accéder rapidement aux répertoires fréquemment visités, en tapant
# simplement �un_bout_du_nom_du_répertore"». Si vous souhaitez l'utiliser,
# installez le paquet autojump et décommentez la ligne suivant :
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/share/npm/bin:$PATH

autoload -Uz promptinit
promptinit
prompt adam2
