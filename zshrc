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
# }}}

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Red dots will be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

plugins=(brew git git-flow)

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

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PGDATA='/usr/local/var/postgres/data'

. '/Users/Adrien/code/powerline/powerline/bindings/zsh/powerline.zsh'

export LANG=en_US.UTF-8

# Ensures that $terminfo values are valid and updates editor information when
# the keymap changes.
function zle-keymap-select zle-line-init zle-line-finish {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey -v

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
