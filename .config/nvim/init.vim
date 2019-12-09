set nocompatible
filetype plugin indent on
syntax on

source ~/.config/nvim/defaults.vim

source ~/.config/nvim/packages.vim

source ~/.config/nvim/abbreviations.vim
source ~/.config/nvim/backups.vim
source ~/.config/nvim/buffers.vim
source ~/.config/nvim/commands.vim
source ~/.config/nvim/filetypes.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/navigation.vim
source ~/.config/nvim/searching.vim
source ~/.config/nvim/terminal.vim
source ~/.config/nvim/trailing_whitespaces.vim
source ~/.config/nvim/ui.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/vim-markdown.vim
source ~/.config/nvim/visual-at.vim

if filereadable('.local.vim')
  so .local.vim
endif
