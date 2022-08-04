local dap = require('dap')

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			-- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			return vim.fn.expand("%<")
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = true,
	},
}
