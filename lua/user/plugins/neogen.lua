return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		languages = {
			python = {
				template = {
					annotation_convention = "numpydoc",
				},
			},
		},
		snippet_engine = "luasnip",
	},
	init = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "neogen" },
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "[Neogen]: Generate documentation",
			},
		})
	end,
}
