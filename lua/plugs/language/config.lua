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

    local capabilities  = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    for _, server in ipairs(lsp_installer.get_installed_servers()) do
        lsp_config[server.name].setup({
            capabilities = capabilities
        })
    end
end

config.cmp = function ()
    local luasnip = require('luasnip')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                menu = ({
                  buffer = "[Buffer]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[LuaSnip]",
                  nvim_lua = "[Lua]",
                  latex_symbols = "[Latex]",
                })
              }),
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
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
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
            { name = 'luasnip' },
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

return config
