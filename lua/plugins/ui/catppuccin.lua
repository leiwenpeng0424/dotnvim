-- catppuccin/nvim
local use = require("packer").use

use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = 'frappe',
            transparent_background = true,
        }
    end,
}

