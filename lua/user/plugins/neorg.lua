return {
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
                    ["core.keybinds"] = {
                        config = {
                            hook = function (keybinds)
                                keybinds.remap_key("norg", "i", "<C-d>", "<C-h>")
                                keybinds.remap_key("norg", "i", "<C-t>", "<C-l>")
                            end
                        }
                    }
				},
			})
		end,
		-- build = ":Neorg sync-parsers",
		dependencies = "nvim-lua/plenary.nvim",
	},
}
