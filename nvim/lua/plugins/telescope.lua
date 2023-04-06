return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.1",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local builtin = require("telescope.builtin")
		local map = vim.keymap.set
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
						["<c-t>"] = trouble.open_with_trouble,
					},
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
				file_ignore_patterns = { "node_modules" },
			},
		})
		-- See `:help telescope.builtin`
		map("n", "<leader>'", builtin.keymaps, { desc = "['] List Key Maps" })
		map("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
		map("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		map("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer]" })

		map("n", "<leader>sf", builtin.git_files, { desc = "[S]earch Git [F]iles" })
		map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind All [F]iles" })
		map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
		map("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")
	end,
}
