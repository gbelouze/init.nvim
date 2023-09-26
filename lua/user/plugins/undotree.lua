return {
	{
		"mbbill/undotree", -- undo history
		init = function(_)
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
	},
}
