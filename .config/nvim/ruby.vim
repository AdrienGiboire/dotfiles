let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

noremap <Leader>rc :call RunCurrentSpecFile()<CR>
noremap <Leader>rn :call RunNearestSpec()<CR>
noremap <Leader>rl :call RunLastSpec()<CR>
noremap <Leader>ra :call RunAllSpecs()<CR>


au FileType ruby noremap <Leader>rc :call RunCurrentSpecFile()<CR>
au FileType ruby noremap <Leader>rn :call RunNearestSpec()<CR>
au FileType ruby noremap <Leader>rl :call RunLastSpec()<CR>
au FileType ruby noremap <Leader>ra :call RunAllSpecs()<CR>

