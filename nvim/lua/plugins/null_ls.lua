return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier_d_slim,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.formatting.erb_format,
				null_ls.builtins.formatting.rubocop,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function()
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
