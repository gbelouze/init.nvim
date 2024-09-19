return {
	{
		"jpalardy/vim-slime", -- REPL
		init = function(_)
			vim.g.slime_target = "tmux"

			local wk = require("which-key")
			wk.add({
				{ "<leader>R", group = "slime" },
				{ "<leader>Rc", ":SlimeConfig<CR>", desc = "Slime: [c]onfig REPL" },
				{ "<leader>Rf", "ggVG<Plug>SlimeRegionSend", desc = "Slime: Send whole [f]ile to REPL" },
				{ "<leader>Rp", "<Plug>SlimeParagraphSend", desc = "Slime: Send [p]aragraph to REPL" },
				{ "<leader>Rr", ':SlimeSend0 "\\n"<CR>', desc = "Slime: Send \\n to REPL" },
				{ "<leader>Rs", ":SlimeSendCurrentLine<CR>", desc = "Slime: [s]end current line to REPL" },
				{ "<leader>R", "<Plug>SlimeRegionSend", desc = "Send selection to REPL", mode = "x" },
			})
		end,
	},
}
