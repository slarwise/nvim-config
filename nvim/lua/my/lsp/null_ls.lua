local null_ls = require "null-ls"

local plantuml = require "my.lsp.plantuml"

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettier.with {
            args = { "--stdin-filepath", "--prose-wrap=always", "$FILENAME" },
        },
        null_ls.builtins.diagnostics.markdownlint,
        plantuml.source,
        -- null_ls.builtins.diagnostics.vale.with({
        --     filetypes = { "markdown", "tex", "gitcommit" },
        -- }),
        null_ls.builtins.formatting.stylua,
    },
}
