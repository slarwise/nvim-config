local packer = require "packer"

packer.reset()
packer.init {
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    },
}

packer.use "wbthomason/packer.nvim"
