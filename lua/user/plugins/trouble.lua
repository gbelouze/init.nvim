return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
        keys = {
            { "<leader>xx", function() require("trouble").toggle() end },
            { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end },
            { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end },
            { "<leader>xq", function() require("trouble").toggle("quickfix") end },
            { "<leader>xl", function() require("trouble").toggle("loclist") end },
            { "<leader>j", function() require("trouble").next({ jump=true }) end },
            { "<leader>k", function() require("trouble").previous({ jump=true }) end },
            { "gR", function() require("trouble").toggle("lsp_references") end },
        },
	},
}
