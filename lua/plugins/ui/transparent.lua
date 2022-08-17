local use = require('packer').use

use({
    "xiyaowong/nvim-transparent",
    config = function ()
        require("transparent").setup({
            enable = false
        })
    end
})
