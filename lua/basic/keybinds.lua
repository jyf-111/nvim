vim.g.mapleader = " "

-- venn
vim.keymap.set('n', '<leader>v', ":lua Toggle_venn()<CR> <cmd>IndentBlanklineDisable<CR>", { noremap = true })
-- coc-yank
vim.keymap.set("n", "<leader>y", ":<C-u>CocList -A --normal yank<cr>", { noremap = true, silent = true })

-- hop
vim.api.nvim_set_keymap("n", ";", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>w", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>p", "<cmd>HopPattern<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c1", "<cmd>HopChar1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c2", "<cmd>HopChar2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>l", "<cmd>HopLine<CR>", { noremap = true, silent = true })
-- run
vim.keymap.set("n", "<F7>", "<cmd>AsyncTask build<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F8>", "<cmd>AsyncTask run<CR>", { noremap = true, silent = true })

-- debug
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue() 		<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over() 		<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_into() 		<CR>", { noremap = true, silent = true })

-- basic
vim.keymap.set("n", "<C-u>", "9k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "9j", { noremap = true, silent = true })

vim.keymap.set("n", "<A-up>", "<cmd> res+5				<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-down>", "<cmd> res-5				<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-left>", "<cmd> vertical resize-5	<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-right>", "<cmd> vertical resize+5	<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<A-H>", "<C-w>H", { noremap = true, silent = true })
vim.keymap.set("n", "<A-J>", "<C-w>J", { noremap = true, silent = true })
vim.keymap.set("n", "<A-K>", "<C-w>K", { noremap = true, silent = true })
vim.keymap.set("n", "<A-L>", "<C-w>L", { noremap = true, silent = true })


-- 取消find
vim.keymap.set("n", "<CR><CR>", "<cmd>noh<CR>", { noremap = true, silent = true })
-- buffer
vim.keymap.set("n", "<A-1>", "<cmd>LualineBuffersJump! 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-2>", "<cmd>LualineBuffersJump! 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-3>", "<cmd>LualineBuffersJump! 3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-4>", "<cmd>LualineBuffersJump! 4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-5>", "<cmd>LualineBuffersJump! 5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-6>", "<cmd>LualineBuffersJump! 6<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-7>", "<cmd>LualineBuffersJump! 7<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-8>", "<cmd>LualineBuffersJump! 8<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-9>", "<cmd>LualineBuffersJump! 9<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-$>", "<cmd>LualineBuffersJump! $<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>fk", "<cmd>Telescope  keymaps<CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>f/", "<cmd>Telescope  current_buffer_fuzzy_find<CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files <CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep <CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags <CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers <CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fp",
	"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fe",
	"<cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} <CR>",
	{ noremap = true, silent = true })
vim.keymap.set("n", "<leader>fa", "<Cmd>Telescope asynctasks all theme=dropdown <CR>",
	{ noremap = true, silent = true })


local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

vim.keymap.set("n", "g[", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "g]", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "gD", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
vim.keymap.set("n", "go", ":<C-u>CocList diagnostics<cr>", opts)

vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
vim.keymap.set("x", "<A-S-f>", "<Plug>(coc-format-selected)", { silent = true })
vim.keymap.set("n", "<A-S-f>", ":Format<CR>", { silent = true })

vim.keymap.set("n", "K", function()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end, { silent = true })

---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
vim.keymap.set("i", "<C-f>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set("i", "<C-b>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
vim.keymap.set("x", "<leader>ca", "<Plug>(coc-codeaction-selected)", opts)
vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)", opts)
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold"
})
vim.api.nvim_create_autocmd("User", {
	group = "CocGroup",
	pattern = "CocJumpPlaceholder",
	command = "call CocActionAsync('showSignatureHelp')",
	desc = "Update signature help on jump placeholder"
})

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
vim.keymap.set("n", "<leader>t", "<cmd>CocCommand explorer<CR>", opts)
vim.keymap.set("n", "<leader>e", ":<C-u>CocList extensions<cr>", opts)
vim.keymap.set("n", "<leader>cm", ":<C-u>CocList commands<cr>", opts)
vim.keymap.set("n", "<leader>o", ":<C-u>CocList outline<cr>", opts)
vim.keymap.set("n", "<leader>s", ":<C-u>CocList -I symbols<cr>", opts)
vim.keymap.set("n", "<leader>j", ":<C-u>CocNext<cr>", opts)
vim.keymap.set("n", "<leader>k", ":<C-u>CocPrev<cr>", opts)
vim.keymap.set("n", "<leader>p", ":<C-u>CocListResume<cr>", opts)
-- coc-git
vim.keymap.set("n", "[g", "<Plug>(coc-git-prevchunk)", opts)
vim.keymap.set("n", "]g", "<Plug>(coc-git-nextchunk)", opts)
vim.keymap.set("n", "[c", "<Plug>(coc-git-prevconflict)", opts)
vim.keymap.set("n", "c]", "<Plug>(coc-git-nextconflict)", opts)
vim.keymap.set("n", "<leader>hp", "<Plug>(coc-git-chunkinfo)", opts)
vim.keymap.set("n", "<leader>hs", "<cmd>CocCommand git.chunkStage<CR>", opts)
vim.keymap.set("n", "<leader>hu", "<cmd>CocCommand git.chunkUnstage<CR>", opts)
vim.keymap.set("n", "<leader>hr", "<cmd>CocCommand git.chunkUndo<CR>", opts)
vim.keymap.set("n", "<leader>hd", "<cmd>CocCommand git.diffCached<CR>", opts)
vim.keymap.set("n", "<leader>hb", "<cmd>CocCommand git.showBlameDoc<CR>", opts)
vim.keymap.set("n", "<leader>ho", "<cmd>CocCommand git.browserOpen<CR>", opts)
vim.keymap.set("n", "<leader>hf", "<cmd>CocCommand git.foldUnchanged<CR>", opts)
vim.keymap.set("n", "<leader>hc", "<Plug>(coc-git-commit)", opts)
vim.keymap.set("o", "ig", "<Plug>(coc-git-chunk-inner)", opts)
vim.keymap.set("x", "ig", "<Plug>(coc-git-chunk-inner)", opts)
vim.keymap.set("o", "ig", "<Plug>(coc-git-chunk-outter)", opts)
vim.keymap.set("x", "ig", "<Plug>(coc-git-chunk-outter)", opts)
vim.keymap.set("n", "<leader>gg", ":<C-u>CocList --normal gstatus<CR>", opts)
