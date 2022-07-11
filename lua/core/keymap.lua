local map = require('core.utils').map
local action = require("lspsaga.action")

map('n', '<C-s>', '<cmd>w<CR>', { silent = true })
map('n', '<C-x>', '<cmd>wqa<CR>', { silent = true })

-- neo-tree
map('n', '<C-b>', '<cmd>NeoTreeShowToggle<CR>', { silent = true })

-- lspsage
map('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
map("n", "gs", "<cmd>Lspsaga signature_help<CR>", { silent = true })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
map('n', "g[", "<cmd>Lspsaga diagnostic_jump_prev", { silent = true })
map("n", "g]", "<cmd>Lspsaga diagnostic_jump_next", { silent = true })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
map('n', '<leader>ca','<cmd>Lspsaga code_action<CR>', { silent = true })
map('v', '<leader>ca','<cmd>Lspsaga range_code_action<CR>', { silent = true })
map('n', 'gd','<cmd>Lspsaga preview_definition<CR>', { silent = true })

-- move cursor
map('n', '<leader><Up>', "<cmd><C-w>j", { silent = true })
map(
    'n', '<leader><Left>', '<cmd><C-w>h', { silent = true }
)
map(
    'n', '<leader><Right>', '<cmd><C-w>l', { silent = true }
)
map(
    'n', '<leader><Down>', '<cmd><C-w>k', { silent = true }
)
-- scroll down hover doc or scroll in definition preview
map("n", "<C-]>", function() action.smart_scroll_with_saga(1) end, { silent = true })
-- scroll up hover doc
map("n", "<C-[>", function() action.smart_scroll_with_saga(-1) end, { silent = true })

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { silent = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })

-- barbar
map('n', '<A-,>', '<cmd>BufferPrevious<CR>', { silent = true })
map('n', '<A-.>', '<cmd>BufferNext<CR>', { silent = true })
map('n', '<A-p>', '<cmd>BufferPin<CR>', { silent = true })
map('n', '<A-c>', '<cmd>BufferClose<CR>', { silent = true })
map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', { silent = true })
map('n', '<A->>', '<cmd>BufferMoveNext<CR>', { silent = true })

