require("neodev").setup({})

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

-- lsp.configure("sqlls", {
--     settings = {}
-- })

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


-- local cmp = require("cmp")
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-p>"] = cmp.mapping.select_prev_item(),
-- 		["<C-n>"] = cmp.mapping.select_next_item(),
-- 		["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 	}),
-- 	matching = {
-- 		disallow_partial_fuzzy_matching = true,
-- 	},
-- 	sources = {
--         { name = "nvim_lsp", max_item_count = 2 },
-- 		{ name = "luasnip" },
--         { name = "path" },
-- 		{ name = "omni" }, -- integreate with vimtex completion engine
-- 		{ name = "buffer", keyword_length = 3 },
-- 	},
-- 	sorting = {
-- 		priority_weight = 100,
-- 	},
-- 	formatting = {
-- 		format = function(entry, item)
-- 			if entry.source.name == "buffer" then
-- 				item.menu = "[Buffer]"
-- 			elseif entry.source.name == "nvim_lsp" then
-- 				item.menu = "{" .. entry.source.source.client.name .. "}"
-- 			else
-- 				item.menu = "[" .. entry.source.name .. "]"
-- 			end
-- 			return item
-- 		end,
-- 	},
-- })
