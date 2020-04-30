let &makeprg = 'erlc ' . expand('%:t') .
            \' && erl -noshell -s ' . expand('%:t:r') . ' start -s init stop'
