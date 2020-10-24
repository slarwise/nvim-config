setlocal suffixesadd=.erl,.hrl

let &l:define = '\(' .
            \ '^-define(' . '\|' .
            \ '^-record(' . '\|' .
            \ '^-type ' . '\|' .
            \ '^-type(' .
            \ '\)'

let &l:include = '^\s*-include("\zs\f*\ze").$'

nnoremap <buffer><silent> gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(0)<CR>
nnoremap <buffer><silent> <C-W>gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(1)<CR>
