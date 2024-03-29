-- catppuccin/nvim
local use = require("packer").use

use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "Mocha",
            transparent_background = true,
            background = { light = "latte", dark = "Mocha" },
            dim_inactive = { enable = true, shade = "dark", percentage = 0.35 },
            integrations = {
                aerial = true,
                barbar = true,
                beacon = false,
                cmp = true,
                coc_nvim = false,
                dashboard = true,
                fern = false,
                fidget = true,
                gitgutter = false,
                gitsigns = true,
                harpoon = false,
                hop = false,
                illuminate = false,
                leap = false,
                lightspeed = false,
                lsp_saga = true,
                lsp_trouble = false,
                markdown = true,
                mason = true,
                mini = false,
                neogit = false,
                neotest = true,
                neotree = true,
                noice = false,
                notify = true,
                nvimtree = true,
                overseer = false,
                pounce = false,
                semantic_tokens = false,
                symbols_outline = false,
                telekasten = false,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                ts_rainbow = false,
                vim_sneak = false,
                vimwiki = false,
                which_key = false,
                -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
                dap = { enabled = true, enable_ui = true },
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                navic = { enabled = false, custom_bg = "NONE" },
            },
        })
    end,
})
