set textwidth=100
setlocal foldmethod=expr

compiler pyunit
setlocal makeprg=python\ %:p

function! PythonFold()
    if getline(v:lnum) =~# '^def .*$'
        return ">1"
    elseif getline(v:lnum) =~# "if __name__ == '__main__'"
        return ">1"
    endif
    return "="
endfunction
