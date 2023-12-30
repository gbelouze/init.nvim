return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			local mls = require("mason-lspconfig")
			mls.setup({})
			mls.setup_handlers({
				-- default handler
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					require("neodev").setup({})
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
								},
								completion = {
									callSnippet = "Both",
									keywordSnippet = "Disable",
									-- I prefer the snippets provided by LuaSnip + friendly-snippets
								},
							},
						},
					})
				end,
				["pylsp"] = function()
					require("lspconfig").pylsp.setup({
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = {
										enabled = false,
										maxLineLength = 120,
										convention = "numpy",
									},

									pyflakes = {
										enabled = false,
									},

									mccabe = {
										enabled = false,
									},

                                    mypy = {
                                        enabled = false,
                                    },

									flake8 = {
										enabled = true,
										maxLineLength = 120,
										convention = "numpy",
									},

									pydocstyle = {
										enabled = false,
									},
								},
							},
						},
					})
				end,
				["tsserver"] = function()
					require("lspconfig").tsserver.setup({})
				end,
			})
		end,
	},
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
						require("conform").format({ timeout_ms = 2000, lsp_fallback = true })
					end, "[F]ormat current buffer")
					nmap("<leader>F", function()
						require("conform").format({ timeout_ms = 10000, lsp_fallback = true })
					end, "[F]ormat current buffer (wait up to 10s)")

					nmap("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
					nmap("gr", require("telescope.builtin").lsp_references, "[G]o to [R]eferences")
					nmap("gI", require("telescope.builtin").lsp_implementations, "[G]o to [I]mplementation")
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					nmap("gl", function()
						vim.diagnostic.open_float({ source = true })
					end, "Show diagnostics in floating window")
					nmap("K", vim.lsp.buf.hover, "Hover")
					nmap("<C-K>", vim.lsp.buf.signature_help, "Signature")
				end,
			})
		end,
	},
}
