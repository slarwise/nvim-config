let &makeprg = 'erlc ' . expand('%:t') .
            \' && erl -noshell -s ' . expand('%:t:r') . ' start -s init stop'

" Go to function declaration even if the declaration is below the cursor
nnoremap <silent><buffer> gd
            \ :<C-U>call search('^'..expand('<cword>')..'(', 'cw')<CR>
