require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "vimdoc", "python", "ocaml", "html", "c", "lua", "vim", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		disable = { "latex", "sql" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
		disable = { "python" },
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = ",",
			node_incremental = ",",
			scope_incremental = "grc",
			node_decremental = ";",
		},
	},

	textobjects = {
		select = {
			enable = true,

			disable = { "latex" },

			lookahead = true,

			keymaps = {
				["af"] = { query = "@function.outer", desc = "[a]round [f]unction" },
				["if"] = { query = "@function.inner", desc = "[i]n [f]unction" },
				["ac"] = { query = "@class.outer", desc = "[a]round [c]lass" },
				["ic"] = { query = "@class.inner", desc = "[i]n [c]lass" },
				["aa"] = { query = "@parameter.outer", desc = "[a]round [a]rgument" },
				["ia"] = { query = "@parameter.inner", desc = "[i]n [a]rgument" },
				["ad"] = { query = "@comment.outer", desc = "[a]round  [d]escription" }, -- 'd' is for 'description' since 'c' is taken for class
				["id"] = { query = "@comment.inner", desc = "[i]n [d]escription" },
				["aj"] = { query = "@code_cell.outer", desc = "[a]round code cell" },
				["ij"] = { query = "@code_cell.inner", desc = "[i]n code cell" },
			},

			selection_modes = {
				["@function.outer"] = "V", -- linewise
				["@function.inner"] = "V",
				["@class.outer"] = "V",
				["@class.inner"] = "V",
				["@code_cell.outer"] = "V",
				["@code_cell.inner"] = "V",
				["@parameter.outer"] = "v", -- charwise
				["@parameter.inner"] = "v",
				["@comment.outer"] = "v",
				["@comment.inner"] = "v",
			},
		},

		swap = {
			enable = true,
			swap_next = {
				["<leader>pp"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>PP"] = "@parameter.inner",
			},
		},

		move = {
			-- TODO: this is not working currently
			enable = true,
			disable = { "latex" },
			set_jumps = true, -- wether to set jumps in the jumplist
			goto_next_start = {
				["ganf"] = { query = "@function.outer", desc = "[g]o [a]t [n]ext [f]unction" },
				["ganc"] = { query = "@class.outer", desc = "[g]o [a]t [n]ext [c]lass" },
				["ganj"] = { query = "@code_cell.outer", desc = "[g]o [a]t [n]ext cell" },
			},
			goto_next_end = {
				["gafe"] = { query = "@function.outer", desc = "[g]o [a]t [f]unction [e]nd" },
				["gace"] = { query = "@class.outer", desc = "[g]o [a]t [c]lass [e]nd" },
				["gaje"] = { query = "@code_cell.outer", desc = "[g]o [a]t cell [end]" },
			},
			goto_previous_start = {
				["gafs"] = { query = "@function.outer", desc = "[g]o [a]t [f]unction [s]tart" },
				["gacs"] = { query = "@class.outer", desc = "[g]o [a]t [c]lass [s]tart" },
				["gajs"] = { query = "@code_cell.outer", desc = "[g]o [a]t cell [s]tart" },
			},
		},
	},
})
