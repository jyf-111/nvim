-- https://github.com/phaazon/hop.nvim
require 'hop'.setup {
	keys = 'etovxqpdygfblzhckisuran'
}
 
vim.api.nvim_set_keymap("n", "<leader><leader>w", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>p", "<cmd>HopPattern<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c1", "<cmd>HopChar1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c2", "<cmd>HopChar2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>l", "<cmd>HopLine<CR>", { noremap = true, silent = true })
