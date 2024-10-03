return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		config = function()
		end,
	},
}
