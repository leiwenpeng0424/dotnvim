-- EdenEast/nightfox.nvim
local use = require("packer").use

use({
    "EdenEast/nightfox.nvim",
    config = function()
        require "nightfox".setup {
            options = {
                transparent = true, -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = true, -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
            }
        }
    end
})
