" Clear terminal and run current file
" Can make it better by sending the output to a scratch window, see
" learnvimscriptthehardway, potion.
nnoremap <buffer> <LOCALLEADER>r :!clear && python %<CR>
setlocal foldmethod=indent
