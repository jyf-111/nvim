-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- sudo apt install sqlite3 libsqlite3-dev  -y
require('telescope').setup {
    defaults = {
        history = {
            path = vim.fn.stdpath "data" .. '/telescope_history.sqlite3',
            limit = 100,
        },
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--trim"
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "descending",
        file_ignore_patterns = { "node_modules", ".git" },
        path_display = { "smart" },
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            border = true,
        },
        diagnostics = {
            theme = "ivy",
            previewer = false,
            layout_config = {
                height = 0.3
            }
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            border = true,
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            border = true,
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            path_display = { "truncate" },
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
        packer = {
            theme = "ivy",
            previewer = false,
            border = true,
            layout_config = {
                height = .9
            }
        },
        project = {
            theme = "dropdown",
            hidden_files = true, -- default: false
            base_dirs = {
                -- '~/cpp',
                '/home/jyf/.config/nvim',
                -- {'~/dev/src3', max_depth = 4},
                -- {path = '~/dev/src5'},
                -- {path = '~/dev/src5', max_depth = 2},
            }
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        frecency = {
            db_root = "/home/jyf/.local/share/nvim",
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
            disable_devicons = false,
            workspaces = {
                ["conf"]    = "/home/jyf/.config",
                ["data"]    = "/home/jyf/.local/share",
                ["project"] = "/home/jyf/jyf",
            }
        },
    },
}
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension 'file_browser'
require("telescope").load_extension 'packer'
require 'telescope'.load_extension 'project'
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'smart_history'
require('telescope').load_extension 'dap'
require('telescope').load_extension 'notify'
require('telescope').load_extension 'aerial'
