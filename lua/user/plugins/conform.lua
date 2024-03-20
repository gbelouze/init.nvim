return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
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
}
