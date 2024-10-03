return {
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		init = function()
			local wk = require("which-key")
			wk.add({
				{
					"w",
					"<cmd>lua require('spider').motion('w')<CR>",
					mode = { "n", "o", "x" },
					desc = "Spider-w",
				},

				{
					"e",
					"<cmd>lua require('spider').motion('e')<CR>",
					mode = { "n", "o", "x" },
					desc = "Spider-e",
				},

				{
					"b",
					"<cmd>lua require('spider').motion('b')<CR>",
					mode = { "n", "o", "x" },
					desc = "Spider-b",
				},
			})
		end,
	},
}
