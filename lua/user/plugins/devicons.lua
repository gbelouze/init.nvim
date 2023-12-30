return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					tex = {
						icon = "",
						color = "#3D6117",
						cterm_color = "22",
						name = "Tex",
					},
					pdf = {
						icon = "",
						color = "#b30b00",
						cterm_color = "124",
						name = "Pdf",
					},
				},
			})
		end,
	},
}
