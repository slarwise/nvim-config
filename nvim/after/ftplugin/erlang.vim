nnoremap <buffer><silent> gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(0)<CR>
nnoremap <buffer><silent> <C-W>gd
            \ :<C-U>call ErlangNotIncludeSearch#GotoDefinitionUnderCursor(1)<CR>

nnoremap <buffer><silent> [d
            \ :<C-U>call ShowFullDefinition#FirstDefinition('^[^%]*\.\s*\(%.*\)\?$')<CR>

setlocal formatprg=erlfmt\ -

setlocal makeprg=erlc\ %
setlocal errorformat=%f:%l:\ %m
