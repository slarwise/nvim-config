" Options for making include and definition search work
setlocal suffixesadd=.erl,.hrl
setlocal include=^\\s*-import("\\zs\\f\\*\\ze").$

" Setup includeexpr so that we don't gf to a folder

let macro_pattern = '^-define('
let function_pattern = '^\ze\i\+('
let &l:define = '\(' . macro_pattern . '\|' . function_pattern . '\)'

" Go to function declaration even if the declaration is below the cursor. Will
" search in other modules as well, given that &path and &suffixesadd are set.
nnoremap <silent><buffer> gd
            \ :<C-U>call erlang_gotodefinition#ErlangGotodefinition()<CR>

" Context aware definition search
nnoremap ,d :call erlang_definition_search#setup_define()<CR>[D
