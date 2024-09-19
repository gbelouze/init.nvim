return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
        opts = {},
		init = function(_)
			-- Make autopair behave with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			local Rule = require("nvim-autopairs.rule")
			local npairs = require("nvim-autopairs")

			npairs.add_rule(Rule("\\{", "\\}", "tex"))
			npairs.add_rule(Rule("$", "$", "tex"))
            npairs.add_rule(Rule("*", "*", "markdown"))
		end,
	}, -- delimiters
}
