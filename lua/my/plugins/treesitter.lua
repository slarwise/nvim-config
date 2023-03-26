require("packer").use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "erlang", "markdown", "python", "lua", "hcl" },
            highlight = { enable = true },
            indent = { enable = false },
        }
    end,
}
