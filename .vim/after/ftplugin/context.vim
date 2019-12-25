if exists("$TMUX")
    augroup context_compile_on_write
        autocmd! BufWritePost <buffer>
        autocmd BufWritePost <buffer> TmuxClearLineAndSendKeysNextPane
                    \ 'context SPACE ' . expand("%") . ' ENTER'
    augroup END
endif
