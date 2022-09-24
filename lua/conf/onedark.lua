-- https://github.com/navarasu/onedark.nvim
require("onedark").setup {
	transparent = true,
	term_colors = true, -- Change terminal color as per the selected theme style
	-- toggle_style_key = "<C-s>",
	style = 'darker',
	code_style = {
		comments = 'none',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},
	lualine = {
		transparent = true, -- lualine center bar transparency
	},
	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {
		Normal                      = { bg = 'NONE' },
		NormalFloat                 = { bg = 'NONE' },
		FloatBorder              = { bg = 'NONE' },
		Floaterm                    = { bg = 'NONE' },
		FloatermBorder              = { bg = 'NONE' },
		TelescopePromptBorder       = { fg = '#a7b8d6' },
		TelescopePreviewBorder      = { fg = '#a7b8d6' },
		TelescopeResultsBorder      = { fg = '#a7b8d6' },
		NeoTreeGitUntracked         = { fg = '#4a69bd' },
		TreesitterContextLineNumber = { fg = '#a0a8b7' },
	}, -- Override highlight groups
	diagnostics = {
		darker = false, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = false, -- use background color for virtual text
	},
}
require "onedark".load()
