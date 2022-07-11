local config = {}
local map = require('core.utils').map

config.autopairs = function ()
    require('nvim-autopairs').setup({})
end

config.lazygit = function ()
    
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
    require('nvim-ts-autotag').setup({

    })
end

config.vimspector = function ()
    map('n', '<F1>', '<Plug>VimspectorToggleBreakpoint')
    map('n', '<F2>', '<Plug>VimspectorToggleConditionalBreakpoint')
    map('n', '<F3>', '<Plug>VimspectorAddFunctionBreakpoint')
    map('n', '<F4>', '<Plug>VimspectorRunToCursor')
    map('n', '<F5>', '<Plug>VimspectorContinue')
    map('n', '<Right>', '<Plug>VimspectorStepOver')
    map('n', '<Up>', '<Plug>VimspectorStepOut')
    map('n', '<Down>', '<Plug>VimspectorStepInto')


    -- vim.api.nvim_create_user_command('VimspectorPause', 'vimspector#Pause()', { force = true })
    -- vim.api.nvim_create_user_command('VimspectorStop', 'vimspector#Stop()', { force = true })
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
