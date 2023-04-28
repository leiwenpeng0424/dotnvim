local use = require("packer").use

use({
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup {
            ui = {
                border = "single",
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = "ﮊ ",
                }
            },
            max_concurrent_installers = 10,
        }
    end
})

use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "dockerls",
                "eslint",
                "html",
                "jsonls",
                "tsserver",
                "rust_analyzer",
                "taplo", -- toml
                "vimls",
                "yamlls",
            },
            automatic_installation = true,
        })
    end
})

use({
    "stevearc/aerial.nvim",
    config = function()
        require('aerial').setup({})
    end
})

use({
    "neovim/nvim-lspconfig",
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lsp = require("mason-lspconfig")

        -- diagnostics signs in gutter
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local cmp = pcall(require, 'cmp_nvim_lsp');
        if not cmp then
            vim.cmd([[packadd cmp-nvim-lsp]])
        end
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        local function on_attach(client, bufnr)
            if client.server_capabilities["documentSymbolProvider"] then
                require "nvim-navic".attach(client, bufnr)
            end
        end
        for _, server in ipairs(mason_lsp.get_installed_servers()) do
            if server == "sumneko_lua" then
                nvim_lsp.sumneko_lua.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                },
                                maxPreload = 100000,
                                preloadFileSize = 10000,
                            },
                        },
                    },
                })
            elseif server == "jsonls" then
                nvim_lsp.jsonls.setup({
                    flags = { debounce_text_changes = 500 },
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        json = {
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true },
                        },
                    },
                })
            else
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end
    end
})
