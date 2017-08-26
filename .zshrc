#!/bin/zsh

# CHRUBY {{{

[[ -s /usr/local/opt/chruby/share/chruby/chruby.sh ]] && . /usr/local/opt/chruby/share/chruby/chruby.sh
[[ -s /usr/local/opt/chruby/share/chruby/auto.sh ]] && . /usr/local/opt/chruby/share/chruby/auto.sh

# }}}

source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/functions/rails.zsh
source ~/.zsh/functions/postgres.zsh
source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/setopts.zsh

# Disable auto-correct
unsetopt correct_all

# BUNDLER EXEC {{{

[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

# }}}

# AUTOJUMP {{{

command -v brew >/dev/null 2>&1 && [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# }}}

# vim: foldmarker={{{,}}} foldmethod=marker foldlevel=0:
