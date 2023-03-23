-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-project.nvim

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-smart-history.nvim", dependencies = "kkharji/sqlite.lua" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-symbols.nvim" },
	},
	keys = {
		{ "<leader>f<leader>", "<cmd>Telescope <CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fk", "<cmd>Telescope keymaps <CR>", "n", { noremap = true, silent = true } },
		{ "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fm", "<cmd>Telescope marks<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", "n", { noremap = true, silent = true } },
		{
			"<leader>fp",
			"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
			"n",
			{ noremap = true, silent = true, desc = "Telescope project" },
		},
		{
			"<leader>fe",
			"<cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} <CR>",
			"n",
			{ noremap = true, silent = true, desc = "Telescope symbols" },
		},
		{
			"<leader><leader>",
			"<cmd>Telescope toggletasks spawn<CR>",
			{ desc = "toggletasks: spawn" },
		},
		{
			"<leader>ts",
			"<cmd>Telescope toggletasks select<CR>",
			{ desc = "toggletasks: select" },
		},
		{
			"<leader>te",
			"<cmd>Telescope toggletasks edit<CR>",
			{ desc = "toggletasks: edit" },
		},
	},
	config = function()
		if vim.fn.has("wsl") == 0 and vim.fn.has("win32") == 1 then
			vim.g.sqlite_clib_path = "C:/Windows/System32/sqlite3.dll"
		end
		require("telescope").setup({
			defaults = {
				border = false,
				winblend = 0,
				dynamic_preview_title = true,
				path_display = { "truncate" },
				theme = "ivy",
				layout_strategy = "bottom_pane",
				layout_config = {
					preview_cutoff = 1,
					bottom_pane = {
						height = 0.9,
						prompt_position = "bottom",
					},
					center = {
						width = 0.9,
						height = 0.4,
					},
					cursor = {
						width = 0.8,
						height = 0.9,
					},
					vertical = {
						width = 0.9,
						height = 0.9,
					},
					horizontal = {
						width = 0.9,
						height = 0.9,
					},
				},
				history = {
					path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
					limit = 100,
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
					"--no-ignore",
					"--hidden",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				sorting_strategy = "descending",
				file_ignore_patterns = {
					"^node_modules",
					"^.git",
					".cache",
					"%.class",
					"^build",
					"^docs$",
				},
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				mappings = {
					i = {
						["<C-f>"] = require("telescope.actions").preview_scrolling_down,
						["<C-b>"] = require("telescope.actions").preview_scrolling_up,
						["<C-u>"] = false,
						["<C-d>"] = false,
						["<C-q>"] = require("telescope.actions").smart_send_to_qflist
							+ require("telescope.actions").open_qflist,
						["<M-p>"] = require("telescope.actions.layout").toggle_preview,
					},
					n = {
						["p"] = require("telescope.actions.layout").toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					prompt_title = "   Find File",
				},
				lsp_definitions = {
					prompt_title = "   Find Definition",
					include_declaration = false,
					include_current_line = false,
					show_line = false,
				},
				lsp_references = {
                    prompt_title = "   LSP References",
					include_declaration = false,
					include_current_line = false,
					show_line = false,
				},
				keymaps = {
					prompt_title = "   Keymaps",
				},
				current_buffer_fuzzy_find = {
					prompt_title = " ﬘  Current Buffer",
				},
				live_grep = {
					prompt_title = "   Live Grep",
				},
				help_tags = {
					prompt_title = "  Help Tags",
				},
				oldfiles = {
					prompt_title = "   Old Files",
				},
				marks = {
					prompt_title = "  Marks",
				},
				buffers = {
					prompt_title = " ﬘ Buffers",
				},
				diagnostics = {
                    prompt_title = "  diagnostics",
                },
			},
			extensions = {
				project = {
					theme = "dropdown",
					hidden_files = true,
					-- order_by = "asc",
					base_dirs = {},
					mappings = {},
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case",the default case_mode is "smart_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("project")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("smart_history")
		require("telescope").load_extension("toggletasks")
	end,
}
