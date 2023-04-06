local lsp = require("lsp-zero")
lsp.preset({
	name = "recommended",
	set_lsp_keymaps = true,
})
lsp.ensure_installed({
	"lua_ls",
})

-- Fix 'undefined global vim' diagnostics
lsp.configure("lua_ls", {
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

lsp.on_attach(function(client, bufnr)
	local bind = vim.keymap.set
	bind("n", "<leader>f", function()
		vim.lsp.buf.format({ timeout_ms = 2000 })
	end, {
		buffer = bufnr,
		desc = "Format current buffer",
	})

	bind("n", "<leader>F", function()
		vim.lsp.buf.format({ timeout_ms = 10000 })
	end, {
		buffer = bufnr,
		desc = "Format current buffer (wait up to 10s)",
	})

	bind("n", "gl", vim.diagnostic.open_float, {
		buffer = bufnr,
		desc = "Show diagnostics in floating window",
	})

    bind("n", "<C-B>", vim.lsp.buf.signature_help, {
        buffer = bufnr,
        desc = "Show signature in floating window"
    })
end)

lsp.setup()
