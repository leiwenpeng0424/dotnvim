local map = require('core.utils').map
local action = require("lspsaga.action")

-- Map save to Ctrl + S
map('', '<c-s>', ':w<CR>', { remap = true })
map('i', '<c-s>', '<C-o>:w<CR>', { remap = true })
map('n', '<Leader>s', ':w<CR>')

-- Open vertical split
map('n', '<Leader>v', '<C-w>v')

-- Down is really the next line
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Copy to system clipboard
map('v', '<C-c>', '"+y')
-- Paste from system clipboard with Ctrl + v
map('i', '<C-v>', '<Esc>"+p')
map('n', '<Leader>p', '"0p')
map('v', '<Leader>p', '"0p')
map('n', '<Leader>h', 'viw"0p', { nowait = false })

-- Move to the end of yanked text after yank and paste
map('n', 'p', 'p`]')
map('v', 'y', 'y`]')
map('v', 'p', 'p`]')

-- Move selected lines up and down
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Resize window with shift + and shift -
map('n', '_', '<c-w>5<')
map('n', '+', '<c-w>5>')

-- neo-tree
map('n', '<C-b>', '<cmd>NeoTreeShowToggle<CR>', { silent = true })

-- lspsage
map('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
map("n", "gs", "<cmd>Lspsaga signature_help<CR>", { silent = true })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
map('n', "g[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true })
map("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
map('n', 'gc','<cmd>Lspsaga code_action<CR>', { silent = true })
map('v', 'gc','<cmd>Lspsaga range_code_action<CR>', { silent = true })
map('n', 'gd','<cmd>Lspsaga preview_definition<CR>', { silent = true })

-- move cursor
map('n', '<leader><Down>', "<C-w>j", { silent = true })
map('n', '<leader><Left>', '<C-w>h', { silent = true })
map('n', '<leader><Right>', '<C-w>l', { silent = true })
map('n', '<leader><Up>', '<C-w>k', { silent = true })
-- scroll down hover doc or scroll in definition preview
map("n", "<C-]>", function() action.smart_scroll_with_saga(1) end, { silent = true })
-- scroll up hover doc
map("n", "<C-[>", function() action.smart_scroll_with_saga(-1) end, { silent = true })

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { silent = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })

-- barbar
map('n', 'b,', '<cmd>BufferPrevious<CR>', { silent = true })
map('n', 'b.', '<cmd>BufferNext<CR>', { silent = true })
map('n', 'bp', '<cmd>BufferPin<CR>', { silent = true })
map('n', 'bc', '<cmd>BufferClose<CR>', { silent = true })
map('n', 'b<', '<cmd>BufferMovePrevious<CR>', { silent = true })
map('n', 'b>', '<cmd>BufferMoveNext<CR>', { silent = true })

-- nvim-terminal
map('n', '<leader>t', '<cmd>:lua NTGlobal["terminal"]:toggle()<CR>', { silent = true })
map('n', '<leader>-', '<cmd>:lua NTGlobal["window"]:change_height(+2)<CR>', { silent = true })
map('n', '<leader>+', '<cmd>:lua NTGlobal["window"]:change_height(-2)<CR>', { silent = true })

-- NerdCommeter
map('n', '<leader>/', '<cmd>:lua NERDCommenterToggle<cr>', { silent = true })

-- Vimspector
map('n', '<F1>', '<Plug>VimspectorToggleBreakpoint')
map('n', '<F2>', '<Plug>VimspectorToggleConditionalBreakpoint')
map('n', '<F3>', '<Plug>VimspectorAddFunctionBreakpoint')
map('n', '<F4>', '<Plug>VimspectorRunToCursor')
map('n', '<F5>', '<Plug>VimspectorContinue')
map('n', '<A-Right>', '<Plug>VimspectorStepOver')
map('n', '<A-Up>', '<Plug>VimspectorStepOut')
map('n', '<A-Down>', '<Plug>VimspectorStepInto')


