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
				vim.opt.background = "light"
			end, {})
			vim.api.nvim_create_user_command("Dark", function()
				vim.opt.background = "dark"
			end, {})
		end,
	},
}
