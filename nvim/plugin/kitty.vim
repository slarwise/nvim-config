function! s:KittySend(text, bang) "{{{1
    " Send text to the kitty window with window id `KittyTargetWinId`. If bang
    " is 1, append the text with the escape sequence for enter, i.e. execute the
    " text.
    if !s:EnsureKittyTargetWinIdSet()
        return
    endif
    let system_cmd = 'kitty @ send-text --match=id:'
                \.g:KittyTargetWinId.' '
                \.a:text
    if a:bang
        let system_cmd .= '\\x0d'
    endif
    call system(system_cmd)
endfunction

function! s:KittySendMake() "{{{1
    if !s:EnsureKittyTargetWinIdSet()
        return
    endif
    let make_cmd = substitute(&makeprg, '%\(:\a\)*', '\=expand(submatch(0))', 'g')
    call s:KittySend(make_cmd, 1)
endfunction

function! s:KittySendContinuous() "{{{1
    if !s:EnsureKittyTargetWinIdSet()
        return
    endif
    let message = "-- Sending keystrokes to Kitty Window " . g:KittyTargetWinId
                \ .". Exit with CTRL-C. --"
    echohl ModeMsg
    echo message
    echohl None
    try
        " If I open another Kitty window using cmd+n, the screen doesn't get
        " redrawn. redraw and redraw! doesn't seem to work.
        while 1
            let c = nr2char(getchar())
            call s:KittySend(c, 0)
        endwhile
    catch /Vim:Interrupt/
        echo ""
        redraw
        return 1
    endtry
endfunction

function! s:EnsureKittyTargetWinIdSet() "{{{1
    " Return 0 if `g:KittyTargetWinId` is not set or if it is smaller than 1.
    " Else return 1.
    if !exists('g:KittyTargetWinId')
        echohl WarningMsg
                    \| echo "Must set the target window id in `g:KittyTargetWinId`"
                    \| echohl None
        return 0
    elseif g:KittyTargetWinId < 1
        echohl WarningMsg
                    \| echo "`g:KittyTargetWinId` must be greater than 0"
                    \| echohl None
        return 0
    else
        return 1
    endif
endfunction

" q-args means that the text supplied after KittySend will be treated as a
" string. Don't need to escape e.g. spaces or use quotes. Using the command
" with a bang appends ENTER to the text, i.e. executes it.
command! -bang -nargs=1 KittySend call s:KittySend(<q-args>, <bang>0)

" Set the variable `KittyTargetWinId`. Easier than having to remember the name
" of the variable if it is not set.
command! -nargs=1 KittySetTargetWinId let g:KittyTargetWinId=<args>

command! KittySendContinuous call s:KittySendContinuous()
command! KittySendMake call s:KittySendMake()

"vim: foldmethod=marker
