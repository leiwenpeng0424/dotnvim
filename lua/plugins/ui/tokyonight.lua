-- folke/tokyonight.nvim

local use = require("packer").use

use({
    "folke/tokyonight.nvim",
    config = function()
        require "tokyonight".setup {
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                sidebars = "transparent",
                floats = "transparent"
            },
            hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = true, -- dims inactive windows
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
        }
    end
})
