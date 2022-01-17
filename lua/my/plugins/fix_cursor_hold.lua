require("packer").use {
    "antoinemadec/FixCursorHold.nvim",
    config = function()
        vim.g.cursorhold_updatetime = 250
    end,
}
