local on_choice = require "microscope.on_choice"
local utils = require "microscope.utils"
local state = require "microscope.state"

local M = {}

M.nvim = function()
    local files = {
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/init.lua",
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/lua/lsp.lua",
        "/Users/arvidbjurklint/Dropbox/dotfiles/nvim/lua/plugins.lua",
    }
    local locations = vim.tbl_map(utils.make_location, files)
    state.set("locations", locations)

    local action_map = {
        edit = on_choice.edit,
        split = on_choice.split,
        vsplit = on_choice.vsplit,
        quickfix = on_choice.send_to_quickfix,
        args = on_choice.send_to_args,
    }
    state.set("action_map", action_map)
    state.set("action", "edit")

    local opts = { format_item = utils.format_location, prompt = "Nvim" }
    vim.ui.select(locations, opts, on_choice.from_state)
end

return M
