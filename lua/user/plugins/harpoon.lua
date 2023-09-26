return {

	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
        opts = {},
		init = function(_)
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark current file in Harpoon" })
			vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Show Harpoon menu" })

			vim.keymap.set("n", "<C-h>", function()
				ui.nav_file(1)
			end, { desc = "Harpoon to file 1" })
			vim.keymap.set("n", "<C-t>", function()
				ui.nav_file(2)
			end, { desc = "Harpoon to file 2" })
			vim.keymap.set("n", "<C-n>", function()
				ui.nav_file(3)
			end, { desc = "Harpoon to file 3" })
			vim.keymap.set("n", "<C-s", function()
				ui.nav_file(4)
			end, { desc = "Harpoon to file 4" })
		end,
	},
}
