" Formatting
augroup md_format
    autocmd! InsertLeave <buffer>
    autocmd InsertLeave <buffer> :normal m`gqap``
augroup END

" Compile with pandoc
nnoremap <buffer> <LOCALLEADER>r :terminal ++hidden pandoc -o %:r.pdf %<CR>

" Compile on write
let b:markdown_compile_on_write = 0
augroup md_compile
    autocmd! BufWritePost <buffer>
    autocmd BufWritePost <buffer> :if b:markdown_compile_on_write | 
                \ execute "terminal ++hidden pandoc -o %:r.pdf %" |
                \ endif
augroup END

" Show word count on write
