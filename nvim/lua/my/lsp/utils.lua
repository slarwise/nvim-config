local M = {}

local util = require "vim.lsp.util"
local validate = vim.validate
local buf_nnoremap = require("my.utils").nnoremap

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

M.common_on_attach = function(client, bufnr)
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_nnoremap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    buf_nnoremap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
    buf_nnoremap(",a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    buf_nnoremap(",r", "<cmd>lua vim.lsp.buf.references()<CR>")
    buf_nnoremap(",d", "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>")
    buf_nnoremap(",f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    buf_nnoremap(",n", "<cmd>lua vim.lsp.buf.rename()<CR>")
    buf_nnoremap(",c", "<cmd>lua vim.lsp.codelens.run()<CR>")

    vim.cmd [[
        autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
    ]]
end

return M
