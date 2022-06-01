-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- git
  use 'tpope/vim-fugitive'
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Theme
  use 'arcticicestudio/nord-vim'

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use { 
    'nvim-treesitter/nvim-treesitter',
    ensure_installed = { 
      'rust', 'html', 'css', "js", 
      "typescript", "yaml", "tsx", "toml", 
      "scss", "lua", "regex", "json", "json5", 
      "jsdoc", "http", "graphql", "dot", "c" 
    },
    sync_install = true,
    highlight = {
      enable = true
    }
  }

  -- folder icon
  use { 'kyazdani42/nvim-web-devicons' }
  -- NerdTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    opt = true,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeRefresh",
      "NvimTreeFindFile"
    },
    config = {}
  }
end)