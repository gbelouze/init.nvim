return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
						folds = true,
						icons = {
							todo = {
								pending = {
									icon = "",
								},
							},
							quote = {
								icons = { ">" },
							},
						},
					},
				}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
							phd = "~/Documents/phd/notes",
						},
						default_workspace = "notes",
						index = "index.norg",
					},
				},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							keybinds.remap_key("norg", "i", "<C-d>", "<C-h>")
							keybinds.remap_key("norg", "i", "<C-t>", "<C-l>")
						end,
					},
				},
				["core.esupports.indent"] = {
					config = {
						tweaks = (function(tablen)
							return {
								heading1 = 0 * tablen,
								heading2 = 1 * tablen,
								heading3 = 2 * tablen,
								heading4 = 3 * tablen,
								heading5 = 4 * tablen,
								heading6 = 5 * tablen,
							}
						end)(2),
					},
				},
				-- unavailable while nvim 10.0.0 is nightly
				-- ["core.tempus"] = {}
			},
		},
		-- build = ":Neorg sync-parsers",
		init = function()
			local wk = require("which-key")
			wk.add({
				{ "<Leader>n", group = "neorg" },
				{
					"<Leader>ni",
					function()
						vim.cmd([[Neorg index]])
					end,
					desc = "Neorg index",
				},
				{
					"<Leader>nc",
					function()
						vim.cmd([[Neorg toggle-concealer]])
					end,
					desc = "Neorg toggle-concealer",
				},
				{
					"<Leader>nr",
					function()
						vim.cmd([[Neorg return]])
					end,
					desc = "Neorg return",
				},
				{ "<Leader>nw", ":Neorg workspace ", desc = "Neorg workspace" },
			})
		end,
	},
}
