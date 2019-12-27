if has('nvim')
    let g:python_host_prog = "/usr/local/opt/python/libexec/bin/python"
endif
setlocal foldmethod=indent

let b:run_cmd = '!clear && python %'
function! RunCurrent()
    !clear && python %
endfunction

function! RunCurrentNextPane()
    let tmux_run_cmd = 'python SPACE '.expand('%:p').' ENTER'
    TmuxClearLineAndSendKeysNextPane tmux_run_cmd
endfunction
