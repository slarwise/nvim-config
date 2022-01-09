local lspconfig = require "lspconfig"

local erlangls = require "my.lsp.erlangls"
local sumneko_lua = require "my.lsp.sumneko_lua"

lspconfig.erlangls.setup {
    on_attach = erlangls.on_attach,
    flags = { debounce_text_changes = 150 },
}
lspconfig.sumneko_lua.setup {
    on_attach = sumneko_lua.on_attach,
    flags = { debounce_text_changes = 150 },
    settings = sumneko_lua.settings
}
