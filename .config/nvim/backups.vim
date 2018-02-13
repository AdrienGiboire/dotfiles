set undodir=~/.config/nvim/tmp/undo//     " undo files
set backupdir=~/.config/nvim/tmp/backup// " backups
set directory=~/.config/nvim/tmp/swap//   " swap files
set viewdir=~/.config/nvim/tmp/views//    " view files

" silently create directories if they don't exist
silent execute '!mkdir -p $HOME/.config/nvim/tmp/undo'
silent execute '!mkdir -p $HOME/.config/nvim/tmp/backup'
silent execute '!mkdir -p $HOME/.config/nvim/tmp/swap'

au BufWinLeave \* silent! mkview  " make vim save view (state) (folds, cursor, etc)
au BufWinEnter \* silent! loadview " make vim load view (state) (folds, cursor, etc)

set backup
set noswapfile
