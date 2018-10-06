# SETUP TERMINAL, AND TURN ON COLORS
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# ENABLE COLOR IN GREP
export GREP_COLOR='3;33'

export EDITOR='nvim'
export HOMEBREW_EDITOR='nvim'
export LESS='--ignore-case --raw-control-chars'
# CTAGS Sorting in Vim is better behaved with this in place
export LC_COLLATE=C

# COMPILATION FLAGS
# This resolves issues install the mysql, postgres, and other gems with native
# non universal binary extensions
export ARCHFLAGS="-arch x86_64"

# POSTGRES DATA FILE PATH
export PGDATA='/usr/local/var/postgres/data'

# SET LOCALE
export LANG=en_US.UTF-8

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# vim: foldmarker={{{,}}} foldmethod=marker foldlevel=0:
