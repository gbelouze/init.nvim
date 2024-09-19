return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			local wk = require("which-key")
			local trouble = require("trouble")
			local toggle_helper = function(opts)
				return function()
					trouble.toggle(opts)
				end
			end
			wk.add({
				{
					"<Leader>j",
					function()
						trouble.next({ skip_groups = true, jump = true })
					end,
					desc = "Trouble: Jump next",
				},
				{
					"<Leader>k",
					function()
						trouble.prev({ skip_groups = true, jump = true })
					end,
					desc = "Trouble: Jump previous",
				},
				{ "<Leader>x", group = "trouble" },
				{
					"<Leader>xc",
					trouble.close,
					desc = "Trouble: [c]lose",
				},
				{
					"<Leader>xd",
					toggle_helper("diagnostics"),
					desc = "Trouble: Toggle [d]iagnostics",
				},
				{
					"<Leader>xq",
					toggle_helper("quickfix"),
					desc = "Trouble: Toggle [q]uickfix",
				},
				{
					"<Leader>xl",
					toggle_helper("loclist"),
					desc = "Trouble: Toggle [l]oclist",
				},
				{
					"gR",
					toggle_helper("lsp_references"),
					desc = "Trouble: LSP [R]eferences",
				},
			})
		end,
	},
}
