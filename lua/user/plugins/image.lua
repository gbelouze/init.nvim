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
		max_width = 100, -- tweak to preference
		max_height = 12, -- ^
		max_height_window_percentage = math.huge, -- this is necessary for a good experience
		max_width_window_percentage = math.huge,
		window_overlap_clear_enabled = true,
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	},
}
