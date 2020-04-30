let &makeprg = 'erl -noshell -s ' . expand('%:t:r') . ' start -s init stop'
