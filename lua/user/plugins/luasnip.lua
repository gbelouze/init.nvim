return {
	{ "gbelouze/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "gbelouze/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				default_priority = 50,
			})
			local luasnip = require("luasnip")
			luasnip.config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
				update_events = "TextChanged,TextChangedI",
				loaders_store_source = true,
			})
			luasnip.filetype_extend("quarto", { "markdown", "python" })
		end,
		init = function(_)
			local ls = require("luasnip")
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

			vim.keymap.set({ "i", "s" }, "<C-d>", function()
				ls.jump(1)
			end, {
				desc = "Jump to the next Luasnip placeholder",
				silent = true,
			})
			vim.keymap.set({ "i", "s" }, "<C-u>", function()
				ls.jump(-1)
			end, {
				desc = "Jump to the previous Luasnip placeholder",
				silent = true,
			})
		end,
	},
}
