-- neovim/nvim-lspconfig
local use = require("packer").use

use({
    "williamboman/nvim-lsp-installer",
    config = function ()
        local nvim_lsp_installer = require('nvim-lsp-installer')
        nvim_lsp_installer.setup({
            automatic_installation = true
        })
    end
})

use({
    "stevearc/aerial.nvim",
    config = function ()
        require('aerial').setup({})
    end
})

use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
})

use({
    "neovim/nvim-lspconfig",
    config = function ()
        local lsp_installer = require('nvim-lsp-installer')
        local lsp_config = require('lspconfig')

        -- diagnostics signs in gutter
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    
        -- vim.cmd[[autocmd! CursorHold,CursorHoldI * lua require("lspsaga.diagnostic").show_line_diagnostics()]]
        local cmp = pcall(require, 'cmp_nvim_lsp');
        if not cmp then
            vim.cmd([[packadd cmp-nvim-lsp]])
        end
        local capabilities  = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
        function on_attach(client, bufnr)
            --[[ if client.name ~= "eslint" then
                require("nvim-navic").attach(client, bufnr)
            end ]]
            require('aerial').on_attach(client, bufnr)
            require("lsp_signature").on_attach({
                bind = true,
                use_lspsaga = false,
                floating_window = true,
                fix_pos = true,
                hint_enable = true,
                hi_parameter = "Search",
                handler_opts = { "double" },
            })
        end
    
        for _, server in ipairs(lsp_installer.get_installed_servers()) do
            if server.name == 'sumneko_lua' then
                lsp_config['sumneko_lua'].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                            },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                },
                                maxPreload = 100000,
                                preloadFileSize = 10000,
                            },
                            telemetry = { enable = false },
                        }
                    }
                })
            elseif server.name == "jsonls" then
                lsp_config.jsonls.setup({
                    flags = { debounce_text_changes = 500 },
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        json = {
                            -- Schemas https://www.schemastore.org
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true }
                        },
                    },
                })
            elseif server.name == "rust_analyzer" then
                lsp_config.rust_analyzer.setup({
                    flags = { debounce_text_changes = 500 },
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ['rust_analyzer'] = {
                            cmd = 'rustup run nightly rust-analyzer'
                        }
                    },
                })
            else
                lsp_config[server.name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end
    end
})
