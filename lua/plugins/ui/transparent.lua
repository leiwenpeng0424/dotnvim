local use = require('packer').use

use({
    "xiyaowong/nvim-transparent",
    config = function ()
        require("transparent").setup({
            enable = true,
            extra_groups = {
                "CursorLineNr"
            }
        })
    end
})
