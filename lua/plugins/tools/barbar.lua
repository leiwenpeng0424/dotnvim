local use = require('packer').use

use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require("barbar").setup {
            clickable = false,
        }
    end
}
