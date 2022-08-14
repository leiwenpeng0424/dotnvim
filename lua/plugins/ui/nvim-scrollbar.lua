local use = require('packer').use

use({
    "petertriho/nvim-scrollbar",
    config = function ()
        require('scrollbar').setup({

        })
    end
})
