if has('nvim')
    let g:python_host_prog = "/usr/local/opt/python/libexec/bin/python"
endif
setlocal foldmethod=marker

compiler pyunit
setlocal makeprg=python\ %:p

let b:neomake_python_enabled_makers = ['python', 'pylint']
let b:neomake_python_pylint_args = neomake#makers#ft#python#pylint().args +
            \ ['--disable=C'] " C = convention, R = refactor
