local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local on_attach = function(client, bufnr)
    utils.default_on_attach(client, bufnr)
    vim.keymap.set("n", ",f", function() vim.lsp.buf.format {
            filter = function(client) return client.name ~= "tsserver" end,
            bufnr = bufnr,
        }
    end
    )
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}
