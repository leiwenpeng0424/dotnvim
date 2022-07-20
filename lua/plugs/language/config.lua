local config = {}

config.nvim_lsp_installer = function ()
    local nvim_lsp_installer = require('nvim-lsp-installer')
    nvim_lsp_installer.setup({
        automatic_installation = true
    })
end

config.nvim_lspconfig = function ()
    local lsp_installer = require('nvim-lsp-installer')
    local lsp_config = require('lspconfig')

    -- diagnostics signs in gutter
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- diagnostics in message line 
    function PrintDiagnostics(opts, bufnr, line_nr, client_id)
      bufnr = bufnr or 0
      line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
      opts = opts or {['lnum'] = line_nr}

      local line_diagnostics = vim.diagnostic.get(bufnr, opts)
      if vim.tbl_isempty(line_diagnostics) then return end

      local diagnostic_message = ""
      for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
        print(diagnostic_message)
        if i ~= #line_diagnostics then
          diagnostic_message = diagnostic_message .. "\n"
        end
      end
      vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
    end

    vim.o.updatetime = 250
    vim.cmd [[autocmd! CursorHold * lua PrintDiagnostics()]]
    vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

    local capabilities  = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    function on_attach(client, bufnr)
        require('aerial').on_attach(client, bufnr)
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
                            path = '~/Developer/github/lua-language-server/bin/lua-language-server'
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim', 'packer_plugins' },
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
                        --[[ {
                            {
                                fileMatch = { "package.json" },
                                url = "https://json.schemastore.org/package.json",
                            },
                            {
                                fileMatch = { "tsconfig*.json", "jsconfig.json" },
                                url = "https://json.schemastore.org/tsconfig.json",
                            },
                            {
                                fileMatch = {
                                    ".prettierrc",
                                    ".prettierrc.json",
                                    "prettier.config.json",
                                },
                                url = "https://json.schemastore.org/prettierrc.json",
                            },
                            {
                                fileMatch = { ".eslintrc", ".eslintrc.json" },
                                url = "https://json.scemastore.org/eslintrc.json",
                            },
                            {
                                fileMatch = {
                                    ".babelrc",
                                    ".babelrc.json",
                                    "babel.config.json",
                                },
                                url = "https://json.schemastore.org/babelrc.json",
                            },
                            {
                                fileMatch = { "lerna.json" },
                                url = "https://json.schemastore.org/lerna.json",
                            },
                            {
                                fileMatch = {
                                    ".stylelintrc",
                                    ".stylelintrc.json",
                                    "stylelint.config.json",
                                },
                                url = "http://json.schemastore.org/stylelintrc.json",
                            },
                            {
                                fileMatch = { "/.github/workflows/*" },
                                url = "https://json.schemastore.org/github-workflow.json",
                            }
                        }, ]]
                    },
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

config.cmp = function ()
    local luasnip = require('luasnip')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')

    cmp.setup({
        formatting = {
            format = function (entry, vim_item)

                local lspkind_icons = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "",
					Event = "",
					Operator = "",
					TypeParameter = "",
				}

                -- load lspkind icons
				vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
				vim_item.menu = ({
					-- cmp_tabnine = "[TN]",
					buffer = "[BUF]",
					-- orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					-- nvim_lua = "[LUA]",
					path = "[PATH]",
					-- tmux = "[TMUX]",
					-- luasnip = "[SNIP]",
					spell = "[SPELL]",
				})[entry.source.name]

				return vim_item
            end
        },
        snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'buffer' },
            { name = 'cmdline' },
            { name = 'npm', keyword_length = 3 },
            { name = 'crates' },
            { name = 'spell' }
        },
    })

    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
end

config.lspsaga = function ()
    local saga = require('lspsaga')
    saga.init_lsp_saga({
        code_action_lightbulb = {
            enable = false,
            sign = true,
            sign_priority = 20,
            virtual_text = true,
        },
    })
end

config.prettier = function ()
    -- 
end

config.creates = function ()
    require('creates').setup({})
end

config.cmp_npm = function ()
    require('cmp-npm').setup({})
end

config.cmp_spell = function ()
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
end

config.kitty = function ()
 --   
end

config.fidget = function()
    require('fidget').setup({})
end

config.comment = function ()
    require('Comment').setup({})
end

config.trouble = function ()
    require('trouble').setup({
        action_keys = {
            open_split = { 's' },
            open_vsplit = { 'S' }
        }
    })
end

config.null_ls = function ()
    require('null-ls').setup({
        sources = {
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.diagnostics.eslint,
            require("null-ls").builtins.completion.spell,
        }
    })
end

config.rust_tools = function ()
    require('rust-tools').setup({})
end

return config
