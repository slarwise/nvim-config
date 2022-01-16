" Move between `===========...` sections using ]] and [[
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
        call search("^=", a:flags)
        let cnt -= 1
    endwhile
endfunction
