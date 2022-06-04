-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local use,
    startup = require('packer').use,
            require('packer').startup

local ui_plugins_config = require("plugins.ui.config")

-- add packer plugins
startup({function()
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    -- lsp-config
    use { 
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            config =  function ()
                local lsp_installer = require('nvim-lsp-installer')
                local lspconfig = require('lspconfig')

                lsp_installer.setup = {
                    automatic_installation = true,
                    ui = {
                        icons = {
                            server_installed = "✓",
                            server_pending = "➜",
                            server_uninstalled = "✗"
                        }
                    }
                }

                lspconfig.tsserver.setup { }
                lspconfig.eslint.setup {}
            end,
        }
    }
    use { 'tpope/vim-fugitive' }
    -- oceanic
    use { 'mhartington/oceanic-next' }
    -- treesitter
    use { 
        'nvim-treesitter/nvim-treesitter',
        config = function ()
        end,
        run = ':TSUpdate'
    }
    -- nvim-ts-rainbow
    use { 'p00f/nvim-ts-rainbow' }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    -- Lua
    use {
        'SmiteshP/nvim-gps',
        requires = "nvim-treesitter/nvim-treesitter"
    }
    -- feline statusline
    use {
        'feline-nvim/feline.nvim',
        requires = { 'SmiteshP/nvim-gps', },
        config = ui_plugins_config.feline
    }
    -- lsp sage
    use {
        'tami5/lspsaga.nvim',
        branch  = 'main',
        -- todo Usage https://github.com/tami5/lspsaga.nvim/wiki
        config = function ()
            -- require('lspsaga').init_lsp_sage {}
        end
    }
    -- dap
    use { 'mfussenegger/nvim-dap' }
    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        -- todo Usage https://github.com/lewis6991/gitsigns.nvim#usage
        config = ui_plugins_config.gitsigns
    }
    -- indent-blankline.
    use {
        'lukas-reineke/indent-blankline.nvim',
        setup = {
            char = "",
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
            },
            space_char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
            },
            show_trailing_blankline_indent = false,
        }
    }
    -- barbar
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
        -- todo Usage https://github.com/romgrk/barbar.nvim#features
    }
    -- neo-tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            require('neo-tree').setup({
                close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
                popup_border_style = "rounded",
                enable_git_status = false,
                enable_diagnostics = false,
                default_component_configs = {
                    container = {
                        enable_character_fade = true
                    },
                    indent = {
                        indent_size = 2,
                        padding = 1, -- extra padding on left hand side
                        -- indent guides
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        highlight = "NeoTreeIndentMarker",
                        -- expander config, needed for nesting files
                        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                        expander_collapsed = "",
                        expander_expanded = "",
                        expander_highlight = "NeoTreeExpander",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "ﰊ",
                        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                        -- then these will never be used.
                        default = "*",
                        highlight = "NeoTreeFileIcon"
                    },
                    modified = {
                        symbol = "[+]",
                        highlight = "NeoTreeModified",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted   = "✖",-- this can only be used in the git_status source
                            renamed   = "",-- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored   = "",
                            unstaged  = "",
                            staged    = "",
                            conflict  = "",
                        }
                    },
                },
                window = {
                    position = "left",
                    width = 40,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                    mappings = {
                        ["<space>"] = { 
                            "toggle_node", 
                            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
                        },
                        ["<2-LeftMouse>"] = "open",
                        ["<cr>"] = "open",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        -- ["S"] = "split_with_window_picker",
                        -- ["s"] = "vsplit_with_window_picker",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["C"] = "close_node",
                        ["a"] = { 
                            "add",
                            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                            config = {
                                show_path = "none" -- "none", "relative", "absolute"
                            }
                        },
                        ["A"] = "add_directory", -- also accepts the config.show_path option.
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", -- takes text input for destination
                        ["m"] = "move", -- takes text input for destination
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                    }
                },
                nesting_rules = {},
                filesystem = {
                    filtered_items = {
                        visible = false, -- when true, they will just be displayed differently than normal items
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = true, -- only works on Windows for hidden files/directories
                        hide_by_name = {
                            --"node_modules"
                        },
                        hide_by_pattern = { -- uses glob style patterns
                            --"*.meta"
                        },
                        never_show = { -- remains hidden even if visible is toggled to true
                            ".DS_Store",
                            "thumbs.db"
                        },
                    },
                    follow_current_file = false, -- This will find and focus the file in the active buffer every
                                                -- time the current file is changed while the tree is open.
                    group_empty_dirs = false, -- when true, empty folders will be grouped together
                    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                            -- in whatever position is specified in window.position
                                            -- "open_current",  -- netrw disabled, opening a directory opens within the
                                                            -- window like netrw would, regardless of window.position
                                            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
                    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                                    -- instead of relying on nvim autocmd events.
                    window = {
                        mappings = {
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                            ["H"] = "toggle_hidden",
                            ["/"] = "fuzzy_finder",
                            ["f"] = "filter_on_submit",
                            ["<c-x>"] = "clear_filter",
                            ["[g"] = "prev_git_modified",
                            ["]g"] = "next_git_modified",
                        }
                    }
                },
                buffers = {
                    follow_current_file = true, -- This will find and focus the file in the active buffer every
                                                -- time the current file is changed while the tree is open.
                    group_empty_dirs = true, -- when true, empty folders will be grouped together
                    show_unloaded = true,
                    window = {
                        mappings = {
                            ["bd"] = "buffer_delete",
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                        }
                    },
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["A"]  = "git_add_all",
                            ["gu"] = "git_unstage_file",
                            ["ga"] = "git_add_file",
                            ["gr"] = "git_revert_file",
                            ["gc"] = "git_commit",
                            ["gp"] = "git_push",
                            ["gg"] = "git_commit_and_push",
                        }
                    }
                }
            })
        end
    }
    -- dashboard
    use {
        'glepnir/dashboard-nvim',
        setup = function ()
            vim.g.dashboard_default_executive = 'telescope'
            vim.g.indentLine_fileTypeExclude = { 'dashboard' }
        end
    }
    use { 'rust-lang/rust.vim' }
end,
config = {
    display = {
        open_fn = require('packer.util').float
    }
}})
