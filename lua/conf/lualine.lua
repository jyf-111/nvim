-- https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { statusline = {}, },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = { 'branch', 'diff', { "diagnostics", sources = { 'coc' } } },
		lualine_x = { 'g:coc_status', "b:coc_current_function", 'encoding',
			{ 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } }, 'filetype' },
		lualine_y = {},
		lualine_z = { 'progress' },
	},
	tabline = { lualine_c = { { 'buffers', mode = 2, icons_enabled = false } }, },
	extensions = { 'quickfix', 'nvim-dap-ui', 'symbols-outline', 'neo-tree' }
}

vim.api.nvim_set_hl(0, "lualine_c_buffers_active", { fg = '#8ebd6b' })
