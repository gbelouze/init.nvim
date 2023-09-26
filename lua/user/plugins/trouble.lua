return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function(_)
			require("nvim-web-devicons").set_icon({
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
			})
		end,
	},
}
