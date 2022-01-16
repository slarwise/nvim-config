local on_choice = require "microscope.on_choice"
local utils = require "microscope.utils"
local state = require "microscope.state"

local M = {}

M.nvim = function()
    local files = {
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/init.lua",
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/lua/my/lsp.lua",
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/lua/my/plugins.lua",
    }
    local items = vim.tbl_map(utils.make_item, files)
    state.set("items", items)

    local action_map = {
        edit = on_choice.edit,
        split = on_choice.split,
        vsplit = on_choice.vsplit,
        quickfix = on_choice.send_to_quickfix,
        args = on_choice.send_to_args,
    }
    state.set("action_map", action_map)
    state.set("action", "edit")

    local opts = { format_item = utils.format_item, prompt = "Nvim" }
    vim.ui.select(items, opts, on_choice.from_state)
end

return M
