local plugins = {}
local conf = require('plugins.ui.config')

plugins['nvim-neo-tree/neo-tree.nvim'] = {
    branch = 'v2.x',
    requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    -- todo Usage https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
    config = function ()
        require('neo-tree').setup()
    end
}

plugins['glepnir/dashboard-nvim'] = {
    setup = function ()
        vim.g.dashboard_default_executive = 'telescope'
        vim.g.indentLine_fileTypeExclude = { 'dashboard' }
    end
}

plugins['romgrk/barbar.nvim'] = {
    requires = { 'kyazdani42/nvim-web-devicons' }
}

plugins['lukas-reineke/indent-blankline.nvim'] = {
    setup = {
        show_end_of_line= false,
        show_current_context = true,
        show_current_context_start = true,
    }
}

plugins['lewis6991/gitsigns.nvim'] = {
    config = conf.gitsigns
}

plugins['tami5/lspsaga.nvim'] = {
    config = conf.lspsaga
}

plugins['feline-nvim/feline.nvim'] = {
    requires = {
        {
            'SmiteshP/nvim-gps',
            requires = {
                'nvim-treesitter/nvim-treesitter'
            }
        }
    },
    config = conf.feline
}

plugins['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim'
    }
}

-- Themes
plugins['mhartington/oceanic-next'] = {
    opt = true
}

-- Git
plugins['tpope/vim-fugitive'] = {
    opt = true
}

return plugins