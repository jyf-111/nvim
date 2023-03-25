return {
	"ur4ltz/surround.nvim",
	dependencies = "tpope/vim-repeat",
	event = "BufRead",
	config = function()
		require("surround").setup({
			context_offset = 100,
			load_autogroups = true,
			mappings_style = "surround",
			map_insert_mode = true,
			quotes = { "'", '"' },
			brackets = { "(", "{", "[" },
			space_on_closing_char = false,
			pairs = {
				nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
				linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
			},
		})
	end,
}
