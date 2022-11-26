require('cppassist').setup {
	-- For `SwitchSourceAndHeader`, `ImplementInSource` and `ImplementOutOfClass` command
	switch_sh = {
		-- Search for target files in the following directories
		include_dirs = { ".", ".." },
		-- Exclude the following directories when searching for target files
		exclude_dirs = {},
		-- If you want other flags, see `man fd`
		-- -t: This option can be specified more than once to include multiple file types.
		-- -s: Perform a case-sensitive search.
		-- -L: Using this flag, symbolic links are also traversed.
		search_flags = "-tf -s -L",
		-- If the return type contains the following keywords, the value of the right side will be used in the return statement
		return_type = {
			int = "0",
			short = "0",
			long = "0",
			char = "0",
			double = "0.0",
			float = "0.0",
			bool = "false",
			pointer = "nullptr",
		}
	},
	-- For `GotoHeaderFile` command
	goto_header = {
		include_dirs = { ".", "..", "/usr/include", "/usr/local/include", "~" },
		exclude_dirs = {},
		search_flags = "-tf -s",
	},
}
