local conf = require('plugs.language.config')
local plugins = {}

plugins['hrsh7th/cmp-nvim-lsp'] = {}
plugins['hrsh7th/cmp-buffer'] = {}
plugins['hrsh7th/cmp-path'] = {}
plugins['hrsh7th/cmp-cmdline'] = {}
plugins['hrsh7th/nvim-cmp'] = {}
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

return plugins