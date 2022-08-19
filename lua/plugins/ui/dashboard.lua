-- glepnir/dashboard-nvim
local use = require("packer").use

use({
    "glepnir/dashboard-nvim",
    config = function ()
        vim.g.dashboard_default_executive = 'telescope'
        vim.g.indentLine_fileTypeExclude = { 'dashboard' }
        local db = require('dashboard')
        db.custom_header = {
            " __    __    _____   _____       _____         ____    ",
            "(  \\  /  )  / ___/  (_   _)     (_   _)       / __ \\   ",
            " \\ (__) /  ( (__      | |         | |        / /  \\ \\  ",
            " ) __ (    ) __)      | |         | |       ( ()  () )  ",
            " ( (  ) )  ( (        | |   __    | |   __  ( ()  () ) ",
            "  ) )( (    \\ \\___  __| |___) ) __| |___) )  \\ \\__/ /  ",
            " /_/  \\_\\    \\____\\ \\________/  \\________/    \\____/   ",
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
