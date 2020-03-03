let s:last_char = ''
let s:last_search_operator = ''

function! global_ft#go_to_char(operator, char)
    if !len(a:char)
        let c = nr2char(getchar())
        let s:last_char = c
        let s:last_search_operator = a:operator
    else
        let c = a:char
    endif

    if a:operator ==# 'f'
        call search('\V' . c)
    elseif a:operator ==# 'F'
        call search('\V' . c, 'b')
    elseif a:operator ==# 't'
        call search('\V' . c)
        execute 'normal h'
    elseif a:operator ==# 'T'
        call search('\V' . c, 'b')
        execute 'normal l'
    endif
endfunction

function! global_ft#repeat_last_search()
    if !len(s:last_char)
        finish
    endif
    call global_ft#go_to_char(s:last_search_operator, s:last_char)
endfunction

" nnoremap <silent>t :call global_ft#go_to_char('t', '')<CR>
" nnoremap <silent>T :call global_ft#go_to_char('T', '')<CR>
" nnoremap <silent>f :call global_ft#go_to_char('f', '')<CR>
" nnoremap <silent>F :call global_ft#go_to_char('F', '')<CR>

" nnoremap <silent>, :call global_ft#repeat_last_search()<CR>
