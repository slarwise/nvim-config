return {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    config = function()
        require("telescope").load_extension "fzf"
    end,
    requires = "nvim-telescope/telescope.nvim",
}
