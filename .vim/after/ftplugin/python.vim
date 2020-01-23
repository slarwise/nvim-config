if has('nvim')
    let g:python_host_prog = "/usr/local/opt/python/libexec/bin/python"
endif
setlocal foldmethod=indent

compiler pyunit
set makeprg=python\ %

let g:neomake_python_enabled_makers = ['python', 'pylint']
let g:neomake_python_pylint_args = neomake#makers#ft#python#pylint().args +
            \ ['--disable=C'] " C = convention, R = refactor

nnoremap <buffer> <LEADER>tm
            \ :TmuxClearLineAndSendKeysNextPane "python SPACE ".expand('%')." ENTER"<CR>
