local use = require('packer').use

use({
    'stevearc/dressing.nvim',
    config = function ()
        require('dressing').setup({
            input =  {
                enable = true,
                default_prompt = "✍️   :"
            },
            select = {
                enable = true,
            }
        })
    end
})
