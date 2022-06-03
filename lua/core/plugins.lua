-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local use = require('packer').use
local ui_plugins_config = require("plugins.ui.config")

require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 
        { 
            'williamboman/nvim-lsp-installer',
            setup = {
                automatic_installation = true,
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            }
        },
        'neovim/nvim-lspconfig',
        config =  function ()
            local lspconfig = require('lspconfig')

            local servers = {
                'denols', 'cssls', 'dockerls', 'dotls', 'eslint', 'flow',
                'graphql', 'html', 'jsonls', 'powershell_es',
                'rust_analyzer', 'svelte',
                'tsserver', 'vimls', 'volar', 'vuels',
                'yamlls', 'pyright'
            }
            
            for _, lsp in pairs(servers) do
            lspconfig[lsp].setup {
                flags = {}
            }
            end

            lspconfig.rust_analyzer.setup {}
            lspconfig.tsserver.setup {}
        end
    }
    -- git
    use 'tpope/vim-fugitive'
    -- Theme
    use { 'mhartington/oceanic-next' }

    use { 
        'nvim-treesitter/nvim-treesitter',
        config = {
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
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
        -- todo add keymappings
    }
    -- Lua
    use {
        'SmiteshP/nvim-gps',
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {
        'feline-nvim/feline.nvim',
        requires = { 'SmiteshP/nvim-gps', },
        config = ui_plugins_config.feline
    }
    use { 
        'tami5/lspsaga.nvim',
        -- todo Usage https://github.com/tami5/lspsaga.nvim/wiki
    }
    use {
        'lewis6991/gitsigns.nvim',
        -- todo Usage https://github.com/lewis6991/gitsigns.nvim#usage
        config = ui_plugins_config.gitsigns
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        setup = {
            show_end_of_line= false,
            show_current_context = true,
            show_current_context_start = true,
        }
    }
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
        -- todo Usage https://github.com/romgrk/barbar.nvim#features
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        -- todo Usage https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
        config = function ()
            require('neo-tree').setup()
        end
    }

    use { 
        'glepnir/dashboard-nvim',
        setup = function ()
            vim.g.dashboard_default_executive = 'telescope'
            vim.g.indentLine_fileTypeExclude = { 'dashboard' }
        end
    }
end)
