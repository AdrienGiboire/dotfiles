tnoremap jk <C-\><C-n>
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l

if has('nvim')
  fu! OpenTerminal()
   " open split windows on the topleft
   topleft split
   " resize the height of terminal windows to 30
   resize 30
   :terminal
  endf
else
  fu! OpenTerminal()
   " open split windows on the topleft
   topleft split
   " resize the height of terminal windows to 30
   resize 30
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif

nnoremap <F4> :call OpenTerminal()<CR>
