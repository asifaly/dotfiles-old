return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local map = vim.keymap.set

		map("n", "<leader>a", mark.add_file, { desc = "Harpoon Add File" })
		map("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon Toggle Menu" })

		map("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Harpoon 1" })
		map("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Harpoon 2" })
		map("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Harpoon 3" })
		map("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Harpoon 4" })
		map("n", "<leader><left>", function()
			ui.nav_next()
		end, { desc = "Harpoon Next" })
		map("n", "<leader><right>", function()
			ui.nav_prev()
		end, { desc = "Harpoon Previous" })
	end,
}
