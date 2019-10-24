" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Wq :wq
command! Q :q

command! Cnvim :tcd ~/.config/nvim
command! Cntig :tcd ~/code/nametests-ig

command! Todo :e ~/code/notes/todo.todo

autocmd FileWritePost *.test.js :!yarn test %
