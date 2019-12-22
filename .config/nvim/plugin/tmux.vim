" Utility functions for working with tmux

" if exists("g:loaded_tmux") || !exists("$TMUX")
"     finish
" endif
" let g:loaded_tmux = 1

function! TmuxNextPaneExists()
    let pane_count = str2nr(trim(system("tmux list-panes | wc -l")))
    return pane_count > 1
endfunction

" function! TmuxSendKeys(keys)

function! TmuxClearLineNextPane()
    if TmuxNextPaneExists()
        let cmd = "tmux send-keys -t+ C-u"
        if has('nvim')
            call jobstart(cmd)
        else
            exexute "terminal ++hidden" . cmd
        endif
    else
        echohl WarningMsg | echo "No other tmux pane exists" | echohl None
    endif
endfunction
