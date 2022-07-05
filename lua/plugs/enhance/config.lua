local config = {}

config.autopairs = function ()
    require('nvim-autopairs').setup({})
end

config.lazygit = function ()
    
end

config.terminal = function()
    vim.o.hidden = true
    require('nvim-terminal').setup({
        -- keymap to toggle open and close terminal window
        toggle_keymap = '<C>t',
    })
end

return config
