local conf = require("plugs.integration.config")
local plugins = {}

plugins['nvim-telescope/telescope.nvim'] = {
    requires = {
        'nvim-lua/plenary.nvim',
        'kdheepak/lazygit.nvim',
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

plugins['b0o/schemastore.nvim'] = {
    config = conf.schemastore
}

return plugins
