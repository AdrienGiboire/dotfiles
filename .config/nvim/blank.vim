runtime macros/matchit.vim
set nocompatible
filetype indent plugin on

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean packadd minpac | source $MYVIMRC | call minpac#clean()

packadd minpac

call minpac#init({'verbose': 0})
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')
