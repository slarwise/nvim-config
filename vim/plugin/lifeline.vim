" Lifeline

if exists("g:loaded_lifeline") "{{{
    finish
endif
let g:loaded_lifeline = 1 "}}}

if !exists("g:lifeline_use_patched_symbols") "{{{
    let g:lifeline_use_patched_symbols = 1
endif "}}}

if !exists("g:lifeline_dashed") "{{{
    let g:lifeline_dashed = 1
endif "}}}

function! LifelineActivate() "{{{
    call s:set_hl_groups()
    set statusline=
    set statusline+=%1*
    set statusline+=%{LifelineGetLeftCornerSymbol()}
    set statusline+=%*
    set statusline+=%{LifeLineGetModifiedSection()}
    set statusline+=%{LifelineGetFiletypeSymbol()}
    set statusline+=%{LifelineGetFilename()}
    set statusline+=%{LifelineGetReadOnly()}
    set statusline+=%{LifelineGetMiddleSeparator()}
    set statusline+=%=
    set statusline+=%{LifelineGetLineColSection()}
    set statusline+=%{LifelineGetRightPadding()}
    set statusline+=%1*
    set statusline+=%{LifelineGetRightCornerSymbol()}
    set statusline+=%*
endfunction "}}}

function! LifelineGetLeftCornerSymbol() "{{{
    if g:lifeline_use_patched_symbols
        return ''
    else
        return ''
    endif
endfunction "}}}

function! LifeLineGetModifiedSection() "{{{
    if !&modified
        if g:lifeline_use_patched_symbols
            if g:lifeline_dashed
                return repeat('—', 4)
            else
                return repeat(' ', 5)
            endif
        else
            return repeat(' ', 7)
        endif
    else
        if g:lifeline_use_patched_symbols
            if g:lifeline_dashed
                return '● ——'
            else
                return '●   '
            endif
        else
            return '[+]   '
        endif
    endif
endfunction "}}}

function! LifelineGetFiletypeSymbol() "{{{
    if !g:lifeline_use_patched_symbols
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
    elseif &filetype ==# 'conf' || &filetype ==# 'tmux'
        return '  '
    elseif &filetype ==# 'zsh' || &filetype ==# 'sh'
        return '  '
    else
        return toupper(&filetype) . ' '
    endif
endfunction "}}}

function! LifelineGetFilename() "{{{
    if !strlen(expand("%"))
        return "No filename" . ' '
    elseif &filetype == 'help'
        return expand('%:t') . ' '
    else
        return fnamemodify(expand("%"), ":~:.") . ' '
    endif
endfunction "}}}

function! LifelineGetReadOnly() "{{{
    if &readonly
        return 'READONLY'
    else
        return ''
    endif
endfunction "}}}

function! LifelineGetMiddleSeparator() "{{{
    if !g:lifeline_use_patched_symbols || !g:lifeline_dashed
        return ''
    endif

    let length = 0

    let length += strdisplaywidth(LifelineGetLeftCornerSymbol())
    let length += strdisplaywidth(LifeLineGetModifiedSection())

    let length += strdisplaywidth(LifelineGetFiletypeSymbol())
    let length += strdisplaywidth(LifelineGetFilename())
    let length += strdisplaywidth(LifelineGetReadOnly())

    let length += strdisplaywidth(LifelineGetLineColSection())
    let length += strdisplaywidth(LifelineGetRightPadding())
    let length += strdisplaywidth(LifelineGetRightCornerSymbol())

    let middle_sep_length = winwidth(0) - length
    return repeat('—', middle_sep_length)
endfunction "}}}

function! LifelineGetLineColSection() "{{{
    return line('.') . '/' . line('$') . ',' . col('.')
endfunction "}}}

function! LifelineGetRightPadding() "{{{
    if g:lifeline_use_patched_symbols && g:lifeline_dashed
        return repeat('—', 4)
    else
        return repeat(' ', 6)
    endif
endfunction "}}}

function! LifelineGetRightCornerSymbol() "{{{
    if g:lifeline_use_patched_symbols
        return ''
    else
        return ''
    endif
endfunction "}}}

function! s:get_hl_attr(group, attribute) "{{{
    return synIDattr(synIDtrans(hlID(a:group)), a:attribute)
endfunction "}}}

function! s:set_hl_groups() "{{{
    let statusline_bg = s:get_hl_attr('StatusLine', 'reverse') ?
                \ s:get_hl_attr('StatusLine', 'fg') :
                \ s:get_hl_attr('StatusLine', 'bg')
    execute 'highlight User1 guifg=' . statusline_bg
    let normal_bg = s:get_hl_attr('Normal', 'reverse') ?
                \ s:get_hl_attr('Normal', 'fg') :
                \ s:get_hl_attr('Normal', 'bg')
    execute 'highlight User1 guibg=' . normal_bg

    execute 'highlight StatusLine gui=' .
                \ (s:get_hl_attr('StatusLine', 'reverse') ?
                \ 'reverse,italic' : 'italic')
    execute 'highlight StatusLineNC gui=' .
                \ (s:get_hl_attr('StatusLineNC', 'reverse') ?
                \ 'reverse,italic' : 'italic')
endfunction "}}}

augroup LifelineColorChange "{{{
    autocmd!
    autocmd ColorScheme * call LifelineActivate()
augroup END "}}}

call LifelineActivate()

" vim:set foldmethod=marker:
