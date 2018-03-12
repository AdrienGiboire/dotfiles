let mapleader = "\<Space>"
let maplocalleader = '\' " better ESC

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Make u/U behave for undo like n/N does for search
nnoremap U <c-r>

inoremap jk <Esc>

" Why a command used so much needs more keystroke than a barely known command?
nnoremap ; :
nnoremap : ;

let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>ag :Ack!<space>

" todo
"nnoremap <Leader>td :e ~/code/todo.todo<CR>
nnoremap <Leader>td :e ~/Documents/dotplans/

" ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode = ''

" tacahiroy/ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<CR>
" Narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky '.expand('<cword>')<CR>

" tpope/vim-fugitive
nnoremap <Leader>ga :Gw<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gpo :Gpush<CR>
nnoremap <Leader>gpr :Git pullr<CR>
nnoremap <Leader>gdel :Gdelete<CR>
nnoremap <Leader>gmov :Gmove<CR>

" Simulate emacs' transpose-word feature, including its inverse
" Note: Doesn't work well with words that include punctuation
nnoremap <Leader><Leader>l /\<<CR>yiw?\<<CR>viwp/\<<CR>viwp:noh<CR>
nnoremap <Leader><Leader>h ?\w\><CR>yiw/\<<CR>viwp?\w\><CR>viwp:noh<CR>

" find git's inline diffs more easily
nnoremap <Leader>fd /<<<<<<\_.\{-}>>>>>>.*<CR>

" * and # for selected text, trying to keep the search literal (in case of
" filenames, for example.)
xnoremap * y/\V<c-r>=escape(@", '/\')<cr><cr>
xnoremap # y?\V<c-r>=escape(@", '?\')<cr><cr>

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys. Learn the Hard Way!
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

noremap K <nop>

" Yank from current cursor position to end of line
map Y y$

" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nnoremap <leader>wq :w!<cr>:Bclose<cr>

" make copy/paste from system clip easier
vnoremap <silent><leader>y "*y
vnoremap <silent><leader>p "*p

noremap <C-s> <ESC>:w<CR>

nnoremap <leader>ls :buffers<CR>:buffer<Space>

nnoremap <leader>u yypVr-
nnoremap <leader>U yypVr=

" windows
nnoremap <silent> <C-w>i :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-w>u :exe "resize " . (winheight(0) * 3/2)<CR>

nnoremap <leader>s vip:sort<cr>

nnoremap <leader>t :tabe<cr>

iab <expr> tts strftime("%T")
iab <expr> dts strftime("%a %d %b %Y")

