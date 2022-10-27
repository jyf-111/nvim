-- https://github.com/lewis6991/impatient.nvim
_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_chunks',
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_modpaths',
	}
}
--require('impatient')
require("basic.settings")
require("basic.keybinds")
require("basic.plugins")
require("basic.autocmd")

require("conf.onedark")
-- vim.cmd [[ colorscheme gruvbox-baby ]]

require("conf.coc")
-- vim.cmd [[source C:\Users\jyf\AppData\Local\nvim\lua\conf\coc.lua ]] 


