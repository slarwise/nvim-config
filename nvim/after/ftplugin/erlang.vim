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
    let paths = map(suffixes, 'Filepaths#GetPaths(a:fname . v:val)')
    let paths = filter(paths, '!empty(v:val)')
    if !empty(paths)
        return paths[0][0]
    else
        return a:fname
    endif
endfunction
