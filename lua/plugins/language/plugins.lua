local lang_config = require("plugins.language.config")
local plugins = {}

plugins['williamboman/nvim-lsp-installer'] = {
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
}

plugins['neovim/nvim-lspconfig'] = {
    config = function ()
        local lspconfig = require('lspconfig')
        local servers = {
            'dockerls', 'dotls', 'eslint',
            'graphql', 'html', 'jsonls', 'powershell_es',
            'rust_analyzer', 'svelte',
            'tsserver', 'vimls', 'volar',
            'yamlls'
        }
        
        for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {
            flags = {}
        }
        end
    end
}

plugins['nvim-treesitter/nvim-treesitter'] = {
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



return plugins