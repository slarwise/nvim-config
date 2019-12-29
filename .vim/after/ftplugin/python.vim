if has('nvim')
    let g:python_host_prog = "/usr/local/opt/python/libexec/bin/python"
endif
setlocal foldmethod=indent

compiler pyunit
set makeprg=python\ %

nnoremap <buffer> <LEADER>tm
            \ :TmuxClearLineAndSendKeysNextPane "python SPACE ".expand('%')." ENTER"<CR>
