local use = require("packer").use

use({
    "hrsh7th/nvim-cmp",
    as = 'cmp',
    requires = {
        { "lukas-reineke/cmp-under-comparator" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "andersevenrud/cmp-tmux" },
        { "hrsh7th/cmp-path" },
        { "f3fora/cmp-spell" },
        { "hrsh7th/cmp-buffer" },
        { "kdheepak/cmp-latex-symbols" },
        {
            "L3MON4D3/LuaSnip",
            tag = "v<CurrentMajor>.*",
            config = function ()
                require "luasnip.loader.form_snipmate".load({ "./my-snippets" })
            end
        }
    },
    config = function()
        local t = function(str)
            return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        local border = function(hl)
            return {
                { "╭", hl },
                { "─", hl },
                { "╮", hl },
                { "│", hl },
                { "╯", hl },
                { "─", hl },
                { "╰", hl },
                { "│", hl },
            }
        end

        local cmp_window = require("cmp.utils.window")

        function cmp_window:has_scrollbar()
            return false
        end

        local compare = require("cmp.config.compare")

        local cmp = require("cmp")
        cmp.setup({
            window = {
                completion = {
                    border = border("CmpBorder"),
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = border("CmpDocBorder"),
                },
            },
            sorting = {
                comparators = {
                    -- require("cmp_tabnine.compare"),
                    compare.offset,
                    compare.exact,
                    compare.score,
                    require("cmp-under-comparator").under,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            formatting = {
                format = function(entry, vim_item)
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
                        orgmode = "[ORG]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[LUA]",
                        path = "[PATH]",
                        tmux = "[TMUX]",
                        luasnip = "[SNIP]",
                        spell = "[SPELL]",
                    })[entry.source.name]

                    return vim_item
                end,
            },
            -- You can set mappings if you want
            mapping = {
                -- ["<C-p>"] = cmp.mapping.select_prev_item(),
                -- ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = false,
                    behavior = cmp.ConfirmBehavior.Replace
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true)
                            , "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = function(fallback)
                    if require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                    else
                        fallback()
                    end
                end,
                ["<C-l>"] = function(fallback)
                    if require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                    else
                        fallback()
                    end
                end,
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            -- You should specify your *installed* sources.
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "path" },
                { name = "spell" },
                { name = "tmux" },
                { name = "orgmode" },
                { name = "buffer" },
                { name = "latex_symbols" },
                { name = "crates" },
            },
        })
    end
})

use({
    "L3MON4D3/LuaSnip",
    config = function()
        vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/my-snippets/,"
        require("luasnip").config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })
        require("luasnip.loaders.from_lua").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    requires = "rafamadriz/friendly-snippets",
})

use({
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({})

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        local handlers = require("nvim-autopairs.completion.handlers")
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
                    -- Disable for tex
                    tex = false,
                },
            })
        )
    end
})
