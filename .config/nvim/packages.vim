runtime macros/matchit.vim

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

packadd minpac
call minpac#init({'verbose': 3})

call minpac#add('AdrienGiboire/vim-todo')
call minpac#add('caigithub/a_indent')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-syntax')
call minpac#add('kana/vim-textobj-line')
call minpac#add('kassio/neoterm')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('mileszs/ack.vim')
call minpac#add('nelstrom/vim-textobj-rubyblock') " A custom text object for selecting ruby blocks
call minpac#add('neoclide/vim-jsx-improve') " Syntax and indent plugin for React JSX.
call minpac#add('Olical/vim-enmasse')
call minpac#add('pangloss/vim-javascript')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('SirVer/ultisnips')
"call minpac#add('honza/vim-snippets')
call minpac#add('tacahiroy/ctrlp-funky')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('tpope/vim-bundler') " Lightweight support for Ruby's Bundler
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-fugitive') " a Git wrapper so awesome, it should be illegal
call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-repeat') " enable repeating supported plugin maps with '.'
call minpac#add('tpope/vim-rhubarb') " GitHub extension for fugitive.vim
call minpac#add('tpope/vim-surround') " quoting/parenthesizing made simple
call minpac#add('tpope/vim-unimpaired') " pairs of handy bracket mappings
call minpac#add('tpope/vim-vinegar')
call minpac#add('vim-ruby/vim-ruby') " Vim/Ruby Configuration Files
call minpac#add('slim-template/vim-slim')

call minpac#add('w0rp/ale')
let g:ale_fixers = ['standard']
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

call minpac#add('dag/vim-fish')

call minpac#add('terryma/vim-multiple-cursors')
let g:multi_cursor_exit_from_insert_mode=0

call minpac#add('lmeijvogel/vim-yaml-helper')
call minpac#add('easymotion/vim-easymotion')
