" Automatic formatting, very slow so maybe not worth it
" augroup md_format
"     autocmd! InsertLeave <buffer>
"     autocmd InsertLeave <buffer> :normal m`gqap``
" augroup END

" Compile with pandoc
nnoremap <buffer> <LOCALLEADER>r :terminal ++hidden pandoc -o %:r.pdf -V colorlinks %<CR>

" Compile on write
let b:markdown_compile_on_write = 0
augroup md_compile
    autocmd! BufWritePost <buffer>
    autocmd BufWritePost <buffer> :if b:markdown_compile_on_write | 
                \ execute "terminal ++hidden pandoc -o %:r.pdf -V colorlinks %" |
                \ endif
augroup END

" Show word count on write

" Folding, fold on headers only
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
setlocal foldexpr=MarkdownLevel()
setlocal foldmethod=expr
