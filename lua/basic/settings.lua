if vim.g.neovide then
	-- neovide specific settings
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	vim.g.neovide_transparency = 0.75
	vim.opt.guifont = [[JetBrainsMono NF:h14]]
end

-- if vim.fn.has("win32")  and vim.fn.executable("bash.exe") then
-- 	vim.o.shell = "bash.exe"
-- 	vim.o.shellcmdflag = "-c"
-- 	vim.o.shellredir = ">%s 2>&1"
-- 	vim.o.shellpipe = "2>&1 | tee"
-- 	vim.o.shellquote = ""
-- 	vim.o.shellxescape = ""
-- 	vim.o.shellxquote = ""
-- end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8,gb18030,gbk,gb2312,utf-16,cp936,usc-bom,euc-jp"

vim.o.autowrite = true
vim.o.clipboard = ""
vim.o.confirm = true
vim.o.cursorline = false
vim.o.formatoptions = "jcroqlnt"
vim.o.grepprg = "rg --vimgrep"

vim.o.lazyredraw = true
vim.o.spellcheck = true
vim.o.laststatus = 3
vim.g.netrw_sort_by = "time"
vim.g.netrw_sort_direction = "reverse"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
vim.o.number = true
vim.o.timeout = true
vim.o.updatetime = 100 -- update interval for gitsigns
vim.o.timeoutlen = 500 -- keymap timeout
vim.o.sessionoptions = "buffers,curdir,folds,winsize,winpos"
vim.o.undofile = true
vim.o.shortmess = "filnxtToOFI"
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.ruler = false
vim.o.compatible = false
vim.o.hlsearch = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.showcmd = false
vim.o.cmdheight = 0
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.pumheight = 15
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.syntax = "enable"
vim.o.filetype = "plugin"
vim.o.scrolloff = 5
vim.o.mouse = "n"
vim.o.selection = "exclusive"
vim.o.selectmode = "mouse,key"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.wrap = false
vim.o.viewoptions = "cursor,folds,slash,unix"
vim.o.list = false
vim.o.listchars = "tab:> ,trail:·"
vim.o.cindent = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.showmatch = true
vim.o.wildmenu = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
