local use = require('packer').use

use({
    'projekt0n/github-nvim-theme',
    config = function()
        require('github-theme').setup({
            dark_float = true,
            dark_sidebar = false,
            --[[ transparent = true ]]
            sidebars = {
                'qf',
                'terminal',
                'neo-tree',
                'toggleterm',
                'aerial'
            }
        })
    end
})
