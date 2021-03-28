set textwidth=100
setlocal foldmethod=expr
setlocal foldexpr=PythonFold()

compiler pyunit
setlocal makeprg=python\ %:p

let b:neomake_python_enabled_makers = ['python', 'pylint']
let b:neomake_python_pylint_args = neomake#makers#ft#python#pylint().args +
            \ ['--disable=C'] " C = convention, R = refactor

function! PythonFold()
    if getline(v:lnum) =~# '^def .*$'
        return ">1"
    elseif getline(v:lnum) =~# "if __name__ == '__main__'"
        return ">1"
    endif
    return "="
endfunction
