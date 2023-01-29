-- [[ options.lua ]]
local o = vim.opt
o.clipboard = "unnamedplus"
o.hlsearch = true
o.nu = true
o.rnu = true
o.mouse = "a"
o.breakindent = true
o.smartindent = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.signcolumn = "yes"
o.termguicolors = true
o.undofile = true
o.backupdir = os.getenv("HOME") .. "/.vim/backup"
o.directory = os.getenv("HOME") .. "/.vim/swap"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"
o.isfname:append("@-@")

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python2_host_prog = "/usr/bin/python2"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
