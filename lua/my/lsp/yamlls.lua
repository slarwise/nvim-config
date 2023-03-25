local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local on_attach = function(client, bufnr)
    utils.default_on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
end

nvim_lsp.yamlls.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    settings = {
        yaml = {
            schemas = {
                ["Kubernetes"] = "globPattern"
            },
            schemaStore = {
                enable = true
            }
        }
    }
}
