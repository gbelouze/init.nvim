local gx_markview_patch = function()
    -- code taken directly from markview. Somehow the keymap is not registered with the plugin so I have to do it myself.
	local buffer = vim.fn.bufnr()
	local keymaps = require("markview.keymaps")
	local buf_links = keymaps.views[buffer]
	local cursor = vim.api.nvim_win_get_cursor(0)

	for _, link in ipairs(buf_links) do
		if link.row_start + 1 ~= cursor[1] then
			goto continue
		end

		if cursor[2] < link.col_start or cursor[2] > link.col_end then
			goto continue
		end

		local cmd, err = vim.ui.open(vim.fn.fnamemodify(link.address, ":~"))

		if err then
			vim.print("[ Markview.nvim ] : Failed to open: " .. link.address)
			break
		end

		if cmd then
			cmd:wait()
			break
		end

		::continue::
	end

	local def_cmd, def_err = vim.ui.open(vim.fn.expand("<cfile>"))

	if def_err then
		vim.print("[ Markview.nvim ] : Failed to open: " .. vim.fn.expand("<cfile>"))
	end

	if def_cmd then
		def_cmd:wait()
	end
end

return {
	{
		"OXY2DEV/markview.nvim",

		lazyload = true,
		ft = "markdown", -- If you decide to lazy-load anyway

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			require("markview").setup({
				modes = { "n", "no", "c" }, -- Change these modes
				-- to what you need

				hybrid_modes = { "n" }, -- Uses this feature on
				-- normal mode

				links = {
					enable = true,
				},

				-- This is nice to have
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "c"
					end,
				},
			})
		end,
		keys = {
			{
				"gx",
				gx_markview_patch,
				desc = "Markview: patch for `gx`",
				ft = "markdown",
			},
		},
	},
}
