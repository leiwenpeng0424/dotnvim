local use = require("packer").use

use({
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function ()
        require('hop').setup({
            keys = 'etovxqpdygfblzhckisuran'
        })
    end
})
