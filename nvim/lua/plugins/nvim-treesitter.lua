return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the four listed parsers should always be installed)
			ensure_installed = { "javascript", "typescript", "vue", "lua", "vim", "help" },
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
		pcall(require("telescope").load_extension, "fzf")
	end,
}
