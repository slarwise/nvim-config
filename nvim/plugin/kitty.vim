" Send text to the kitty window with window id `KittyTargetWinId`. If bang is 1,
" append the text with the escape sequence for enter, i.e. execute the text.
function! KittySend(text, bang)
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

function! KittySendContinuous()
    if !s:EnsureKittyTargetWinIdSet()
        return
    endif
    let message = ">> Sending keystrokes to Kitty Window " . g:KittyTargetWinId
                \ .". Exit with CTRL-C."
    echohl ModeMsg
    echo message
    echohl None
    try
        while 1
            let c = nr2char(getchar())
            call KittySend(c, 0)
        endwhile
    catch /Vim:Interrupt/
        echo ""
        redraw
        return 1
    endtry
endfunction

" Return 0 if `g:KittyTargetWinId` is not set or if it is smaller than 1. Else
" return 1.
function! s:EnsureKittyTargetWinIdSet()
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
command! -bang -nargs=1 KittySend call KittySend(<q-args>, <bang>0)

" Set the variable `KittyTargetWinId`. Easier than having to remember the name
" of the variable if it is not set.
command! -nargs=1 KittySetTargetWinId let g:KittyTargetWinId=<args>

command! KittySendContinuous call KittySendContinuous()
