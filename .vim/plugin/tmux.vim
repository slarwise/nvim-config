" Utility functions for working with tmux

if exists("g:loaded_tmux") || !exists("$TMUX")
    finish
endif
let g:loaded_tmux = 1

command -nargs=1 TmuxClearLineAndSendKeysNextPane
            \ :call TmuxClearLineAndSendKeysNextPane(<args>)
command TmuxGoToNextWindow :call TmuxGoToNextWindow()
command TmuxGoToPreviousWindow :call TmuxGoToPreviousWindow()

function! TmuxNextPaneExists()
    let pane_count = str2nr(trim(system('tmux list-panes | wc -l')))
    return pane_count > 1
endfunction

function! TmuxSendKeysNextPane(keys)
    if TmuxNextPaneExists()
        let cmd = 'tmux send-keys -t+ ' . a:keys
        call system(cmd)
    else
        echohl WarningMsg | echo 'No other tmux pane exists' | echohl None
    endif
endfunction

function! TmuxClearLineNextPane()
    if TmuxNextPaneExists()
        let cmd = 'C-u'
        call TmuxSendKeysNextPane(cmd)
    else
        echohl WarningMsg | echo 'No other tmux pane exists' | echohl None
    endif
endfunction

function! TmuxClearLineAndSendKeysNextPane(keys)
    if TmuxNextPaneExists()
        call TmuxClearLineNextPane()
        call TmuxSendKeysNextPane(a:keys)
    else
        echohl WarningMsg | echo 'No other tmux pane exists' | echohl None
    endif
endfunction

function! TmuxGoToNextWindow()
    if winnr() < winnr('$') || (str2nr(system("tmux list-panes|wc -l")) == 1)
        execute "normal! \<c-w>w"
    else
        call system("tmux select-pane -t+")
        let pane_current_cmd =
                    \ trim(system("tmux display -p '#{pane_current_command}'"))
        if index(['vim', 'nvim'], pane_current_cmd) >= 0
            call system("tmux send-keys C-w t")
        endif
    endif
endfunction

function! TmuxGoToPreviousWindow()
    if winnr() > 1 || (str2nr(system("tmux list-panes|wc -l")) == 1)
        execute "normal! \<c-w>W"
    else
        call system("tmux select-pane -t-")
        let pane_current_cmd =
                    \ trim(system("tmux display -p '#{pane_current_command}'"))
        if index(['vim', 'nvim'], pane_current_cmd) >= 0
            call system("tmux send-keys C-w b")
        endif
    endif
endfunction
