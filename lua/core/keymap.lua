local keymap_bind = require('core.utils').keymap_bind

local mappings = {
    ['Q|:wqa<cr>'] = { mode = 'n', opts = { noremap = true } },
    [';|:'] = { mode = 'n', opts = { noremap = true } },

    -- save with ctrl + s, V/I mode
    ['<c-s>|:w<cr>']                             = { mode = '', opts = { noremap = true } },
    ['<c-s>|<C-o>:w<cr>']                        = { mode = 'i', opts = { noremap = true } },
    ['<Leader>s|:w<cr>']                         = { mode = 'n', opts = { noremap = true } },

    -- open vertical split
    ['<leader>v|<c-w>v']                         = { mode = 'n', opts = { noremap = true } },

    -- down is really the next line
    ['j|gj']                                     = { mode = 'n', opts = { noremap = true } },
    ['k|gk']                                     = { mode = 'n', opts = { noremap = true } },

    -- copy to system clipboard
    ['<c-c>|"+y']                                = { mode = 'n', opts = { noremap = true } },

    -- paste from system clipboard with ctrl + v
    ['<c-v>|<Esc>"+p']                           = { mode = 'i', opts = { noremap = true } },
    ['<leader-p>|"0p']                           = { mode = 'n', opts = { noremap = true } },
    ['<leader-p>|"0p']                           = { mode = 'v', opts = { noremap = true } },
    ['<leader-h>|viw"0p']                        = { mode = 'n', opts = { noremap = true, nowait = false } },

    -- move to the end of yanked text after yank and pasted
    ['p|p`]']                                    = { mode = 'n', opts = { noremap = true } },
    ['p|p`]']                                    = { mode = 'v', opts = { noremap = true } },
    ['y|y`]']                                    = { mode = 'v', opts = { noremap = true } },

    -- Move selected lines up and down
    ["<c-j>|:m '>+1<cr>gv=gv"]                   = { mode = 'v', opts = { noremap = true } },
    ["<c-k>|:m '<-2<cr>gv=gv"]                   = { mode = 'v', opts = { noremap = true } },
    ["_|<c-w>5<"]                                = { mode = 'n', opts = { noremap = true } },
    ['+|<c-w>5>']                                = { mode = 'n', opts = { noremap = true } },
    ['{|:resize -5<cr>']                    = { mode = 'n', opts = { noremap = true } },
    ['}|:resize +5<cr>']                    = { mode = 'n', opts = { noremap = true } },
    ['<c-b>|<cmd>NeoTreeShow<cr>']         = { mode = 'n', opts = { noremap = true } },
    ['<leader>b|<cmd>Neotree<cr>']         = { mode = 'n', opts = { noremap = true } },

    -- lspsaga
    ['gf|<cmd>Lspsaga lsp_finder<cr>']           = { mode = 'n', opts = { noremap = true } },
    ['gs|<cmd>Lspsaga signature_help<cr>']       = { mode = 'n', opts = { noremap = true } },
    ['d[|<cmd>Lspsaga diagnostic_jump_prev<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['d]|<cmd>Lspsaga diagnostic_jump_next<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['gr|<cmd>Lspsaga rename<cr>']               = { mode = 'n', opts = { noremap = true } },
    ['<leader>ca|<cmd>Lspsaga code_action<cr>']          = { mode = 'n', opts = { noremap = true } },
    ['gc|<cmd>Lspsaga range_code_action<cr>']    = { mode = 'n', opts = { noremap = true } },
    ['gd|<cmd>Lspsaga peek_definition<cr>']   = { mode = 'n', opts = { noremap = true } },
    ['K|<cmd>Lspsaga hover_doc<cr>']             = { mode = 'n', opts = { noremap = true } },
    ["<F2>|<cmd>Lspsaga rename<cr>"] = { mode = 'n', opts = { noremap = true } },

    -- move cursor
    ['<leader><Down>|<c-w>j']                    = { mode = 'n', opts = { noremap = true } },
    ['<leader><Left>|<c-w>h']                    = { mode = 'n', opts = { noremap = true } },
    ['<leader><Right>|<c-w>l']                   = { mode = 'n', opts = { noremap = true } },
    ['<leader><Up>|<c-w>k']                      = { mode = 'n', opts = { noremap = true } },

    -- telescope
    ['<leader>ff|<cmd>Telescope find_files<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['<leader>fb|<cmd>Telescope buffers<cr>']    = { mode = 'n', opts = { noremap = true } },

    -- barbar
    ['<S-TAB>|<cmd>BufferPrevious<cr>']               = { mode = 'n', opts = { noremap = true } },
    ['<TAB>|<cmd>BufferNext<cr>']                   = { mode = 'n', opts = { noremap = true } },
    ['bp|<cmd>BufferPin<cr>']                    = { mode = 'n', opts = { noremap = true } },
    ['<leader>x|<cmd>BufferClose<cr>']                  = { mode = 'n', opts = { noremap = true } },
    ['b<|<cmd>BufferMovePrevious<cr>']           = { mode = 'n', opts = { noremap = true } },
    ['b>|<cmd>BufferMoveNext<cr>']               = { mode = 'n', opts = { noremap = true } },
    ['bP|<cmd>BufferPick<cr>']                   = { mode = 'n', opts = { noremap = false } },

    -- nvim-terminal
    ['<leader>t|<cmd>:lua NTGlobal["terminal"]:toggle()<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['<leader>-|<cmd>:lua NTGlobal["window"]:change_height(+2)<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['<leader>+|<cmd>:lua NTGlobal["window"]:change_height(-2)<cr>'] = { mode = 'n', opts = { noremap = true } },

    -- lazygit
    ['gg|<cmd>LazyGit<cr>'] = { mode = 'n', opts = { noremap = true } },

    -- aerial
    ['<leader>a|<cmd>AerialToggle!<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['<c-z>|<cmd>:u<cr>'] = { mode = 'n', opts = { noremap = true } },

    -- exit edit mode
    ['<Esc>|<c-\\><c-n>'] = { mode = 't', opts = { noremap = true } },

    -- hop
    ['<c-f>|<cmd>HopPattern<cr>'] = { mode = 'n', opts = { noremap = true } },
    ['<c-h>|<cmd>HopWord<cr>'] = { mode = 'n', opts = { noremap = true } },

    -- ToggleTerm
    ['<c-`>|<cmd>ToggleTermToggleAll<cr>'] = { mode = 'n', opts = { noremap = true } },

    -- Comment
    ['<leader>/|<cmd>:lua require("Comment.api").toggle.linewise.current()<cr>'] = {
        mode = 'n',
        opts = {
            noremap = true
        }
    },
    ["<leader>/|<Esc><cmd>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"] = {
        mode = 'i'
    }
}

keymap_bind(mappings)
