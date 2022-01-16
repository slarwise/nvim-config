local null_ls = require "null-ls"

local vale = null_ls.builtins.diagnostics.vale.with {
    filetypes = { "markdown", "tex", "gitcommit" },
}

null_ls.register(vale)
