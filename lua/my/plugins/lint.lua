require("packer").use {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {}
    end,
}
