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
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

nvim_lsp.erlangls.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
}
