local M = {}

M.nnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true })
end

M.cnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap("c", lhs, rhs, { noremap = true })
end

M.buf_nnoremap = function(lhs, rhs)
    vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, { noremap = true })
end

M.buf_nmap = function(lhs, rhs)
    vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, {})
end

return M
