" Begining & End of line in mode
noremap <c-a> ^
noremap <c-e> g_

" more natural movement with wrap on  but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Jump to paragraph ends
vnoremap g{ :exe "norm m`gv``k".v:count1."{j"<CR>``j``
vnoremap g} :exe "norm m`gv``j".v:count1."}k"<CR>``k``
nnoremap g{ :exe "norm k".v:count1."{j"<CR>``j``
nnoremap g} :exe "norm j".v:count1."}k"<CR>``k``
