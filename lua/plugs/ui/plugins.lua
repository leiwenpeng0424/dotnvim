local ui_config = require("plugs.ui.config")
local plugins = {}

plugins['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'kdheepak/lazygit.nvim'
    },
    config = ui_config.telescope
}

plugins['SmiteshP/nvim-gps'] = {
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = ui_config.nvim_gps
}

plugins['feline-nvim/feline.nvim'] = {
    requires = { 'SmiteshP/nvim-gps', },
    config = ui_config.feline
}

plugins['lewis6991/gitsigns.nvim'] = {
    config = ui_config.gitsigns
}

plugins['lukas-reineke/indent-blankline.nvim'] = {
    config = ui_config.indent_blank_line,
    setup = {
        char = "",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
    }
}

plugins['glepnir/dashboard-nvim'] = {
    setup = function ()
        vim.g.dashboard_default_executive = 'telescope'
        vim.g.indentLine_fileTypeExclude = { 'dashboard' }
    end,
    config = ui_config.dashboard
}

plugins['mhartington/oceanic-next'] = {
    config = ui_config.oceanic
}

return plugins