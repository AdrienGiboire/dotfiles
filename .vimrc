" Vundle Stuff {{{

" be iMproved
set nocompatible " Required by Vundle
filetype off     " Required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" bundles
Plugin 'AdrienGiboire/vim-todo'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'caigithub/a_indent'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner' " A simple, vimscript only, command runner for sending commands from vim to tmux.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'junegunn/vim-easy-align'
Plugin 'lmeijvogel/vim-yaml-helper' " Helper methods for Yaml navigation in vim
Plugin 'mileszs/ack.vim'
Plugin 'nanotech/jellybeans.vim' " Color
Plugin 'neoclide/vim-jsx-improve' " Syntax and indent plugin for React JSX.
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'slim-template/vim-slim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler' " Lightweight support for Ruby's Bundler
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive' " a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-rails' " Ruby on Rails power tools
Plugin 'tpope/vim-rhubarb' " GitHub extension for fugitive.vim
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plugin 'tpope/vim-vinegar' " combine with netrw to create a delicious salad dressing

call vundle#end()
filetype plugin indent on

" }}}

" GENERAL {{{

setlocal foldmethod=marker
colorscheme jellybeans

let mapleader = ","
let maplocalleader = '\'

source ~/.vim/functions/util.vim

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

map <C-n> :NERDTreeToggle<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>ag :Ack!<space>

set path+=**

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>ea <Plug>(EasyAlign)

" }}}

" PLUGINS CONFIGURATION {{{
" todo
nnoremap <Leader>td :e ~/ownCloud/todo.todo<CR>
" Xuyuanp/nerdtree-git-plugin
" caigithub/a_indent
" christoomey/vim-tmux-navigator
" christoomey/vim-tmux-runner

" ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode = ''

" groenewege/vim-less
" junegunn/vim-easy-align

" lmeijvogel/vim-yaml-helper
let g:vim_yaml_helper#auto_display_path = 1

" mileszs/ack.vim
" nanotech/jellybeans.vim
" neoclide/vim-jsx-improve
" pangloss/vim-javascript
" plasticboy/vim-markdown
" scrooloose/nerdtree
" sheerun/vim-polyglot
" slim-template/vim-slim

" tacahiroy/ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<CR>
" Narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky '.expand('<cword>')<CR>

" thoughtbot/vim-rspec
" tpope/vim-bundler
" tpope/vim-dispatch
" tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gdel :Gdelete<CR>
nnoremap <Leader>gmov :Gmove<CR>

" tpope/vim-rails
" tpope/vim-rhubarb
" tpope/vim-surround
" tpope/vim-unimpaired
" tpope/vim-vinegar
" }}}

" UI {{{
" Highlight current line only on focused window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l
set statusline+=/ " Separator
set statusline+=%L " Total lines

" }}}

" HTML {{{
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
" }}}

" CSS {{{
" }}}

" JS {{{
" }}}

" GIT {{{
autocmd Filetype gitcommit setlocal spell textwidth=72

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

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
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

" Begining & End of line in mode
noremap H ^
noremap L g_

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

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[


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

noremap K <nop>

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
nnoremap <leader>wq :w!<cr>:Bclose<cr>

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
set relativenumber

set regexpengine=1

set noeol
set ruler

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,node_modules,tmp,*/public/production
set wildmode=full
set wildmenu

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.  When the file
" has been deleted this is not done.
set autoread

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

set tags=./.tags;

" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

" make copy/paste from system clip easier
vnoremap <silent><leader>y "*y
vnoremap <silent><leader>p "*p

set completeopt-=preview

" }}}

noremap <C-s> <ESC>:w<CR>
noremap <silent><leader>rc :VtrSendCommandToRunner rc<CR>
noremap <silent><leader>rp :VtrSendLinesToRunner<CR>
noremap <silent><leader>rd :VtrSendCtrlD<CR>

" vim: foldmethod=marker foldmarker={{{,}}} foldlevel=0
