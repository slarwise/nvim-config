require("packer").use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "erlang", "markdown", "python", "lua" },
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
