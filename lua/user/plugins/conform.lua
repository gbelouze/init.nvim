return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				latex = { "latexindent" },
				lua = { "stylua" },
				markdown = { "prettier" },
				ocaml = { "ocamlformat" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black", "flake8" },
				yaml = { "yamlfmt", "prettier" },
				-- Not in conform yet
				-- sql = { "sqlfluff" }
			},
		})
	end,

	init = function()
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ timeout_ms = 2000, lsp_fallback = false })
		end, { desc = "[F]ormat current buffer" })

		vim.keymap.set("n", "<leader>F", function()
			require("conform").format({ timeout_ms = 10000, lsp_fallback = false })
		end, { desc = "[F]ormat current buffer (wait up to 10 sec)" })
	end,
}
