require("packer").use {
    "ThePrimeagen/harpoon",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("telescope").load_extension "harpoon"
    end,
}
