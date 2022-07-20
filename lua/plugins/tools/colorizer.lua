-- norcalli/nvim-colorizer.lua

local use = require("packer").use

use({
    "norcalli/nvim-colorizer.lua",
    config = function ()
        require('colorizer').setup({})
    end
})