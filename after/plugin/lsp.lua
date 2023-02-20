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

local cmp_sources = lsp.defaults.cmp_sources()
table.insert(cmp_sources, { name = "omni" }) -- integrate with vimtex completion engine
lsp.setup_nvim_cmp({
	sources = cmp_sources,
})

lsp.configure("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					maxLineLength = 100,
					convention = "numpy",
				},
			},
		},
	},
})

lsp.setup()

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ timeout_ms = 2000 })
end, {
	desc = "Format current buffer",
})

vim.keymap.set("n", "<leader>F", function()
	vim.lsp.buf.format({ timeout_ms = 10000 })
end, {
	desc = "Format current buffer (wait up to 10s)",
})
