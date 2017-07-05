" be iMproved
set nocompatible
filetype off
setlocal foldmethod=marker

let mapleader = ","
let maplocalleader = '\'

" UTILS {{{
source ~/.vim/functions/util.vim
" }}}

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" }}}

" GENERAL {{{
" sensible.vim: Defaults everyone can agree on
Plugin 'tpope/vim-sensible'

Plugin 'christoomey/vim-tmux-runner'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
let g:ctrlp_working_path_mode = ''

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>

Plugin 'tpope/vim-dispatch'

Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>ag :Ack!<space>

set path+=**

Plugin 'sheerun/vim-polyglot'

Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>ea <Plug>(EasyAlign)

" surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" vinegar.vim: combine with netrw to create a delicious salad dressing
Plugin 'tpope/vim-vinegar'

" unimpaired.vim: pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

" }}}

" UI {{{
" Highlight current line only on focused window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Set up a 80 columns guideline
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
set colorcolumn=80

Plugin 'christoomey/vim-tmux-navigator'
" }}}

" RUBY {{{
" rails.vim: Ruby on Rails power tools
Plugin 'tpope/vim-rails'
" bundler.vim: Lightweight support for Ruby's Bundler
Plugin 'tpope/vim-bundler'
Plugin 'sunaku/vim-ruby-minitest'
set completefunc=syntaxcomplete#Complete

noremap <Leader>ta :execute ":!bundle exec rspec spec"<CR>
noremap <Leader>tc :execute ":!bundle exec rspec ". expand('%')<CR>
noremap <Leader>ts :execute ":!bundle exec rspec ". expand('%') .":". line('.')<CR>
" }}}

" HTML {{{
Plugin 'plasticboy/vim-markdown'
Plugin 'slim-template/vim-slim'
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
" }}}

" CSS {{{
Plugin 'groenewege/vim-less'
" }}}

" JS {{{
Plugin 'pangloss/vim-javascript'
" }}}

" GIT {{{
autocmd Filetype gitcommit setlocal spell textwidth=72

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" rhubarb.vim: GitHub extension for fugitive.vim
Plugin 'tpope/vim-rhubarb'
" }}}

" BACKUPS {{{
"
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set viewdir=~/.vim/tmp/views//    " view files

" silently create directories if they don't exist
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
silent execute '!mkdir -p $HOME/.vim/tmp/swap'

au BufWinLeave \* silent! mkview  " make vim save view (state) (folds, cursor, etc)
au BufWinEnter \* silent! loadview " make vim load view (state) (folds, cursor, etc)

set backup
set noswapfile
" }}}

" WHITE CHARACTERS {{{
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set wrap
" }}}

" TRAILING WHITESPACE {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <leader>ss :ShowSpaces 1<CR>

autocmd FileType css :TrimSpaces
autocmd FileType scss :TrimSpaces
autocmd FileType javascript :TrimSpaces
autocmd FileType ruby :TrimSpaces
autocmd FileType sh :TrimSpaces
autocmd FileType java :TrimSpaces

" }}}

" SEARCHING {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" }}}

" NAVIGATION & UI {{{

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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

" Tweak window height with a fast double button press
nnoremap -- <C-w>-
nnoremap ++ <C-w>+

" Jump to paragraph ends
vnoremap g{ :exe "norm m`gv``k".v:count1."{j"<CR>``j``
vnoremap g} :exe "norm m`gv``j".v:count1."}k"<CR>``k``
nnoremap g{ :exe "norm k".v:count1."{j"<CR>``j``
nnoremap g} :exe "norm j".v:count1."}k"<CR>``k``

" }}}

" TEXT OBJECTS {{{

  set foldmethod=syntax
  set foldnestmax=5
  set foldlevel=1

  " Shortcut for [] motion
  onoremap ir i[
  onoremap ar a[
  vnoremap ir i[
  vnoremap ar a[

  Plugin 'caigithub/a_indent'

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

" }}}

" BUFFER HANDLING {{{

  " Visit http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window
  " to learn more about :Bclose

  " Delete buffer while keeping window layout (don't close buffer's windows).
  " Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
  if v:version < 700 || exists('loaded_bclose') || &cp
    finish
  endif
  let loaded_bclose = 1
  if !exists('bclose_multiple')
    let bclose_multiple = 1
  endif

  " Display an error message.
  function! s:Warn(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl NONE
  endfunction

  " Command ':Bclose' executes ':bd' to delete buffer in current window.
  " The window will show the alternate buffer (Ctrl-^) if it exists,
  " or the previous buffer (:bp), or a blank buffer if no previous.
  " Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
  " An optional argument can specify which buffer to close (name or number).
  function! s:Bclose(bang, buffer)
    if empty(a:buffer)
      let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
      let btarget = bufnr(str2nr(a:buffer))
    else
      let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
      call s:Warn('No matching buffer for '.a:buffer)
      return
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
      call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
      return
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
      call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
      return
    endif
    let wcurrent = winnr()
    for w in wnums
      execute w.'wincmd w'
      let prevbuf = bufnr('#')
      if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
        buffer #
      else
        bprevious
      endif
      if btarget == bufnr('%')
        " Numbers of listed buffers which are not the target to be deleted.
        let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
        " Listed, not target, and not displayed.
        let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
        " Take the first buffer, if any (could be more intelligent).
        let bjump = (bhidden + blisted + [-1])[0]
        if bjump > 0
          execute 'buffer '.bjump
        else
          execute 'enew'.a:bang
        endif
      endif
    endfor
    execute 'bdelete'.a:bang.' '.btarget
    let g:last_buffer = expand('%:p')
    execute wcurrent.'wincmd w'
  endfunction
  command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
  nnoremap <silent> <Leader>bd :Bclose<CR>

  " Save last closed buffer
  au! BufDelete * let g:last_buffer = expand('%:p')
  " Open last closed buffer with `,bl` mapping
  map <silent> <leader>bl :exec ':e '. g:last_buffer<CR>

" }}}

" MISC {{{

syntax on

" Set 5 lines to the cursor - when moving vertically
set scrolloff=5

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys. Learn the Hard Way!
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Yank from current cursor position to end of line
map Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap jk <Esc>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Wq :wq
command! Q :q

" Why a command used so much needs more keystroke than a barely known command?
nnoremap ; :
nnoremap : ;

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Make u/U behave for undo like n/N does for search
nnoremap U <c-r>

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

set backspace=indent,eol,start
set encoding=utf-8
set hidden
set laststatus=2
set history=1000
set incsearch
set list
set listchars=trail:⌴

set exrc
set secure

set shell=zsh\ -l

" needed to improve vim performances with folding on and working on ruby/yaml
" files
set lazyredraw
set number
set regexpengine=1

set noeol
set ruler

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,node_modules,tmp,*/public/production
set wildmenu

" }}}

call vundle#end()

filetype plugin indent on

" vim: foldmethod=marker foldmarker={{{,}}} foldlevel=0
