require("packer").use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("null-ls").setup()
    end,
}
