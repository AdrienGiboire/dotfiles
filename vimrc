" be iMproved
set nocompatible
filetype off

" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
endif
" }}}

let mapleader = ","
let maplocalleader = '\'

" Local vimrc configuration {{{
let s:localrc = expand($HOME . '/.vim/local.vimrc')
if filereadable(s:localrc)
    exec ':so ' . s:localrc
endif
" }}}

" PACKAGE LIST {{{
" Use this variable inside your local configuration to declare
" which package you would like to include
if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'fancy', 'coding', 'ruby', 'html', 'css', 'js', 'color']
endif
" }}}

" VUNDLE {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" }}}

" PACKAGES {{{

" _. General {{{
if count(g:vimified_packages, 'general')
    Bundle "mileszs/ack.vim"
    nnoremap <leader>a :Ack!<space>

    Bundle 'matthias-guenther/hammer.vim'
    nmap <leader>p :Hammer<cr>

    Bundle 'tsaleh/vim-align'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'kana/vim-textobj-user'

    Bundle 'michaeljsmith/vim-indent-object'
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

    Bundle 'kien/ctrlp.vim'
    Bundle 'vim-scripts/scratch.vim'
endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
    Bundle 'Lokaltog/vim-powerline'
    let g:Powerline_symbols = 'fancy'
    let g:Powerline_cache_enabled = 1
endif
" }}}

" _. OS {{{
if count(g:vimified_packages, 'os')
    Bundle 'zaiste/tmux.vim'
    Bundle 'benmills/vimux'
    map <Leader>rp :PromptVimTmuxCommand<CR>
    map <Leader>rl :RunLastVimTmuxCommand<CR>

    vmap <LocalLeader>rs "vy :call RunVimTmuxCommand(@v . "\n", 0)<CR>
    nmap <LocalLeader>rs vip<LocalLeader>rs<CR>
endif
" }}}

" _. Coding {{{

if count(g:vimified_packages, 'coding')
    Bundle 'majutsushi/tagbar'
    Bundle 'gregsexton/gitv'

	Bundle 'sjl/splice.vim', {'rtp': '~/.vim/bundle/splice.vim/'}

    Bundle 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    " --

    autocmd FileType gitcommit set tw=68 spell
endif
" }}}

" _. Ruby {{{
if count(g:vimified_packages, 'ruby')
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'tpope/vim-rails'
    Bundle 'nelstrom/vim-textobj-rubyblock'
    Bundle 'ecomba/vim-ruby-refactoring'

    autocmd User Rails set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
endif
" }}}

" _. HTML {{{
if count(g:vimified_packages, 'html')
    Bundle 'tpope/vim-haml'
    Bundle 'tpope/vim-markdown'
endif
" }}}

" _. CSS {{{
" }}}

" _. JS {{{
if count(g:vimified_packages, 'js')
    Bundle 'kchmck/vim-coffee-script'
	au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
	au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
endif
" }}}

" _. Clojure {{{
if count(g:vimified_packages, 'clojure')
    Bundle 'zaiste/VimClojure'

    let vimclojure#HighlightBuiltins=1
    let vimclojure#ParenRainbow=0
endif
" }}}

" _. Haskell {{{
if count(g:vimified_packages, 'haskell')
    Bundle 'Twinside/vim-syntax-haskell-cabal'
    Bundle 'lukerandall/haskellmode-vim'

    au BufEnter *.hs compiler ghc

    let g:ghc = "/usr/local/bin/ghc"
    let g:haddock_browser = "open"
endif
" }}}

" _. Color {{{
if count(g:vimified_packages, 'color')
    Bundle 'tomasr/molokai'
endif
" }}}

" }}}

" General {{{
filetype plugin indent on
colorscheme molokai
set background=light
syntax on

" Set 5 lines to the cursor - when moving vertically
set scrolloff=5

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

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

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Since <C-j> & <C-k> do nothing, I prefer those to go up and go down by page
noremap <C-j> 10j
noremap <C-k> 10k

nmap ; :

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Fast saving
nmap <leader>ww :w!<cr>
" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" }}}

" . abbrevs {{{
"
iabbrev a@ adrien@adyoulike.com

" . }}}

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

set modelines=0
set noeol
set relativenumber
set numberwidth=10
set ruler
set shell=/bin/zsh
set showcmd

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=2
set softtabstop=2
set textwidth=80
set shiftwidth=2
set expandtab
set wrap
set formatoptions=qrn1
set colorcolumn=+1
" }}}

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu

set dictionary=/usr/share/dict/words
" }}}

" Triggers {{{

" Save when losing focus
au FocusLost    * :silent! wall
"
" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" . searching {{{

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

" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}

" }}}

" Navigation & UI {{{

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" . folding {{{

set foldlevelstart=0
set foldmethod=syntax
set nofoldenable

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}

" Quick editing {{{

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" }}}

" _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" EXTENSIONS {{{

" _. Scratch {{{

command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}

" _. Gist {{{
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" }}}

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}

" Buffer Handling {{{
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
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>

" }}}

" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vimrc"))
  source ~/.vim/after.vimrc
endif
" }}}
