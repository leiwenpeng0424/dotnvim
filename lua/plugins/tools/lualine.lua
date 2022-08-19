-- nvim-lualine/lualine.nvim
-- kyazdani42/nvim-web-devicons

local use = require("packer").use

use({
    "nvim-lualine/lualine.nvim",
    requires = {
        { "kyazdani42/nvim-web-devicons" }
    },
    config = function ()
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '•', right = '•' },
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = { "neo-tree", "Trouble", "aerial", "dashboard", "lspsagaoutline" }
            },
            always_divide_middle = true,
            globalstatus = false,
          },
          sections = {
            lualine_a = {
                { 'mode', separator = { left = '' }, right_padding = 2 }
            },
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename', {
                'filesize',
                icon = '',
                color = { gui = 'bold' } }},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {
                { 'location', separator = { right = '' }, left_padding = 2 }
            }
          },
          inactive_sections = {
            lualine_a = {{ 'filename', right_padding = 2 }},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {{ 'location', right_padding = 2 }}
          },
          tabline = {},
          extensions = {}
        }
    end
})
