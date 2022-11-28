-- https://github.com/bthomason/packer.nvim

-- @diagnostic disable: undefined-global
local ensure_packer = function()
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.notify("Installing Pakcer.nvim ... ")
		vim.fn.system({
			'git', 'clone', '--depth', '1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(
	{
		function(use)
			use { 'wbthomason/packer.nvim' }
			use { 'lewis6991/impatient.nvim' }
			use { 'navarasu/onedark.nvim' }
			use { 'phaazon/hop.nvim', config = function() require('hop').setup() end }
			use { 'linty-org/key-menu.nvim', config = function() require("conf.key-menu") end }
			use { 'jbyuki/venn.nvim', config = function() require("conf.venn") end }
			use { 'Shatur/neovim-session-manager', config = function() require("conf.neovim-session-manager") end }
			use { 'ray-x/web-tools.nvim', config = function() require 'web-tools'.setup() end }
			use { 'tpope/vim-fugitive' }
			use {
				"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
				config = function() require("conf.todo-comments") end
			}
			use { "akinsho/toggleterm.nvim", config = function() require("conf.toggleterm") end }
			use {
				'skywind3000/asyncrun.vim', requires = 'skywind3000/asynctasks.vim',
				config = function() vim.cmd [[  let g:asyncrun_open = 6 ]] end
			}
			use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons',
				config = function() require("conf.lualine") end }
			use { "ur4ltz/surround.nvim", config = function() require "surround".setup { mappings_style = "surround" } end }
			use { "lukas-reineke/indent-blankline.nvim", config = function() require("conf.indent_blankline") end }
			use {
				'numToStr/Comment.nvim', requires = "JoosepAlviste/nvim-ts-context-commentstring",
				config = function() require('conf.comment') end
			}
			use {
				"nvim-telescope/telescope.nvim",
				requires = {
					{ "nvim-lua/plenary.nvim" },
					{ "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },
					{ "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } },
					{ "nvim-telescope/telescope-ui-select.nvim" },
					{ "nvim-telescope/telescope-project.nvim" },
					{ 'nvim-telescope/telescope-fzf-native.nvim',
						run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
					},
					{ "nvim-telescope/telescope-symbols.nvim" },
					{ 'GustavoKatel/telescope-asynctasks.nvim' },
				},
				config = function() require("conf.telescope") end
			}
			use {
				'nvim-treesitter/nvim-treesitter',
				run = ':TSUpdate',
				requires = {
					"p00f/nvim-ts-rainbow",
					"windwp/nvim-ts-autotag",
					"Badhi/nvim-treesitter-cpp-tools",
					"yioneko/nvim-yati",
					'nvim-treesitter/nvim-treesitter-context'
				},
				config = function() require("conf.nvim-treesitter") end
			}
			use 'honza/vim-snippets'
			use 'lervag/vimtex'
			use 'github/copilot.vim'
			use { 'neoclide/coc.nvim', branch = 'release' }
			use { "williamboman/mason.nvim", config = function() require("mason").setup() end }
			use {
				{ "mfussenegger/nvim-dap", config = function() require('conf.nvim-dap') end },
				{ "rcarriga/nvim-dap-ui", config = function() require('conf.nvim-dap-ui') end },
				{ "theHamsta/nvim-dap-virtual-text", config = function() require("conf.nvim-dap-virtual-text") end },
			}
			use { 'mfussenegger/nvim-lint', config = function() require("conf.nvim-lint") end }
			use {
				"nvim-neotest/neotest",
				requires = {
					"vim-test/vim-test",
					'nvim-lua/plenary.nvim',
					"nvim-neotest/neotest-plenary",
					"nvim-treesitter/nvim-treesitter",
					"nvim-neotest/neotest-python",
					"nvim-neotest/neotest-vim-test",
				},
				config = function()
					require("conf.vim-test")
					require("conf.neotest")
				end
			}
			if packer_bootstrap then require('packer').sync() end
		end,
		config = {
			display = {
				open_fn = function() return require('packer.util').float({ border = 'single' }) end
			}
		},
	}
)
