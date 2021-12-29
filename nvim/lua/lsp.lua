local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "Xn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "Xa", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "Qr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "Qd", "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", opts)
    buf_set_keymap("n", "Xf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.diagnostic.config({ signs = false })

nvim_lsp.erlangls.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
})
nvim_lsp.sumneko_lua.setup({
    settings = {
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
    },
})

local plantuml = {
    name = "plantuml",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "plantuml" },
    -- null_ls.generator creates an async source
    -- that spawns the command with the given arguments and options
    generator = null_ls.generator({
        command = "plantuml",
        args = { "-stdrpt", "$FILENAME" },
        to_stdin = true,
        from_stderr = true,
        -- choose an output format (raw, json, or line)
        format = "line",
        check_exit_code = function(code, stderr)
            local success = code <= 1

            if not success then
                -- can be noisy for things that run often (e.g. diagnostics), but can
                -- be useful for things that run on demand (e.g. formatting)
                print(stderr)
            end

            return success
        end,
        -- use helpers to parse the output from string matchers,
        -- or parse it manually with a function
        on_output = helpers.diagnostics.from_patterns({
            {
                -- test.puml:9:error:Syntax Error?
                pattern = [[%w+:(%d+):(.*)]],
                groups = { "row", "message" },
            },
        }),
    }),
}
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            args = { "--stdin-filepath", "--prose-wrap=always", "$FILENAME" },
        }),
        null_ls.builtins.diagnostics.markdownlint,
        plantuml,
        null_ls.builtins.diagnostics.vale.with({
            filetypes = { "markdown", "tex", "gitcommit" },
        }),
        null_ls.builtins.formatting.stylua,
    },
    on_attach = on_attach,
    debug = false,
})
