local use = require('packer').use

use({
    "beauwilliams/focus.nvim",
    config = function() require("focus").setup() end
})
