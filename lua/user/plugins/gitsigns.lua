local on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "]c", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true, desc = "Go to next hunk" })

	map("n", "[c", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true, desc = "Go to previous hunk" })

	-- Actions
	map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
	map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
	map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
	map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
	map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
	map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
	map("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, { desc = "Git blame current line" })
	map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle current line blame " })
	map("n", "<leader>hd", gs.diffthis, { desc = "Git diff" })
	map("n", "<leader>hD", function()
		gs.diffthis("~")
	end, { desc = "Git diff with head" })
	map("n", "<leader>td", gs.toggle_deleted)

	-- Text object
	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Current hunk text object" })
end

return {
	{
		"lewis6991/gitsigns.nvim",
		-- enable = false,
		opts = { on_attach = on_attach },
	},
}
