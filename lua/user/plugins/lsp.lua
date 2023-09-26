return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("neodev").setup({})

			local lspconfig = require("lspconfig")
			lspconfig.pylsp.setup({
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
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local nmap = function(key, action, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", key, action, { buffer = ev.buf, desc = desc })
					end

					nmap("<leader>f", function()
						vim.lsp.buf.format({ timeout_ms = 2000 })
					end, "[F]ormat current buffer")
					nmap("<leader>F", function()
						vim.lsp.buf.format({ timeout_ms = 10000 })
					end, "[F]ormat current buffer (wait up to 10s)")

					nmap("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
					nmap("gr", require("telescope.builtin").lsp_references, "[G]o to [R]eferences")
					nmap("gI", require("telescope.builtin").lsp_implementations, "[G]o to [I]mplementation")
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					nmap("gl", vim.diagnostic.open_float, "Show diagnostics in floating window")
					nmap("K", vim.lsp.buf.hover, "Hover")
					nmap("<C-K>", vim.lsp.buf.signature_help, "Signature")
				end,
			})
		end,
	},
}
