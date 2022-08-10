-- nvim-lualine/lualine.nvim
-- kyazdani42/nvim-web-devicons

local use = require("packer").use

use({
    "nvim-lualine/lualine.nvim",
    requires = {
        { "kyazdani42/nvim-web-devicons" }
    },
    config = function ()
        --[[ local function lsp_clients()
            local msg = 'No Active LSP'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end ]]
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '•', right = '•' },
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = { "neo-tree", "Trouble", "aerial", "dashboard" }
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
            lualine_a = {
                { 'filename', separator = { left = '', right = '' }, right_padding = 2 }
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                { 'location', separator = { left = '', right = '' }, right_padding = 2 }
            }
          },
          tabline = {},
          extensions = {}
        }
    end
})
