let &makeprg = 'erlc ' . expand('%:t') .
            \' && erl -noshell -s ' . expand('%:t:r') . ' start -s init stop'

" Go to function declaration even if the declaration is below the cursor
" nnoremap <silent><buffer> gd
"             \ :<C-U>call search('^'..expand('<cword>')..'(', 'cw')<CR>

set suffixesadd+=.erl,.hrl

" Go to function declaration even if the declaration is below the cursor. Will
" search in other modules as well, given that &path and &suffixesadd are set.
nnoremap <silent><buffer> gd
            \ :<C-U>call erlang_gotodefinition#ErlangGotodefinition()<CR>
