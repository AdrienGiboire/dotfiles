# /etc/zsh/zshenv ou ~/.zshenv
# Fichier de configuration de zsh, lu au lancement de tout shell Zsh

# Le PATH = répertoires dans lequels le shell va chercher les commandes
# ATTENTION : le répertoire courant ne fait pas partie du PATH
export PATH="/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin/X11"
export PATH="$PATH:/usr/X11R6/bin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/sbin"
export PATH="$PATH:$HOME/bin"

# Viewer/Editeur par defaut (pour Crontab, CVS,...)
export VISUAL=vim
export EDITOR=vim

# Permissions rw-r--r-- pour les fichiers crées
# et rwxr-xr-x pour les répertoires crées
umask 022

# Ne pas passer par le proxy pour les domaines locaux
#export no_proxy="exemple.org"

# De la couleur pour grep
export GREP_OPTIONS='--color=auto'
