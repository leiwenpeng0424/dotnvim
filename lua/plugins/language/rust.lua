-- saecki/crates.nvim
-- simrat39/rust-tools.nvim
local use = require("packer").use

use({
    "simrat39/rust-tools.nvim",
    config = function()
        require('rust-tools').setup({})
    end
})

use({
    "saecki/crates.nvim",
    config = function()
        require 'crates'.setup {
            null_ls = {
                enabled = true,
                name = "Crates",
            },
        }
    end
})
