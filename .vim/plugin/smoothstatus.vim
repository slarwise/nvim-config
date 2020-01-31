if exists("g:loaded_smoothstatus")
    finish
endif
let g:loaded_smoothstatus = 1

if !exists("g:smoothstatus_use_patched_symbols")
    let g:smoothstatus_use_patched_symbols = 0
endif

function! SmoothStatusActivate()
    call SmoothStatusSetHighlightGroups()
    set statusline=
    set statusline+=%1*
    set statusline+=%{SmoothStatusGetLeftCornerSymbol()}
    set statusline+=%*
    set statusline+=%{&modified?SmoothStatusGetModifiedSymbol():''}
    set statusline+=%{SmoothStatusGetFiletypeSymbol()}
    set statusline+=%f	    " filename, relative to current working directory
    set statusline+=%{&readonly?'\ READONLY\ ':''}
    set statusline+=%=
    set statusline+=%-14(%l/%L,%c%)  " line/total number of lines
    set statusline+=%1*
    set statusline+=%{SmoothStatusGetRightCornerSymbol()}
    set statusline+=%*
endfunction

function! SmoothStatusGetHighlightTerm(group, term)
   let output = execute('highlight ' . a:group)
   return matchstr(output, a:term.'=\zs\S*')
endfunction

function! SmoothStatusSetHighlightGroups()
    let statusline_gui = SmoothStatusGetHighlightTerm('StatusLine', 'gui')
    if stridx(statusline_gui, 'reverse') >= 0
        let statusline_guibg = SmoothStatusGetHighlightTerm('StatusLine', 'guifg')
    else
        let statusline_guibg = SmoothStatusGetHighlightTerm('StatusLine', 'guibg')
    end
    let normal_gui = SmoothStatusGetHighlightTerm('Normal', 'gui')
    if stridx(normal_gui, 'reverse') >= 0
        let normal_guibg = SmoothStatusGetHighlightTerm('Normal', 'guifg')
    else
        let normal_guibg = SmoothStatusGetHighlightTerm('Normal', 'guibg')
    end
    execute 'highlight User1 guifg=' . statusline_guibg .
                \ ' guibg=' . normal_guibg
endfunction

function! SmoothStatusGetLeftCornerSymbol()
    if g:smoothstatus_use_patched_symbols
        return ''
    else
        return ''
    endif
endfunction

function! SmoothStatusGetRightCornerSymbol()
    if g:smoothstatus_use_patched_symbols
        return ''
    else
        return ''
    endif
endfunction

function! SmoothStatusGetModifiedSymbol()
    if g:smoothstatus_use_patched_symbols
        return '● '
    else
        return '[+] '
    endif
endfunction

function! SmoothStatusGetFiletypeSymbol()
    if !g:smoothstatus_use_patched_symbols
        return toupper(&filetype) . ' '
    elseif strlen(&filetype) == 0
        return ''
    elseif &filetype ==# 'vim'
        return '  '
    elseif &filetype ==# 'python'
        return '  '
    elseif &filetype ==# 'c'
        return '  '
    elseif &filetype ==# 'markdown'
        return '  '
    else
        return toupper(&filetype) . ' '
    endif
endfunction

augroup SmoothstatusColorChange
    autocmd!
    autocmd ColorScheme * call SmoothStatusActivate()
augroup END

call SmoothStatusActivate()
