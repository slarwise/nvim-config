local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local on_attach = function(client, bufnr)
    utils.default_on_attach(client, bufnr)
    require("folding").on_attach()
end

nvim_lsp.gopls.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}
