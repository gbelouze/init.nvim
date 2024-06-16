return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local wk = require("which-key")
			wk.register({
				["<leader>"] = {
					x = {
						name = "+trouble",
						x = { function() require("trouble").toggle() end, "Trouble: Toggle", },
						w = { function() require("trouble").toggle("workspace_diagnostics") end,
							"Trouble: Toggle [w]orkspace diagnostics", },
						d = {
							function() require("trouble").toggle("document_diagnostics") end,
							"Trouble: Toggle [d]ocument diagnostics", },
						q = {
							function() require("trouble").toggle("quickfix") end,
							"Trouble: Toggle [q]uickfix", },
						l = {
							function() require("trouble").toggle("loclist") end,
							"Trouble: Toggle [l]oclist", },
					},
					j = { function() require("trouble").next({ skip_groups=true, jump = true }) end,
						"Trouble: Jump next", },
					k = { function() require("trouble").previous({ skip_groups=true, jump = true }) end,
						"Trouble: Jump previous", },
				},
				["gR"] = { function() require("trouble").toggle("lsp_references") end,
					"Trouble: LSP [R]eferences", },
			})
		end,
	},
}
