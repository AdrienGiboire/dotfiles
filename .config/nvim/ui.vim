" Highlight current line only on focused window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set statusline=%F\ %m%r%h%w%q\ " fullpath and status modified sign
set statusline+=\ %y " filetype
set statusline+=\ %{fugitive#statusline()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l:%c
set statusline+=/ " Separator
set statusline+=%L " Total lines

colorscheme jellybeans
