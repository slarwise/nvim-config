" Folding based on header levels
function! MarkdownFoldHeaders()
    let current_line = getline(v:lnum)
    let header_level = matchstr(current_line, '^#\+\ze .*$')
    if empty(header_level)
        return "="
    else
        return ">" .. len(header_level)
    endif
endfunction

setlocal foldexpr=MarkdownFoldHeaders()
setlocal foldmethod=expr

" Compile to pdf using pandoc
setlocal makeprg=pandoc\ -o\ %:p:r.pdf\ -V\ colorlinks\ %:p

" Regular text are highlighted as code in nested lists with multiline items.
" This should prevent this from happening.
augroup NoMarkdownCodeHL
    autocmd!
    autocmd BufEnter *.md syn clear markdownCodeBlock
augroup END
