return {
	{
		"vhyrro/luarocks.nvim",
		-- opts = {
		-- 	rocks = {
		-- 		"magick",
		-- 	},
		-- },
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"3rd/image.nvim",
		dependencies = "vhyrro/luarocks.nvim",
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "markdown" }, -- things like "vimwiki" can go here
				},
				neorg = {
					enabled = false,
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
		},
	},
}
