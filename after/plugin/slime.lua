vim.g.slime_target = "tmux"

local wk = require("which-key")
wk.register({
	["<leader>"] = {
		r = {
			name = "+slime",
			c = { ":SlimeConfig<CR>", "Config REPL" },
			p = { "<Plug>SlimeParagraphSend", "Send paragraph to REPL" },
			s = { ":SlimeSendCurrentLine<CR>", "Send current line to REPL" },
			r = { [[:SlimeSend0 "\n"<CR>]], "Send \\n to REPL" },
            f = { "ggVG<Plug>SlimeRegionSend", "Send whole file to REPL"}
		},
	},
})
wk.register({
	["<leader>"] = {
		r = { "<Plug>SlimeRegionSend", "Send selection to REPL" },
	},
}, { mode = "v" })
