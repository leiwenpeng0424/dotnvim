local use = require("packer").use

use {
    "utilyre/barbecue.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "smiteshp/nvim-navic",
    },
    config = function()
        require "barbecue".setup {
            create_autocmd = true,
            exclude_filetypes = { "dashboard", "toggleterm" },
            symbols = {
                separator = "➲"
            },
            kinds = {
                Package = "",
                Namespace = "{}",
                Macro = "#",
                Null = "ﳠ",
                Boolean = "﨡",
                Number = "",
                String = "韛",
                Key = "",
                Array = "",
                Object = "",
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
        }
    end
}
