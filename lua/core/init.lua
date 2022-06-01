
function load()
    -- load Plugins
    require("pack")
end



load()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- setup color schema
vim.cmd([[colorscheme nord]])