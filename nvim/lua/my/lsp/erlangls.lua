local utils = require "my.lsp.utils"
local buf_nnoremap = require "my.utils".buf_nnoremap

local M = {}

M.on_attach = function()
    utils.common_on_attach()
    buf_nnoremap(",n", "<cmd>lua require 'my.lsp.utils'.rename_without_prepare()<CR>")
end

return M
