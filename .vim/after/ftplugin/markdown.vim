setlocal makeprg=pandoc\ -o\ %:r.pdf\ -V\ colorlinks\ %
nnoremap <buffer> <LOCALLEADER>o :!open %:r.pdf<CR>
let b:markdown_compile_on_write = 0
augroup markdown_compile
    autocmd! BufWritePost <buffer>
    autocmd BufWritePost <buffer> :if b:markdown_compile_on_write | 
                \ Neomake! |
                \ endif
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
