local use = require('packer').use

use({
    'projekt0n/github-nvim-theme',
    config = function()
        require('github-theme').setup({
            dark_float = true,
            --[[ transparent = true ]]
        })
    end
})
