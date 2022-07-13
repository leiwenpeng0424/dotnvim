local config = {}
local map = require('core.utils').map

config.autopairs = function ()
    require('nvim-autopairs').setup({})
end

config.lazygit = function ()
    --
end

config.terminal = function()
    vim.o.hidden = true
    require('nvim-terminal').setup({
        -- keymap to toggle open and close terminal window
        toggle_keymap = ';;',
    })
end

config.editorconfig = function ()
    --
end

config.ale = function ()
    --
end

config.nerdcommenter = function ()
    -- 
end

config.nvim_ts_autotag = function ()
    require('nvim-ts-autotag').setup({})
end

config.vimspector = function ()
end

config.impatient = function ()
    -- 
end

config.fixcursorhold = function ()
    -- in millisecond, used for both CursorHold and CursorHoldI,
    -- use updatetime instead if not defined
    vim.g.cursorhold_updatetime = 100
end

return config
