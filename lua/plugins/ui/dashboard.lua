-- glepnir/dashboard-nvim
local use = require("packer").use

use({
    "glepnir/dashboard-nvim",
    config = function ()
        vim.g.dashboard_default_executive = 'telescope'
        vim.g.indentLine_fileTypeExclude = { 'dashboard' }
        local db = require('dashboard')
        db.custom_header = {
         "   ╔╗                               ",
         "   ║║                               ",
         "   ║║╔══╦╦╗╔╗╔╦══╦═╗╔══╦══╦═╗╔══╗   ",
         "   ║║║║═╬╣╚╝╚╝║║═╣╔╗╣╔╗║║═╣╔╗╣╔╗║   ",
         "   ║╚╣║═╣╠╗╔╗╔╣║═╣║║║╚╝║║═╣║║║╚╝║   ",
         "   ╚═╩══╩╝╚╝╚╝╚══╩╝╚╣╔═╩══╩╝╚╩═╗║   ",
         "                    ║║       ╔═╝║   ",
         "                    ╚╝       ╚══╝   ",
        }

        db.custom_center = {
            {
                icon = '🔭  ',
                desc = 'Find file',
                action = 'Telescope fd'
            }
        }
    end
})
