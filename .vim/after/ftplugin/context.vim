setlocal softtabstop=2
setlocal shiftwidth=2
setlocal foldmethod=marker
setlocal keywordprg=context-help
setlocal makeprg=make
let b:context_compile_on_write = 0
augroup context_compile
    autocmd! BufWritePost <buffer>
    autocmd BufWritePost <buffer> :if b:context_compile_on_write | 
                \ Neomake! |
                \ endif
augroup END
