vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>NeoTreeRevealToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = true })

-- vim-floaterm
vim.api.nvim_set_keymap("n", "\\", "<cmd>FloatermToggle<CR>",
	{ noremap = true, silent = true })

-- 运行代码
vim.api.nvim_set_keymap("n", "<F7>", "<cmd>AsyncTask build<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F8>", "<cmd>AsyncTask run<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-n>", "<plug>SnipRun<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-r>", "<plug>SnipReset<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-A-c>", "<plug>SnipClose<CR>", { noremap = true, silent = true })

-- 调试代码
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue() 		<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over() 		<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_into() 		<CR>", { noremap = true, silent = true })

-- 基础按键
vim.api.nvim_set_keymap("n", "<C-u>", "9k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "9j", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-up>", "<cmd> res+5				<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-down>", "<cmd> res-5				<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-left>", "<cmd> vertical resize-5	<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-right>", "<cmd> vertical resize+5	<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-H>", "<C-w>H", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-J>", "<C-w>J", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-K>", "<C-w>K", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-L>", "<C-w>L", { noremap = true, silent = true })

-- hop
vim.api.nvim_set_keymap("n", "<leader><leader>w", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>p", "<cmd>HopPattern<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c1", "<cmd>HopChar1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c2", "<cmd>HopChar2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>l", "<cmd>HopLine<CR>", { noremap = true, silent = true })


-- 取消find
vim.api.nvim_set_keymap("n", "<CR><CR>", "<cmd>noh<CR>", { noremap = true, silent = true })
-- buffer
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>LualineBuffersJump! 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>LualineBuffersJump! 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>LualineBuffersJump! 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<cmd>LualineBuffersJump! 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<cmd>LualineBuffersJump! 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", "<cmd>LualineBuffersJump! 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", "<cmd>LualineBuffersJump! 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", "<cmd>LualineBuffersJump! 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", "<cmd>LualineBuffersJump! 9<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-$>", "<cmd>LualineBuffersJump! $<CR>", { noremap = true, silent = true })

-- find key
vim.api.nvim_set_keymap("n", "<leader>fk", "<cmd>Telescope  keymaps theme=dropdown<CR>",
	{ noremap = true, silent = true })
-- current_buf_fuzzy_find
vim.api.nvim_set_keymap("n", "<leader>f/", "<cmd>Telescope  current_buffer_fuzzy_find theme=ivy<CR>",
	{ noremap = true, silent = true })
-- diagnostic
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>Telescope  diagnostics<CR>",
	{ noremap = true, silent = true })
-- 查找文件
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>",
	{ noremap = true, silent = true })
-- 查找文字
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>",
	{ noremap = true, silent = true })
-- 查找帮助文档
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>",
	{ noremap = true, silent = true })
-- 查找最近打开的文件
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown <CR>",
	{ noremap = true, silent = true })
-- 查找 marks 标记
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", { noremap = true, silent = true })
-- buffer
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown <CR>",
	{ noremap = true, silent = true })
-- packer
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope packer<CR>", { noremap = true, silent = true })
-- 工作区
vim.api.nvim_set_keymap("n", "<leader>fp",
	"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>z', [[<cmd>lua require'telescope'.extensions.z.list{}<CR>]],
	{ noremap = true, silent = true })
-- symbols
vim.api.nvim_set_keymap("n", "<leader>fe",
	"<cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} <CR>",
	{ noremap = true, silent = true })
-- floaterm
vim.api.nvim_set_keymap("n", "<leader>ft", "<Cmd>Telescope floaterm theme=dropdown <CR>",
	{ noremap = true, silent = true })
-- asynctasks
vim.api.nvim_set_keymap("n", "<leader>fa", "<Cmd>Telescope asynctasks all theme=dropdown <CR>",
	{ noremap = true, silent = true })
-- cheatsheet
vim.api.nvim_set_keymap("n", "<leader>?", "<cmd>Cheatsheet<CR>", { noremap = true })

-- venn
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR> <cmd>IndentBlanklineDisable<CR>", { noremap = true })
