local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.ensure_installed({
	"emmet_ls",
	"sumneko_lua",
	"tailwindcss",
	"eslint",
	"volar",
	"html",
	"eslint",
})

lsp.setup_nvim_cmp({
	sources = {
		-- This one provides the data from copilot.
		{ name = 'copilot' },

		--- These are the default sources for lsp-zero
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2 },
	},
	mapping = lsp.defaults.cmp_mappings({
		['<CR>'] = cmp.mapping.confirm({
			-- documentation says this is important.
			-- I don't know why.
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		})
	})
})

lsp.configure('volar', {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

lsp.configure('eslint', {

	filetypes = {
		"javascript",
		"typescript",
		"typescriptreact",
		"vue",
		"json",
	},
	settings = {
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
	},
})

lsp.configure('sumneko_lua', {
	Lua = {
		diagnostics = { globals = { 'vim' }, disable = { "lowercase-global" } },
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false
		},
		telemetry = { enable = false },
	},
})

lsp.on_attach(function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end)

vim.cmd([[autocmd BufWritePre *.vue,*.tsx,*.ts,*.jsx,*.js EslintFixAll]])
-- vim.cmd([[autocmd BufWritePre <buffer> Format]])

lsp.setup()
