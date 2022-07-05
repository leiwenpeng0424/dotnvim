local conf = require('plugs.language.config')
local plugins = {}


plugins['tpope/vim-fugitive'] = {}
plugins['onsails/lspkind.nvim'] = {}
plugins['catppuccin/nvim'] = { as = 'catppuccin' }

plugins['neovim/nvim-lspconfig'] = {
    config = conf.nvim_lspconfig
}

plugins['williamboman/nvim-lsp-installer'] = {
    requires = { 'neovim/nvim-lspconfig' },
    config = conf.nvim_lsp_installer
}

plugins['hrsh7th/nvim-cmp'] = {
    config = conf.cmp
}

plugins['hrsh7th/cmp-nvim-lsp'] = {}
plugins['hrsh7th/cmp-buffer'] = {}
plugins['hrsh7th/cmp-path'] = {}
plugins['hrsh7th/cmp-cmdline'] = {}
plugins['L3MON4D3/LuaSnip'] = {}

plugins['glepnir/lspsaga.nvim'] = {
    branch = 'main',
    config = conf.lspsaga
}

plugins['prettier/vim-prettier'] = {
    config = conf.prettier,
    branch = 'release/0.x'
}

return plugins
