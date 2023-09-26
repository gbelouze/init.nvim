return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip").config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
				update_events = "TextChanged,TextChangedI",
			})
		end,
		init = function(_)
			local loader = require("luasnip.loaders.from_lua")

			loader.load({
				paths = "~/.config/nvim/snippets",
			})

			vim.keymap.set(
				"n",
				"<Leader>L",
				'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})<CR>',
				{
					desc = "Reload the snippets",
				}
			)

			vim.keymap.set({ "i", "s" }, "<C-d>", "<Plug>luasnip-jump-next", {
				desc = "Jump to the next Luasnip placeholder",
			})
		end,
	},
}
