local use = require('packer').use

use({
    'stevearc/dressing.nvim',
    config = function ()
        require('dressing').setup({
            enable = true
        })
    end
})
