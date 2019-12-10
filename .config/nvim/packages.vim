runtime macros/matchit.vim

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

packadd minpac
call minpac#init({'verbose': 3})

call minpac#add('AdrienGiboire/vim-todo')
call minpac#add('tpope/vim-fugitive')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('olical/vim-enmasse')
call minpac#add('plasticboy/vim-markdown')

" THEME {{{
call minpac#add('taniarascia/new-moon.vim')

set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

colorscheme new-moon
" }}}

" FZF {{{
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')

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

" Terminal buffer options for fzf
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

nnoremap <silent> <C-p> :Files<CR>
" }}}

" ack {{{
call minpac#add('mileszs/ack.vim')
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" javascript {{{
call minpac#add('pangloss/vim-javascript')
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

call minpac#add('posva/vim-vue')

" tagbar {{{
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
" }}}

" ruby {{{
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('vim-ruby/vim-ruby') " Vim/Ruby Configuration Files
" }}}

call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-repeat') " enable repeating supported plugin maps with '.'

" surround - quoting/parenthesizing made simple {{{
call minpac#add('tpope/vim-surround')
" }}}

" multiple cursors {{{
call minpac#add('terryma/vim-multiple-cursors')
let g:multi_cursor_exit_from_insert_mode=0
" }}}

" auto-pairs - insert or delete brackets, parens, quotes in pair {{{
call minpac#add('jiangmiao/auto-pairs')
" }}}

" tagbar - Vim plugin that displays tags in a window, ordered by class etc {{{
call minpac#add('majutsushi/tagbar')
let g:tagbar_show_linebumbers = 1
nnoremap <silent> <C-t> :TagbarToggle<CR>
" }}}

" indent guides {{{
call minpac#add('nathanaelkane/vim-indent-guides')
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
" }}}
