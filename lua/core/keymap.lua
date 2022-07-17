local bind = require('core.utils').keymap_bind

local mappings = {
    -- save with ctrl + s, V/I mode
    ['<c-s>|:w<cr>'] = { mode = '', opts = { noremap = true } },
    ['<c-s>|<C-o>:w<cr>'] = { mode = 'i', opts = { noremap = true } },
    ['<Leader>s|:w<cr>'] = { mode = 'n', opts = { remap = true } },
    -- open vertical split
    ['<leader>v|<c-w>v'] = { mode = 'n', opts = { remap = true } },
    -- down is really the next line
    ['j|gj'] = { mode = 'n', opts = { remap = true } },
    ['k|gk'] = { mode = 'n', opts = { remap = true } },
    -- copy to system clipboard
    ['<c-c>|"+y'] = { mode = 'n', opts = { remap = true } },
    -- paste from system clipboard with ctrl + v
    ['<c-v>|<Esc>"+p'] = { mode = 'i', opts = { remap = true } },
    ['<leader-p>|"0p'] = { mode = 'n', opts = { remap = true } },
    ['<leader-p>|"0p'] = { mode = 'v', opts = { remap = true } },
    ['<leader-h>|viw"0p'] = { mode = 'n', opts = { remap = true, nowait = false } },
    -- move to the end of yanked text after yank and pasted
    ['p|p`]'] = { mode = 'n', opts = { remap = true } },
    ['p|p`]'] = { mode = 'v', opts = { remap = true } },
    ['y|y`]'] = { mode = 'v', opts = { remap = true } },
    -- Move selected lines up and down
    ["<c-j>|:m '>+1<cr>gv=gv"] = { mode = 'v', opts = { remap = true } },
    ["<c-k>|:m '<-2<cr>gv=gv"] = { mode = 'v', opts = { remap = true } },
    ["_|<c-w>5<"] = { mode = 'n', opts = { remap = true } },
    ['+|<c-w>5>'] = { mode = 'n', opts = { remap = true } },
    ['<c-b>|<cmd>NeoTreeShowToggle<cr>'] = { mode = 'n', opts = { remap = true } },
    -- lspsaga 
    ['gf|<cmd>Lspsaga lsp_finder<cr>'] = { mode = 'n', opts = { remap = true } },
    ['gs|<cmd>Lspsaga signature_help<cr>'] = { mode = 'n', opts = { remap = true } },
    ['g[|<cmd>Lspsaga diagnostic_jump_prev<cr>'] = { mode = 'n', opts = { remap = true } },
    ['g]|<cmd>Lspsaga diagnostic_jump_next<cr>'] = { mode = 'n', opts = { remap = true } },
    ['gr|<cmd>Lspsaga rename<cr>'] = { mode = 'n', opts = { remap = true } },
    ['gc|<cmd>Lspsaga code_action<cr>'] = { mode = 'n', opts = { remap = true } },
    ['gc|<cmd>Lspsaga range_code_action<cr>'] = { mode = 'n', opts = { remap = true } },
    ['gd|<cmd>Lspsaga preview_definition<cr>'] = { mode = 'n', opts = { remap = true } },
    ['K|<cmd>Lspsaga hover_doc<cr>'] = { mode = 'n', opts = { remap = true } },
    -- move cursor
    ['<leader><Down>|<c-w>j'] = { mode = 'n', opts = { remap = true } },
    ['<leader><Left>|<c-w>h'] = { mode = 'n', opts = { remap = true } },
    ['<leader><Right>|<c-w>l'] = { mode = 'n', opts = { remap = true } },
    ['<leader><Up>|<c-w>k'] = { mode = 'n', opts = { remap = true } },
    -- telescope
    ['<leader>ff|<cmd>Telescope find_files<cr>'] = { mode = 'n', opts = { remap = true } },
    ['<leader>fb|<cmd>Telescope buffers<cr>'] = { mode = 'n', opts = { remap = true } },
    -- barbar
    ['b,|<cmd>BufferPrevious<cr>'] = { mode = 'n', opts = { remap = true } },
    ['b.|<cmd>BufferNext<cr>'] = { mode = 'n', opts = { remap = true } },
    ['bp|<cmd>BufferPin<cr>'] = { mode = 'n', opts = { remap = true } },
    ['bc|<cmd>BufferClose<cr>'] = { mode = 'n', opts = { remap = true } },
    ['b<|<cmd>BufferMovePrevious<cr>'] = { mode = 'n', opts = { remap = true } },
    ['b>|<cmd>BufferMoveNext<cr>']  = { mode = 'n', opts = { remap = true } },
    -- nvim-terminal
    ['<leader>t|<cmd>:lua NTGlobal["terminal"]:toggle()<cr>'] = { mode = 'n', opts = { remap = true } },
    ['<leader>-|<cmd>:lua NTGlobal["window"]:change_height(+2)<cr>'] = { mode = 'n', opts = { remap = true } },
    ['<leader>+|<cmd>:lua NTGlobal["window"]:change_height(-2)<cr>'] = { mode = 'n', opts = { remap = true } },
    -- lazygit
    ['gg|<cmd>LazyGit<cr>'] = { mode = 'n', opts = { remap = true } },
    -- aerial
    ['<leader>a|<cmd>AerialToggle!<cr>'] = { mode = 'n', opts = { remap = true } },
}

bind(mappings)
