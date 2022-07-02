local config = {}

config.nvim_lsp_installer = function ()
    
end

config.nvim_lspconfig = function ()
    local lsp_installer = require('nvim-lsp-installer')
    local lspconfig = require('lspconfig')
    local cmp = require('cmp')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local lspkind = require('lspkind')

    cmp.setup {
        preselect = cmp.PreselectMode.Item,
        completion = { 
            autocomplete = false
        },
        view = {            
            entries = "custom", -- can be "custom", "wildmenu" or "native"
            selection_order = "near_cursor"
        },
        formatting = {
            format = lspkind.cmp_format(),
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" }
        }, {
            { name = "buffer" }
        }),
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = true })
        })
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    local servers = {
        -- rust
        'rust_analyzer',
        'taplo', -- toml
        -- FrontEnd
        'tsserver',
        'eslint',
        'volar',
        'tailwindcss',
        -- Configuration
        'yamlls',
        'jsonls',
        'dotls'
    }

    lsp_installer.setup = {
        automatic_installation = true,
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    }

    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150
            }
        }
    end
end

return config