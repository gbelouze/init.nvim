return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"folke/which-key.nvim",
		},
		init = function(_)
			local wk = require("which-key")
			local function vim_cmd(cmd)
				return function()
					vim.cmd(cmd)
				end
			end
			wk.add({
				{ "<leader>t", group = "tree" },
				{ "<Leader>tt", vim_cmd("Neotree focus filesystem"), desc = "Open Neotree" },
				{ "<Leader>tw", vim_cmd("Neotree close"), desc = "Close Neotree" },
				{ "<Leader>tb", vim_cmd("Neotree focus buffers"), desc = "Open current buffer tree" },
				{
					"<Leader>tc",
					vim_cmd("Neotree ~/.config/nvim/init.lua reveal_force_cwd"),
					desc = "Open nvim configuration directory",
				},
				{ "<Leader>tg", vim_cmd("Neotree float git_status"), desc = "Open a git status window" },
			})
		end,
	},
}
