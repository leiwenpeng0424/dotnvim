--[[
    'hrsh7th/nvim-cmp'
    'hrsh7th/cmp-nvim-lsp'
    'hrsh7th/cmp-buffer'
    'hrsh7th/cmp-path'
    'hrsh7th/cmp-cmdline'
    'L3MON4D3/LuaSnip'
]]

local use = require("packer").use

use({
  "windwp/nvim-autopairs",
  config = function ()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt', 'vim' }
    })
  end
})

use({
    "hrsh7th/nvim-cmp",
    as = 'cmp',
    requires = {
        { "hrsh7th/cmp-nvim-lsp", after = { "cmp" } },
        { "hrsh7th/cmp-buffer", after = { "cmp" } },
        { "hrsh7th/cmp-path", after = { "cmp" } },
        { "hrsh7th/cmp-cmdline", after = { "cmp" }  },
    },
    config = function ()
        -- local luasnip = require('luasnip')
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local handlers = require("nvim-autopairs.completion.handlers")
    
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
                --   luasnip.lsp_expand(args.body)
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
                --   elseif luasnip.expand_or_jumpable() then
                --     luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                --   elseif luasnip.jumpable(-1) then
                --     luasnip.jump(-1)
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
          "confirm_done",
          cmp_autopairs.on_confirm_done({
            filetypes = {
              -- "*" is an alias to all filetypes
              ["*"] = {
                ["("] = {
                  kind = {
                    cmp.lsp.CompletionItemKind.Function,
                    cmp.lsp.CompletionItemKind.Method,
                  },
                  handler = handlers["*"],
                },
              },
              lua = {
                  ['('] = {
                      kind = {
                          cmp.lsp.CompletionItemKind.Function,
                          cmp.lsp.CompletionItemKind.Method
                      },
                      handler = function (char, item, bufnr) end
                  }
              },
              -- Disable for tex
              tex = false,
            },
          })
        )
    end
})
