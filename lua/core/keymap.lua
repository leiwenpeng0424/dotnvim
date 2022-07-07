local map = require('core.utils').map
local action = require("lspsaga.action")

map('n', '<C-s>', '<cmd>w<CR>', { silent = true })
map('n', '<C-x>', '<cmd>wqa<CR>', { silent = true })

-- neo-tree
map('n', '<C-b>', '<cmd>NeoTreeShowToggle<CR>', { silent = true })

-- lspsage
map('n', '<leader>f', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
map('n', '<leader>ca','<cmd>Lspsaga code_action<CR>', { silent = true })
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "<leader>s", "<cmd>Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

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

-- close rename win use <C-c> in insert mode or `q` in normal mode or `:q`
map("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })

-- telescope
map('n', 'ff', '<cmd>Telescope find_files<CR>', { silent = true })
map('n', 'fb', '<cmd>Telescope buffers<CR>', { silent = true })

-- barbar
map('n', '<A-,>', '<cmd>BufferPrevious<CR>', { silent = true })
map('n', '<A-.>', '<cmd>BufferNext<CR>', { silent = true })
map('n', '<A-p>', '<cmd>BufferPin<CR>', { silent = true })
map('n', '<A-c>', '<cmd>BufferClose<CR>', { silent = true })
map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', { silent = true })
map('n', '<A->>', '<cmd>BufferMoveNext<CR>', { silent = true })
