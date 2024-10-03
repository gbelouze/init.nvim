return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"jmbuhr/otter.nvim",
			"kdheepak/cmp-latex-symbols",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"tzachar/cmp-ai",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-g>"] = cmp.mapping(
						cmp.mapping.complete({
							config = {
								sources = cmp.config.sources({
									{ name = "cmp_ai" },
									{ name = "codeium" },
								}),
							},
						}),
						{ "i" }
					),
				}),
				sources = {
					{ name = "otter" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "omni" }, -- integrate with vimtex completion engine
					{ name = "path" },
					{ name = "buffer" },
					{ name = "latex_symbols" },
					{ name = "emoji" },
				},

				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = {
							Codeium = "",
							Ollama = "󱖿",
							latex_symbols = "",
							emoji = "😊",
							otter = "🦦",
						},
					}),
				},
			})
		end,
	},
}
