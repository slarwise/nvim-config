require("packer").use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    requires = "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").load_extension "fzf"
    end,
}
