require("packer").use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            spelling = { enabled = true },
            window = { border = "single" },
        }
    end,
}
