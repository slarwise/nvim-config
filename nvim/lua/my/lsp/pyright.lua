local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local on_attach = function(client, bufnr)
    utils.default_on_attach(client, bufnr)
end

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}
