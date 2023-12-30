-- Incredible plugin to provide neovim instances in browser text fields
return {
	-- {
	-- 	"glacambre/firenvim",
	-- 	lazy = not vim.g.started_by_firenvim,
	-- 	build = function()
	-- 		vim.fn["firenvim#install"](0)
	-- 	end,
	-- },
    {
        "subnut/nvim-ghost.nvim",
        config = function ()
            vim.api.nvim_create_autocmd("User", {
                group = "nvim_ghost_user_autocommands",
                pattern = "code.earthengine.google.com",
                callback = function ()
                    vim.bo.filetype = "javascript"
                end
            })
        end
    }
}
