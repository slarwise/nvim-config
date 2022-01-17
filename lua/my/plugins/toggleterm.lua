require("packer").use {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup { direction = "float" }
    end,
}
