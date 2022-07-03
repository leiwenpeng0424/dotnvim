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
    vim.notify('setup cmp')
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    cmp.setup({
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
            { name = 'cmdline' }
        },
    })
end

config.lspsaga = function ()
    local saga = require('lspsaga')
    saga.init_lsp_saga({
        code_action_lightbulb = {
            enable = true,
            sign = true,
            sign_priority = 20,
            virtual_text = true,
        },
    })
end


return config