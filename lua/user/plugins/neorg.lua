return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("neorg").setup({
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
                            hook = function (keybinds)
                                keybinds.remap_key("norg", "i", "<C-d>", "<C-h>")
                                keybinds.remap_key("norg", "i", "<C-t>", "<C-l>")
                            end
                        }
                    }
                    -- unavailable while nvim 10.0.0 is nightly
                    -- ["core.tempus"] = {}
				},
			})
		end,
		-- build = ":Neorg sync-parsers",
		init = function()
			local wk = require("which-key")
			wk.register({
				["<Leader>"] = {
					n = {
						name = "+neorg",
						i = {
							function()
								vim.cmd([[Neorg index]])
							end,
							"Neorg index",
						},
                        c = {
                            function ()
                                vim.cmd([[Neorg toggle-concealer]])
                            end,
                            "Neorg toggle-concealer"
                        },
						r = {
							function()
								vim.cmd([[Neorg return]])
							end,
							"Neorg return",
						},
                        w = {
                            ":Neorg workspace ",
                            "Neorg workspace"
                        }
					},
				},
			})
		end,
	},
}
