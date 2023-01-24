local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	"sumneko_lua",
})

-- Fix 'undefined global vim' diagnostics
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
})

lsp.setup()

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
