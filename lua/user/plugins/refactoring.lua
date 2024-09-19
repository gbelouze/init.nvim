return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		init = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>r", group = "refactoring" },
				{
					"<Leader>re",
					function()
						require("refactoring").refactor("Extract function")
					end,
					desc = "Refactor: [e]xtract function",
					mode = "x",
				},
				{
					"<Leader>rf",
					function()
						require("refactoring").refactor("Extract Function To File")
					end,
					desc = "Refactor: Extract function to [f]ile",
					mode = "x",
				},
				{
					"<Leader>rv",
					function()
						require("refactoring").refactor("Extract Variable")
					end,
					desc = "Refactor: Extract [v]ariable",
					mode = "x",
				}, -- Extract variable supports only visual mode
				{
					"<Leader>rI",
					function()
						require("refactoring").refactor("Inline Function")
					end,
					desc = "Refactor: [I]nline function",
					mode = "n",
				}, -- Inline func supports only normal
				{
					"<Leader>ri",
					function()
						require("refactoring").refactor("Inline Variable")
					end,
					desc = "Refactor: [i]nline variable",
					mode = { "n", "x" },
				},
				{
					"<Leader>rb",
					function()
						require("refactoring").refactor("Extract Block")
					end,
					desc = "Refactor: Extract [b]lock",
					mode = "n",
				},
				{
					"<Leader>rB",
					function()
						require("refactoring").refactor("Extract Block To File")
					end,
					desc = "Refactor: Extract [B]lock to file",
					mode = "n",
				}, -- Extract block supports only normal mode
			})
		end,
	},
}
