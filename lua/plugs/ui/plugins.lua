local conf = require("plugs.ui.config")
local plugins = {}

plugins['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'kdheepak/lazygit.nvim'
    },
    config = conf.telescope
}

plugins['SmiteshP/nvim-gps'] = {
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = conf.nvim_gps
}

plugins['feline-nvim/feline.nvim'] = {
    requires = { 'SmiteshP/nvim-gps', },
    config = conf.feline
}

plugins['lewis6991/gitsigns.nvim'] = {
    config = conf.gitsigns
}

plugins['lukas-reineke/indent-blankline.nvim'] = {
    config = conf.indent_blank_line,
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
    config = conf.dashboard
}

plugins['mhartington/oceanic-next'] = {
    config = conf.oceanic
}

plugins['kyazdani42/nvim-web-devicons'] = {
    config = conf.devicons
}

plugins['nvim-neo-tree/neo-tree.nvim'] = {
    config = conf.neo_tree,
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
}

return plugins