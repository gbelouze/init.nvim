return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	keys = {
		{
			"<Leader>cc",
			function()
				require("neogen").generate({})
			end,
			desc = "[Neogen]: Generate documentation",
		},
	},
	config = function()
		require("neogen").setup({
			languages = {
				python = {
					template = {
						annotation_convention = "numpydoc",
					},
				},
			},
			snippet_engine = "luasnip",
		})
	end,
}
