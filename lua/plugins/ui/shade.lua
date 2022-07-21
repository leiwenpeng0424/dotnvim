-- sunjon/shade.nvim

local use = require("packer").use

use({
    "sunjon/shade.nvim",
    config = function ()
        require('shade').setup({})
    end
})
