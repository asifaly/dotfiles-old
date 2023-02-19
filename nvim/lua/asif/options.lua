-- [[ options.lua ]]
vim.cmd('highlight Normal guibg=none')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python2_host_prog = "/usr/bin/python2"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.isfname:append("@-@")
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.scrolloff = 4
vim.opt.wildmode = "longest:full,full"

vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup"
vim.opt.directory = os.getenv("HOME") .. "/.vim/swap"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
