local buf_map = require("my.utils").buf_nmap
local buf_noremap = require("my.utils").buf_nmap
vim.wo.number = true

-- 1-9 selects item 1-9
local n_items = #vim.api.nvim_buf_get_lines(0, 0, -1, true)
for i = 1, math.min(9, n_items) do
    buf_map(string.format("%d", i), string.format("%dG<CR>", i))
end

buf_noremap("<C-S>", "<cmd>lua require'microscope.actions'.set_action_and_select('split')<cr>")
buf_noremap("<C-V>", "<cmd>lua require'microscope.actions'.set_action_and_select('vsplit')<cr>")
buf_noremap("<C-V>", "<cmd>lua require'microscope.actions'.set_action_and_select('vsplit')<cr>")
buf_noremap("<C-Q>", "<cmd>lua require'microscope.actions'.set_action_and_select('quickfix')<cr>")
buf_noremap("<C-A>", "<cmd>lua require'microscope.actions'.set_action_and_select('args')<cr>")
