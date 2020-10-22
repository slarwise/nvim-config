setlocal suffixesadd=.erl,.hrl

let &l:define = '\(' .
            \ '^-define(' . '\|' .
            \ '^-record(' . '\|' .
            \ '^-type ' . '\|' .
            \ '^-type(' .
            \ '\)'

let &l:include = '^\s*-include("\zs\f*\ze").$'
setlocal includeexpr=ErlangIncludeexpr(v:fname)

function! ErlangIncludeexpr(fname) abort
    let suffixes = [''] + split(&l:suffixesadd, ',', 1)
    for suffix in suffixes
        let paths = Filepaths#GetPaths(a:fname . suffix)
        if !empty(paths)
            return paths[0]
        endif
    endfor
    return a:fname
endfunction
