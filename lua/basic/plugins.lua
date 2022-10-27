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

local packer = require("packer")
packer.startup(
	{
		function(use)
			use "wbthomason/packer.nvim"
			use 'lewis6991/impatient.nvim'
			use {
				'neoclide/coc.nvim',
				branch = 'release',
				confg = function() require("conf.coc") end
			}
			-- theme
			use 'navarasu/onedark.nvim'
			--  key-menu
			use {
				'linty-org/key-menu.nvim',
				config = function() require("conf.key-menu") end
			}

			use {
				'norcalli/nvim-colorizer.lua',
				config = function() require("conf.nvim-colorizer") end,
				ft = { 'css', 'javascript', 'html' }
			}
			-- vim-floaterm
			use 'voldikss/vim-floaterm'
			--  draw
			use {
				"jbyuki/venn.nvim",
				config = function() require("conf.venn") end
			}

			-- git
			use {
				'lewis6991/gitsigns.nvim',
				config = function() require("conf.gitsigns") end
			}
			-- async
			use {
				'skywind3000/asyncrun.vim',
				requires = 'skywind3000/asynctasks.vim',
				config = function() vim.cmd [[  let g:asyncrun_open = 6 ]] end
			}
			use {
				"Shatur/neovim-session-manager",
				config = function() require("conf.neovim-session-manager") end
			}
			-- [web-tools](https://github.com/ray-x/web-tools.nvim)
			use {
				"ray-x/web-tools.nvim",
				run = "npm install -g browser-sync",
				config = function() require 'web-tools'.setup() end
			}
			-- test
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
			-- lua-line
			use {
				'nvim-lualine/lualine.nvim',
				requires = {
					'kyazdani42/nvim-web-devicons',
				},
				config = function() require("conf.lualine") end
			}
			-- hop.nvim
			use {
				'phaazon/hop.nvim',
				branch = 'v2',
				config = function() require("conf.hop") end
			}
			-- autopairs
			use {
				"windwp/nvim-autopairs",
				config = function() require("conf.nvim-autopairs") end
			}
			-- [surround](https://github.com/ur4ltz/surround.nvim)
			use {
				"ur4ltz/surround.nvim",
				config = function()
					require "surround".setup { mappings_style = "surround" }
				end
			}
			-- indent_blankline
			use {
				"lukas-reineke/indent-blankline.nvim",
				config = function() require("conf.indent_blankline") end
			}
			-- comment
			use {
			'numToStr/Comment.nvim',
			requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
			config = function() require('conf.comment') end
			}
			-- telescope
			use {
				"nvim-telescope/telescope.nvim",
				requires = {
					{ "nvim-lua/plenary.nvim" },
					{ "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },
					{ "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } },
					{ "nvim-telescope/telescope-ui-select.nvim" },
					{ "nvim-telescope/telescope-packer.nvim" },
					{ "nvim-telescope/telescope-project.nvim" },
					{ 'nvim-telescope/telescope-fzf-native.nvim',
						run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
					},
					{ 'GustavoKatel/telescope-asynctasks.nvim' },
					{ 'dawsers/telescope-floaterm.nvim' },
				},
				config = function() require("conf.telescope") end
			}
			-- treesitter
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
			-- debug
			use {
				{ "mfussenegger/nvim-dap", config = function() require('conf.nvim-dap') end },
				{ "rcarriga/nvim-dap-ui", config = function() require('conf.nvim-dap-ui') end },
				{ "theHamsta/nvim-dap-virtual-text", config = function() require("conf.nvim-dap-virtual-text") end },
			}
			-- lint
			use {
				'mfussenegger/nvim-lint',
				config = function() require("conf.nvim-lint") end
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
