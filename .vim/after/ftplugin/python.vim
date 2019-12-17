" General settings{{{
setlocal foldmethod=indent
"}}}
" Mappings{{{
" Run current file in this vim window
nnoremap <buffer> <LOCALLEADER>r :!clear && python %<CR>

if exists("$TMUX")
    function RunInNextTmuxPane()
        let pane_count = str2nr(trim(system("tmux list-panes|wc -l")))
        if pane_count > 1
            execute "terminal ++hidden tmux send-keys -t+ C-u"
            execute "terminal ++hidden tmux send-keys -t+ python" .
                        \ " Space " . expand('%') . " Space " . " Enter "
        else
            echom "No tmux pane to run in"
        endif
    endfunction

    " Run current file in the next tmux pane
    nnoremap <buffer> <LOCALLEADER>R :call RunInNextTmuxPane()<CR>
endif
"}}}
" vim: set foldmethod=marker:
