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
