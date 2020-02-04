" vim: filetype=vim foldmethod=marker foldlevel=0 foldcolumn=3

" GENERAL SETTINGS {{{
set nocompatible
filetype plugin indent on
syntax on

set autoindent

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.  When the file
" has been deleted this is not done.
set autoread

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
let &showbreak='↪ '

set backspace=indent,eol,start
set breakindent
set completeopt-=preview
set cmdheight=2
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
set foldlevel=1

" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

set history=1000
set inccommand=split
set incsearch
set laststatus=2

" needed to improve vim performances with folding on and working on ruby/yaml files
set lazyredraw

set list
set listchars=tab:▸\ ,eol:¬,trail:⌴
set modelines=5

set nobackup
set noeol
set nohidden
set nojoinspaces
set noswapfile
set nowritebackup

set number
set regexpengine=1
set relativenumber
set ruler

" Set 5 lines to the cursor - when moving vertically
set scrolloff=5

set secure
set shiftwidth=2

" don't give |ins-completion-menu| messages
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set softtabstop=2
set tabstop=2

set visualbell t_vb=

set wildignore=**/.svn/**
set wildignore+=**/CVS/**
set wildignore+=**/.git/**
set wildignore+=**/.hg/**
set wildignore+=**/*.o
set wildignore+=**/*.a
set wildignore+=**/*.class
set wildignore+=**/*.mo
set wildignore+=**/*.la
set wildignore+=**/*.so
set wildignore+=**/*.obj
set wildignore+=**/*.swp
set wildignore+=**/*.jpg
set wildignore+=**/*.png
set wildignore+=**/*.xpm
set wildignore+=**/*.gif
set wildignore+=**/.DS_Store
set wildignore+=**/*.aux
set wildignore+=**/*.out
set wildignore+=**/*.toc
set wildignore+=**/node_modules/**
set wildignore+=**/tmp/**

set wildmenu
set wildmode=full
set wildignorecase
set wrap

augroup netrw_buf_hidden_fix
  autocmd!

  " Set all non-netrw buffers to bufhidden=hide
  autocmd BufWinEnter *
        \  if &ft != 'netrw'
        \|     set bufhidden=hide
        \| endif
augroup end

augroup neovim_terminal
  autocmd!
  autocmd TermOpen * set nonumber norelativenumber
  autocmd TermOpen * startinsert
augroup END
" }}}
" PLUGINS {{{1
runtime macros/matchit.vim

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

packadd minpac
call minpac#init({'verbose': 3})

call minpac#add('AdrienGiboire/vim-todo')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-repeat') " enable repeating supported plugin maps with '.'
call minpac#add('tpope/vim-unimpaired')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('olical/vim-enmasse')
call minpac#add('taniarascia/new-moon.vim')
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-surround')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('majutsushi/tagbar')
call minpac#add('nathanaelkane/vim-indent-guides')
" }}}
" MAPPINGS {{{1
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

" Fast saving and closing current buffer without closing windows displaying
" the buffer
nnoremap <leader>wq :w!<cr>:Bclose<cr>
nnoremap <leader>bc :Bclose<CR>

" make copy/paste from system clip easier
vnoremap <leader>y "*y
vnoremap <leader>p "*p

noremap <C-s> <ESC>:w<CR>

nnoremap <leader>u yypVr-
nnoremap <leader>U yypVr=

" windows
nnoremap <<C-w>i :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <<C-w>u :exe "resize " . (winheight(0) * 3/2)<CR>

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" tags {{{2
" Instead of :tag jumping to first match definition, it jumps to the
" definition if there is only one match. Else, it displays a list of all
" matching tags.
nnoremap <C-]> g<C-]>
" }}}
" netrw {{{2
nnoremap - :edit %:p:h<CR>
" }}}
" }}}
" PLUGINS SETTINGS {{{1
" Fugitive {{{2
nnoremap <leader>ga :Gw<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gdel :Gdelete<CR>
nnoremap <leader>gdi :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gmov :Gmove<CR>
nnoremap <leader>gpo :Gpush<CR>
nnoremap <leader>gpr :Git pullr<CR>i
nnoremap <leader>gs :Gstatus<CR>
" }}}
" THEME {{{2
set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

call minpac#add('altercation/vim-colors-solarized')
set background=dark
colorscheme solarized
" }}}
" FZF {{{2
set rtp+=/usr/local/opt/fzf

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --exclude build --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" terminal options
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=10

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

function! s:with_agignore(bang, args)
  let agignore = '/tmp/agignore-for-fzf'
  let entries = split(&wildignore, ',')
  let source = 'ag --path-to-ignore '.agignore.' -g ""'
  call writefile(entries, agignore)
  call fzf#vim#files(a:args, fzf#vim#with_preview({'source': source}))
endfunction

autocmd VimEnter * command! -bang -nargs=? -complete=dir Files
      \ call s:with_agignore(<bang>0, <q-args>)

nnoremap <C-p> :Files<CR>
nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>t :Tags<CR>
" }}}
" JavaScript {{{2
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

call minpac#add('posva/vim-vue')
"}}}
" tagbar {{{2
let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:Array/Arrays',
      \ 'P:Property/Properties',
      \ 'T:Tag/Tags',
      \ 'O:Object/Objects',
      \ 'G:Generator/Generators',
      \ 'F:Function/Functions',
      \ 'C:Class/Classes',
      \ 'M:Method/Methods',
      \ 'V:Variable/Variables',
      \ 'I:Import/Imports',
      \ 'E:Export/Exports',
      \ 'S:StyledComponent/StyledComponents'
      \ ]}
" }}}
" multiple cursors {{{2
let g:multi_cursor_exit_from_insert_mode=0
" }}}
" ACK/AG {{{2
let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'
nnoremap <leader>ag :Ack!<space>
nnoremap <M-k> :Ack! "\b<cword>\b"<CR>
" }}}
" tagbar {{{2
let g:tagbar_show_linebumbers = 1
nnoremap <C-t> :TagbarToggle<CR>
" }}}
" indent guides {{{2
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
" }}}
" }}}
" ABBREVIATIONS {{{1
iab @@p adrien@sent.com
iab rtfm Read The Fantastic Manual
iab tts strftime("%T")
iab dts strftime("%a %d %b %Y")
" }}}
" BUFFERS {{{1
" Bclose {{{2

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
nnoremap <leader>bd :Bclose<CR>
" }}}
" }}}
" COMMANDS {{{1
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Wq :wq
command! Q :q

command! Cnvim :tcd ~/.config/nvim
command! Cntig :tcd ~/code/nametests-ig

command! Todo :e ~/code/notes/todo.todo

autocmd FileWritePost *.test.js :!yarn test %
" }}}
" FILETYPES {{{1
" JavaScript {{{2
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
" }}}

" Markdown {{{2
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown setlocal spell textwidth=80
" }}}

" Ruby {{{2
autocmd BufNewFile,BufRead *.rb set filetype=ruby
" }}}

" Git {{{2
autocmd Filetype gitcommit setlocal spell textwidth=72
" }}}
" }}}
" NAVIGATION {{{1
" Begining & End of line in mode
noremap <c-a> ^
noremap <c-e> g_

" more natural movement with wrap on  but don't remap when it's called with a count
noremap <expr>j (v:count == 0 ? 'gj' : 'j')
noremap <expr>k (v:count == 0 ? 'gk' : 'k')

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
" SEARCHING {{{1
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
noremap <leader>/ :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" }}}
" TERMINAL {{{1
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
" }}}
" TRAILING WHITESPACES {{{1
" Avoid installing twice
if exists('g:loaded_trailing_whitespaces')
    finish
endif
let g:loaded_trailing_whitespaces = 1

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

autocmd FileType css :TrimSpaces
autocmd FileType scss :TrimSpaces
autocmd FileType javascript :TrimSpaces
autocmd FileType ruby :TrimSpaces
autocmd FileType sh :TrimSpaces
autocmd FileType java :TrimSpaces
" }}}
" UI {{{1
" Highlight current line only on focused window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set statusline=%F\ %m%r%h%w%q\ " fullpath and status modified sign
set statusline+=%y " filetype
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l:%c
set statusline+=/ " Separator
set statusline+=%L " Total lines
" }}}

if filereadable('.local.vim')
  so .local.vim
endif
