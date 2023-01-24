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
