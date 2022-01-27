vim.cmd [[
  augroup nvim_init_reload
    autocmd!
    autocmd BufWritePost $MYVIMRC source <afile>
  augroup end
]]
vim.cmd [[
    augroup make_split_sizes_equal_on_terminal_window_resize
        autocmd!
        autocmd VimResized * wincmd =
    augroup END
]]
vim.cmd [[
    augroup highlight_on_yank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]]
vim.cmd [[
    augroup terminal
        autocmd!
        autocmd TermOpen * startinsert
    augroup END
]]
vim.cmd [[
    augroup goto_last_position
        autocmd!
        autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\""
        \ | endif
    augroup END
]]
vim.cmd [[
    augroup cursorline_in_active_window
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
    augroup END
]]
vim.cmd [[
    augroup ignore_more_files_to_edit_error
        autocmd!
        autocmd QuitPre * if winnr("$") == 1 | blast | end
    augroup END
]]
