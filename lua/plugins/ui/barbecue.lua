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
                separator = ">"
            },
            kinds = {
                Package = "",
                Namespace = "N",
                Macro = "M",
                Null = "Null",
                Boolean = "Bool",
                Number = "Num",
                String = "Str",
                Key = "Key",
                Array = "",
                Object = "Obj",
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
