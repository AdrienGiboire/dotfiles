runtime macros/matchit.vim
set nocompatible
filetype indent plugin on

command! PackUpdate packadd minpac | source ~/.config/nvim/blank.vim | redraw | call minpac#update()
command! PackClean packadd minpac | source ~/.config/nvim/blank.vim | call minpac#clean()

packadd minpac

call minpac#init({'verbose': 0})
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })
