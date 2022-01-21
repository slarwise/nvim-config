local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local on_attach = function(client, bufnr)
    utils.default_on_attach(client, bufnr)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        ",n",
        "<cmd>lua require 'my.lsp.utils'.rename_without_prepare()<CR>",
        { noremap = true }
    )
    require("folding").on_attach()
end

nvim_lsp.erlangls.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}
