-- https://github.com/p00f/clangd_extensions.nvim
-- https://clangd.llvm.org/extensions
--
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

require("clangd_extensions").setup {
	server = {
		capabilities = capabilities,
		on_attach = lsp_status.on_attach,
		handlers = lsp_status.extensions.clangd.setup(),
		cmd = {"clangd"},
		filetypes = {"c", "cpp", "objc", "objcpp"},
		single_file_support = true,
		init_options = {
			clangdFileStatus = true
		},
	},
	extensions = {
		-- defaults:
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			-- Only show inlay hints for the current line
			only_current_line = true,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold,CursorHoldI",
			-- whether to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "func: ",
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "-> ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 7,
			-- The color of the hints
			highlight = "Comment",
			-- The highlight group priority for extmark
			priority = 100,
		},
		ast = {
			role_icons = {
				type = "⊿",
				declaration = "",
				expression = "😑",
				specifier = "📌",
				statement = "",
				["template argument"] = "🛕",
			},

			kind_icons = {
				Compound = "匿",
				Recovery = "",
				TranslationUnit = "隷",
				PackExpansion = "📦",
				TemplateTypeParm = "⦂",
				TemplateTemplateParm = "ﮕ",
				TemplateParamObject = "",
			},

			highlights = {
				detail = "Comment",
			},
		},
		memory_usage = {
			border = "none",
		},
		symbol_info = {
			border = "none",
		},
	},
}
