" General settings{{{

if has('nvim')
    let g:python_host_prog = "/usr/local/opt/python/libexec/bin/python"
endif
setlocal foldmethod=indent

"}}}
" Mappings{{{

" Run current file in this vim window
nnoremap <buffer> <LOCALLEADER>r :!clear && python %<CR>

" Run current file in the next tmux pane
let b:run_cmd = 'python SPACE '.expand('%').' ENTER'
nnoremap <buffer> <LOCALLEADER>tr
            \ :TmuxClearLineAndSendKeysNextPane b:run_cmd <CR>

"}}}
" vim: set foldmethod=marker:
