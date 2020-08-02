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

" Move between headers using [[ and ]]
nnoremap <silent><buffer> ]] :<C-U> call <SID>Jump("n", "W")<CR>
nnoremap <silent><buffer> [[ :<C-U> call <SID>Jump("n", "Wb")<CR>
xnoremap <silent><buffer> ]] :<C-U> call <SID>Jump("v", "W")<CR>
xnoremap <silent><buffer> [[ :<C-U> call <SID>Jump("v", "Wb")<CR>

function! <SID>Jump(mode, flags)
    let cnt = v:count1
    mark '
    if a:mode ==# 'v'
        normal! gv
    endif
    while cnt > 0
        call search("^#", a:flags)
        let cnt -= 1
    endwhile
endfunction

" Compile to pdf using pandoc
setlocal makeprg=pandoc\ -o\ %:p:r.pdf\ -V\ colorlinks\ %:p

" Regular text are highlighted as code in nested lists with multiline items.
" This should prevent this from happening.
augroup NoMarkdownCodeHL
    autocmd!
    autocmd BufEnter *.md syn clear markdownCodeBlock
augroup END
