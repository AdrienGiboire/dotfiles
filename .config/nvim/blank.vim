runtime macros/matchit.vim
set nocompatible
filetype indent plugin on

command! PackUpdate packadd minpac | source ~/.config/nvim/blank.vim | redraw | call minpac#update()
command! PackClean packadd minpac | source ~/.config/nvim/blank.vim | call minpac#clean()

call plug#begin('~/.config/nvim/pack')

Plug 'k-takata/minpac'
Plug 'neoclide/coc.nvim'

call plug#end()
