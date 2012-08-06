# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="whoshallsucceed"

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

alias l="ls -aAGpl"
alias f="grep -Rn"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew bundler gem git-flow github pow rails3 ruby rvm ssh-agent)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=/Users/adrien/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/Users/adrien/node_modules/coffee-script/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
