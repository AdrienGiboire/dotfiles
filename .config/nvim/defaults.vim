set autoindent

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.  When the file
" has been deleted this is not done.
set autoread

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
let &showbreak='↪ '
set backspace=indent,eol,start
set backupcopy=yes
set breakindent
set completeopt-=preview
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault
set nohidden
set history=1000
set inccommand=split
set incsearch
set laststatus=2
set lazyredraw " needed to improve vim performances with folding on and working on ruby/yaml files
set list
set listchars=tab:▸\ ,eol:¬,trail:⌴
set modelines=5
set noeol
set nojoinspaces
set number
set number
set regexpengine=1
set relativenumber
set ruler
set rtp+=/usr/local/opt/fzf
set scrolloff=5 " Set 5 lines to the cursor - when moving vertically
set secure
set shiftwidth=2
set softtabstop=2
set tabstop=2
set tags^=./.git/tags
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
set wildignore+=**/public/production/**
set wildignore+=**/public/packs/**

set wildmenu
set wildmode=full
set wildignorecase
set wrap

" make the completion menu a bit more readable
" highlight PmenuSel ctermbg=white ctermfg=black
" highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

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
