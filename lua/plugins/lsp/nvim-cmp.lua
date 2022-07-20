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
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-emoji" },
        { "David-Kunz/cmp-npm" }
    },
    config = function ()
        local cmp = require('cmp')
        -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        -- local handlers = require("nvim-autopairs.completion.handlers")
    
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
                        buffer = "[BUF]",
                        nvim_lsp = "[LSP]",
                        path = "[PATH]",
                        npm = "[NPM]",
                        spell = "[SPELL]",
                        emoji = "[EMOJI]",
                    })[entry.source.name]
                    return vim_item
                end
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'crates' },
                { name = 'spell' },
                { name = 'cmp-emoji' },
                { name = 'path', keyword_length = 3  },
                { name = 'buffer', keyword_length = 3  },
                { name = 'npm', keyword_length = 3 },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = false,
                }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
            }),
            snippet = {
                expand = function(args)
                --   luasnip.lsp_expand(args.body)
                end,
            },
            enabled = function()
                -- disabled in comment
                if require"cmp.config.context".in_treesitter_capture("comment")==true or require"cmp.config.context".in_syntax_group("Comment") then
                  return false
                else
                  return true
                end
            end
        })
    
        -- cmp.event:on(
        --   "confirm_done",
        --   cmp_autopairs.on_confirm_done({
        --     filetypes = {
        --       -- "*" is an alias to all filetypes
        --       ["*"] = {
        --         ["("] = {
        --           kind = {
        --             cmp.lsp.CompletionItemKind.Function,
        --             cmp.lsp.CompletionItemKind.Method,
        --           },
        --           handler = handlers["*"],
        --         },
        --       },
        --       lua = {
        --           ['('] = {
        --               kind = {
        --                   cmp.lsp.CompletionItemKind.Function,
        --                   cmp.lsp.CompletionItemKind.Method
        --               },
        --               handler = function (char, item, bufnr) end
        --           }
        --       },
        --       -- Disable for tex
        --       tex = false,
        --     },
        --   })
        -- )

        cmp.setup.cmdline('/', {
            view = {
                entries = "custom" -- can be "custom", "wildmenu" or "native"
            }
        })

        -- vim.api.nvim_create_autocmd(
        --     {"TextChangedI", "TextChangedP"},
        --     {
        --         callback = function()
        --         local line = vim.api.nvim_get_current_line()
        --         local cursor = vim.api.nvim_win_get_cursor(0)[2]

        --         local current = string.sub(line, cursor, cursor + 1)
        --         if current == "." or current == "," or current == " " then
        --             require('cmp').close()
        --         end

        --         local before_line = string.sub(line, 1, cursor + 1)
        --         local after_line = string.sub(line, cursor + 1, -1)
        --         if not string.match(before_line, '^%s+$') then
        --             if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
        --             require('cmp').complete()
        --             end
        --         end
        --     end,
        --     pattern = "*"
        -- })
    end
})
