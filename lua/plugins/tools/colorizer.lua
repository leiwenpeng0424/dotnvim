local use = require("packer").use

use({
    "norcalli/nvim-colorizer.lua",
    config = function ()
        require('colorizer').setup({
            '*' -- enable all filetype
        })
    end
})
