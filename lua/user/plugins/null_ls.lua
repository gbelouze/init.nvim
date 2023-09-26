return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.ocamlformat,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.sqlfluff.with({
						extra_args = { "--dialect", "postgres" },
					}),
				},
			})
		end,
	},
}
