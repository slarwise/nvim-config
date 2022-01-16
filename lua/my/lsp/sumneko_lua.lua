local nvim_lsp = require "lspconfig"
local utils = require "my.lsp.utils"

local settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
    },
}

nvim_lsp.sumneko_lua.setup {
    on_attach = utils.default_on_attach,
    flags = { debounce_text_changes = 150 },
    settings = settings
}
