setlocal suffixesadd=.erl,.hrl

let &l:define = '^-define(\|^-record(\|^-type \|^-type('

let &l:include = '^\s*-include\%(\|_lib\)("\zs\f*\ze").$'

" let &l:includeexpr = 'ProjectFiles#Includeexpr(".projectfiles", v:fname)'
if !exists('ErlangIncludeexpr')
    let ErlangIncludeexpr = ProjectFiles#CreateCustomIncludeexpr('.projectfiles')
endif
let &l:includeexpr = 'ErlangIncludeexpr(v:fname)'

nnoremap <buffer><silent> gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(0)<CR>
nnoremap <buffer><silent> <C-W>gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(1)<CR>

nnoremap <buffer><silent> [d
            \ :<C-U>call ShowFullDefinition#FirstDefinition('^[^%]*\.\s*\(%.*\)\?$')<CR>
