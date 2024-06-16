return {
	{
		"jpalardy/vim-slime", -- REPL
		init = function(_)
			vim.g.slime_target = "tmux"

			local wk = require("which-key")
			wk.register({
				["<leader>R"] = {
					name = "+slime",
					c = { ":SlimeConfig<CR>", "Slime: [c]onfig REPL" },
					p = { "<Plug>SlimeParagraphSend", "Slime: Send [p]aragraph to REPL" },
					s = { ":SlimeSendCurrentLine<CR>", "Slime: [s]end current line to REPL" },
					r = { [[:SlimeSend0 "\n"<CR>]], "Slime: Send \\n to REPL" },
					f = { "ggVG<Plug>SlimeRegionSend", "Slime: Send whole [f]ile to REPL" },
				},
			})
			wk.register({
				["<leader>R"] = {
					"<Plug>SlimeRegionSend",
					"Send selection to REPL",
					mode = "x",
				},
			})
		end,
	},
}
