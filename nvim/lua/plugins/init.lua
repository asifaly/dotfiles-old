return {
	-- "tpope/vim-rails",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"tpope/vim-sleuth",
	"tpope/vim-endwise",
	"christoomey/vim-tmux-navigator",
	-- "tpope/vim-fugitive",
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = true,
		version = "nightly", -- optional, updated every week. (see issue #1193)
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/neodev.nvim",
		config = true,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = true,
	},
}
