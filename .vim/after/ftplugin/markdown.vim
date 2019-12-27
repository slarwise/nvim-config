" Automatic formatting, very slow so maybe not worth it
" augroup md_format
"     autocmd! InsertLeave <buffer>
"     autocmd InsertLeave <buffer> :normal m`gqap``
" augroup END

let b:pandoc_cmd = 'pandoc -o ' . expand('%:r') . '.pdf ' .
            \ '-V colorlinks ' . expand('%')
function! RunCurrent()
    echom b:pandoc_cmd
    if has('nvim')
        silent call jobstart(b:pandoc_cmd)
    else
        execute 'terminal ++hidden ' . expand(b:pandoc_cmd)
    endif
endfunction

" Compile on write
let b:markdown_compile_on_write = 0
augroup md_compile
    autocmd! BufWritePost <buffer>
    if has('nvim')
        autocmd BufWritePost <buffer> :if b:markdown_compile_on_write | 
                    \ silent call jobstart(b:pandoc_cmd) |
                    \ endif
    else 
        autocmd BufWritePost <buffer> :if b:markdown_compile_on_write | 
                    \ execute "terminal ++hidden " . expand(b:pandoc_cmd) |
                    \ endif
    endif
augroup END

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
