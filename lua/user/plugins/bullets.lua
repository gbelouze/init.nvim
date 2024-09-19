return {
	"bullets-vim/bullets.vim",
	init = function()
		vim.g.bullets_set_mappings = 0
	end,
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "text", "markdown", "scratch", "gitcommit" },
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				local wk = require("which-key")
				wk.add({
					{ "<cr>", "<Plug>(bullets-newline)", mode = "i" },
					{ "<<", "<Plug>(bullets-promote)", mode = "n", desc = "Bullets: Promote" },
					{ "<", "<Plug>(bullets-promote)gv", mode = "v", desc = "Bullets: Promote" },
					{ "<S-tab>", "<Plug>(bullets-promote)", mode = "i", desc = "Bullets: Promote" },
					{ ">>", "<Plug>(bullets-demote)", mode = "n", desc = "Bullets: Demote" },
					{ ">", "<Plug>(bullets-demote)gv", mode = "v", desc = "Bullets: Demote" },
					{ "<tab>", "<Plug>(bullets-demote)", mode = "i", desc = "Bullets: Demote" },
					{ "<leader>b", "<Plug>(bullets-toggle-checkbox)", mode = "n", desc = "Bullets: Toggle Check[B]ox" },
					{ "gN", "<Plug>(bullets-renumber)", mode = { "n", "v" }, desc = "Bullets: Renumber list" },
					{ "o", "<Plug>(bullets-newline)", mode = "n", desc = "Bullets: New line" },
				}, { buffer = buf })
			end,
		})
	end,
}
