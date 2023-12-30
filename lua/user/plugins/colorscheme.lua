return {
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {},
		init = function(_)
			vim.cmd([[colorscheme catppuccin-frappe]])

			vim.api.nvim_create_user_command("Light", function()
				vim.cmd([[colorscheme catppuccin-latte]])
			end, {})
			vim.api.nvim_create_user_command("Dark", function()
				vim.cmd([[colorscheme catppuccin-frappe]])
			end, {})
		end,
	},
}
