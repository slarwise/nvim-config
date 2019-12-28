function! RunCurrent()
    ConTeXt
endfunction

function! RunCurrentNextPane()
    let tmux_run_cmd = 'context SPACE '.expand('%:p').' ENTER'
    TmuxClearLineAndSendKeysNextPane tmux_run_cmd
endfunction
