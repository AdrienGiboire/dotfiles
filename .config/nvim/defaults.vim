set autoindent

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.  When the file
" has been deleted this is not done.
set autoread

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set backspace=indent,eol,start
set breakindent
set completeopt-=preview
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault
set hidden
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
set scrolloff=5 " Set 5 lines to the cursor - when moving vertically
set secure
set shell=zsh\ -l
set shiftwidth=2
set softtabstop=2
set tabstop=2
set tags=./.tags;
set visualbell t_vb=
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,node_modules,tmp,*/public/production
set wildmenu
set wildmode=full
set wrap

" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow
