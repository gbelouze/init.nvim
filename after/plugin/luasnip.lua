local loader = require("luasnip.loaders.from_lua")
local ls = require("luasnip")

loader.load({
	paths = "~/.config/nvim/snippets",
})

ls.config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	update_events = "TextChanged,TextChangedI",
})

vim.keymap.set(
	"n",
	"<Leader>L",
	'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})<CR>',
	{
		desc = "Reload the snippets",
	}
)

vim.keymap.set("i", "<C-d>", "<Plug>luasnip-jump-next", {
	desc = "Jump to the next Luasnip placeholder",
})
