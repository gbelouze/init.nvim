return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({})
			local wk = require("which-key")
			wk.register({
				["<leader>r"] = {
					name = "+refactoring",
					e = {
						function()
							require("refactoring").refactor("Extract function")
						end,
						"Refactor: [e]xtract function",
						mode = "x",
					},
					f = {
						function()
							require("refactoring").refactor("Extract Function To File")
						end,
						"Refactor: Extract function to [f]ile",
						mode = "x",
					},
					v = {
						function()
							require("refactoring").refactor("Extract Variable")
						end,
						"Refactor: Extract [v]ariable",
						mode = "x",
					}, -- Extract variable supports only visual mode
					I = {
						function()
							require("refactoring").refactor("Inline Function")
						end,
						"Refactor: [I]nline function",
						mode = "n",
					}, -- Inline func supports only normal
					i = {
						function()
							require("refactoring").refactor("Inline Variable")
						end,
						"Refactor: [i]nline variable",
						mode = { "n", "x" },
					},
					b = {
						function()
							require("refactoring").refactor("Extract Block")
						end,
						"Refactor: Extract [b]lock",
						mode = "n",
					},
					B = {
						function()
							require("refactoring").refactor("Extract Block To File")
						end,
						"Refactor: Extract [B]lock to file",
						mode = "n",
					}, -- Extract block supports only normal mode
				},
			})
		end,
	},
}
