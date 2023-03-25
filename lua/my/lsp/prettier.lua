local null_ls = require "null-ls"

local prettier = null_ls.builtins.formatting.prettier.with {
    args = { "--stdin-filepath", "--prose-wrap=always", "$FILENAME" },
    disabled_filetypes = { "yaml", "typescript", "typescriptreact" },
}

null_ls.register(prettier)
