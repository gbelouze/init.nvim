return {
	-- LSP in code cells
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},

	-- Working with quarto manuscript (.qmd files representing notebooks)
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
			"benlubas/molten-nvim",
		},
		opts = {

			lspFeatures = {
				chunks = "all",
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		},
		init = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>m", group = "quarto[molten]" },
				{ "<leader>mn", group = "new cell" },
				{ "<leader>mny", "gajeo```python\n```<Esc>O", desc = "Insert a [n]ew p[y]thon cell.", mode = { "n" } },
				{ "<leader>mnm", "gajeo```markdown\n```<Esc>O", desc = "Insert a [n]ew p[m]thon cell.", mode = { "n" } },
				{ "<leader>mi", ":MoltenInit<cr>", desc = "Molten: [i]nit" },
				{
					"<leader>mr",
					function()
						require("quarto.runner").run_cell()
					end,
					mode = { "n", "v" },
					desc = "Quarto/Molten: [r]un cell",
				},
				{
					"<leader>mR",
					function()
						require("quarto.runner").run_all()
					end,
					mode = { "n", "v" },
					desc = "Quarto/Molten: [R]un all cells",
				},
				{
					"<leader>ma",
					function()
						require("quarto.runner").run_above()
					end,
					mode = { "n", "v" },
					desc = "Quarto/Molten: run cells [a]bove",
				},
				{
					"<leader>mb",
					function()
						require("quarto.runner").run_below()
					end,
					mode = { "n", "v" },
					desc = "Quarto/Molten: run cells [b]elow",
				},
				{ "<leader>ms", ":QuartoActivate<CR>", mode = { "n" }, desc = "Quarto/Molten: [s]tart the runner" },
			})
		end,
	},

	-- Translation from and to .ipynb
	{
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},

	-- Cell code runner
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_auto_open_output = false
		end,
		keys = {
			{ "<leader>mx", ":MoltenOpenInBrowser<CR>", desc = "Molten: open output in browser" },
		},
	},
}
