local M = {}

local util = require "vim.lsp.util"
local validate = vim.validate

local function request(method, params, handler)
    validate {
        method = { method, "s" },
        handler = { handler, "f", true },
    }
    return vim.lsp.buf_request(0, method, params, handler)
end

M.rename_without_prepare = function()
    local function on_confirm(input)
        if not input then
            return
        end
        local params = util.make_position_params()
        params.newName = input
        request("textDocument/rename", params)
    end
    vim.ui.input({ prompt = "New Name: " }, on_confirm)
end

M.default_on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local keymap_opts = { noremap = true }
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
    buf_set_keymap(
        "n",
        "<C-W>d",
        "<Cmd>lua require'telescope.builtin'.lsp_definitions { jump_type = 'split' }<CR>",
        keymap_opts
    )
    buf_set_keymap(
        "n",
        "<C-W><C-D>",
        "<Cmd>lua require'telescope.builtin'.lsp_definitions { jump_type = 'vsplit' }<CR>",
        keymap_opts
    )
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
    buf_set_keymap("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", keymap_opts)
    buf_set_keymap("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
    buf_set_keymap("n", ",d", "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", keymap_opts)
    buf_set_keymap("n", ",f", "<cmd>lua vim.lsp.buf.formatting()<CR>", keymap_opts)
    buf_set_keymap("n", ",n", "<cmd>lua vim.lsp.buf.rename()<CR>", keymap_opts)

    if client.resolved_capabilities.code_lens then
        buf_set_keymap("n", ",l", "<cmd>lua vim.lsp.codelens.run()<CR>", keymap_opts)
        vim.lsp.codelens.refresh()
        vim.cmd [[
            augroup lsp_codelens
            autocmd!
                autocmd BufEnter,CursorHold,InsertLeave,BufWritePost <buffer> lua vim.lsp.codelens.refresh()
            augroup END
        ]]
    end
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            augroup lsp_document_highlight
            autocmd!
                autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end
end

return M
