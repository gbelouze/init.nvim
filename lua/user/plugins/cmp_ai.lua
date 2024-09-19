return {
	{
		"tzachar/cmp-ai",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			max_lines = 500,
			provider = "Ollama",
			provider_options = {
				model = "mistral",
			},
			notify = true,
			notify_callback = function(msg)
				vim.notify(msg)
			end,
			run_on_every_keystroke = false,
			ignored_file_types = {
				-- default is not to ignore
				-- uncomment to ignore in lua:
				-- lua = true
			},
		},
	},
}
