-- https://github.com/neoclide/coc.nvim

-- Some servers have issues with backup files, see #649.
local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keyset("i", "<leader>e", "coc#refresh()", { silent = true, expr = true })
keyset("i", "<C-e>", "coc#pum#cancel()", { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keyset("n", "g[", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "g]", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation.
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gD", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
keyset("n", "go", ":<C-u>CocList diagnostics<cr>", opts)


-- Use K to show documentation in preview window.
function _G.show_docs()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming.
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


-- Formatting selected code.
keyset("x", "<A-S-f>", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<A-S-f>", "<Plug>(coc-format-selected)", { silent = true })


-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
	group = "CocGroup",
	pattern = "typescript,json",
	command = "setl formatexpr=CocAction('formatSelected')",
	desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
	group = "CocGroup",
	pattern = "CocJumpPlaceholder",
	command = "call CocActionAsync('showSignatureHelp')",
	desc = "Update signature help on jump placeholder"
})

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
keyset("n", "<leader>ca", "<Plug>(coc-codeaction)", opts)


-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)


-- Run the Code Lens action on the current line.
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })


-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.

-- vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
-- set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics.

-- coc-git
-- navigate chunks of current buffer
keyset("n", "[g", "<Plug>(coc-git-prevchunk)", opts)
keyset("n", "]g", "<Plug>(coc-git-nextchunk)", opts)

-- navigate conflicts of current buffer
keyset("n", "[c", "<Plug>(coc-git-prevconflict)", opts)
keyset("n", "c]", "<Plug>(coc-git-nextconflict)", opts)

-- " show chunk diff at current position
keyset("n", "gp", "<Plug>(coc-git-chunkinfo)", opts)
keyset("n", "gs", "<cmd>CocCommand git.chunkStage<CR>", opts)

-- " show commit contains current position
keyset("n", "gm", "<Plug>(coc-git-commit)", opts)

-- " create text object for git chunks
keyset("o", "ig", "<Plug>(coc-git-chunk-inner)", opts)
keyset("x", "ig", "<Plug>(coc-git-chunk-inner)", opts)
keyset("o", "ig", "<Plug>(coc-git-chunk-outter)", opts)
keyset("x", "ig", "<Plug>(coc-git-chunk-outter)", opts)

-- nnoremap <silent> <leader>gg
keyset("n", "<leader>gg", ":<C-u>CocList --normal gstatus<CR>", opts)
