local config = {}

config.gitsigns = function ()
    require('gitsigns').setup(
        {
            signs = {
                add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm = {
                enable = false
            },
        }
    )
end

config.indent_blank_line = function ()
    require('indent_blankline').setup({
        space_char_blankline = ' ',
        show_current_context = true,
        char = "",
    })
end

config.dashboard = function ()
    vim.g.dashboard_default_executive = 'telescope'
    vim.g.indentLine_fileTypeExclude = { 'dashboard' }
    local db = require('dashboard')
    db.custom_header = {
        "██╗     ███████╗██╗██╗    ██╗███████╗███╗   ██╗██████╗ ███████╗███╗   ██╗ ██████╗ ",
        "██║     ██╔════╝██║██║    ██║██╔════╝████╗  ██║██╔══██╗██╔════╝████╗  ██║██╔════╝ ",
        "██║     █████╗  ██║██║ █╗ ██║█████╗  ██╔██╗ ██║██████╔╝█████╗  ██╔██╗ ██║██║  ███╗",
        "██║     ██╔══╝  ██║██║███╗██║██╔══╝  ██║╚██╗██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║",
        "███████╗███████╗██║╚███╔███╔╝███████╗██║ ╚████║██║     ███████╗██║ ╚████║╚██████╔╝",
        "╚══════╝╚══════╝╚═╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ",
    }
end

config.oceanic = function ()
    -- 
end

config.devicons = function ()
    -- 
end

config.neo_tree = function ()
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
                symbol = "",
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
                    added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
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

config.barbar = function()
    --
end

config.colorizer = function ()
    require('colorizer').setup({})
end

config.tokyonight = function ()
    --
end

config.shade = function ()
    require'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
            brightness_up    = '<C-Up>',
            brightness_down  = '<C-Down>',
            toggle           = '<Leader>s',
        }
    })
end

config.lualine = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
end

config.nvim_colorizer = function()
    require('colorizer').setup({
        '*',
        html = {
            mode = 'background'
        }
    }, { mode = 'foreground' })
end

config.nightfox = function()
    --
end

config.nonicons = function()
    --
end

config.aerial = function ()
    require('aerial').setup({})
end

return config
