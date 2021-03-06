local conf = require("plugs.ui.config")
local plugins = {}

plugins['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'kdheepak/lazygit.nvim'
    },
    config = conf.telescope
}

plugins['nvim-treesitter/nvim-treesitter'] = {
    config = conf.treesitter
}

plugins['SmiteshP/nvim-gps'] = {
    requires = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = conf.nvim_gps
}

--plugins['feline-nvim/feline.nvim'] = {
--    requires = { 'SmiteshP/nvim-gps', },
--    config = conf.feline
--}

plugins['lewis6991/gitsigns.nvim'] = {
    config = conf.gitsigns
}

plugins['lukas-reineke/indent-blankline.nvim'] = {
    config = conf.indent_blank_line,
    setup = {
        show_trailing_blankline_indent = false,
    }
}

plugins['glepnir/dashboard-nvim'] = {
    config = conf.dashboard
}

plugins['mhartington/oceanic-next'] = {
    config = conf.oceanic
}

plugins['folke/tokyonight.nvim'] = {
    config = conf.tokyonight
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
        {
            's1n7ax/nvim-window-picker',
            tag = 'v1.*',
            config = function ()
                require('window-picker').setup({
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        bo = {
                            filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix'},
                            buftype = { 'terminal' }
                        }
                    },
                    other_win_hl_color = '#e35e4f'
                })
            end
        }
    },
}

plugins['romgrk/barbar.nvim'] = {
    config = conf.barbar
}

plugins['norcalli/nvim-colorizer.lua'] = {
    confif = conf.colorizer
}

plugins['sunjon/shade.nvim'] = {
    config = conf.shade
}

plugins['nvim-lualine/lualine.nvim'] = {
    config = conf.lualine,
    requires = {
        'kyazdani42/nvim-web-devicons', opt = true
    }
}

plugins['norcalli/nvim-colorizer.lua'] = {
    config = conf.nvim_colorizer
}

plugins['EdenEast/nightfox.nvim'] = {
    config = conf.nightfox
}

return plugins
