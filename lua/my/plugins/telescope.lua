require("packer").use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("telescope").setup {
            defaults = { layout_strategy = "vertical" },
        }
    end,
}
