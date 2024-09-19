local opts = {
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
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-S-Space>",
        },
    },
    textobjects = {
        select = {
            enable = true,

            disable = { "latex" },

            lookahead = true,

            keymaps = {
                ["af"] = { query = "@function.outer", desc = "[A]round [F]unction" },
                ["if"] = { query = "@function.inner", desc = "[I]n [F]unction" },
                ["ac"] = { query = "@class.outer", desc = "[A]round [C]lass" },
                ["ic"] = { query = "@class.inner", desc = "[I]n [C]lass" },
                ["aa"] = { query = "@parameter.outer", desc = "[A]round [A]rgument" },
                ["ia"] = { query = "@parameter.inner", desc = "[I]n [A]rgument" },
                ["ad"] = { query = "@comment.outer", desc = "[A]round  [D]escription" }, -- 'd' is for 'description' since 'c' is taken for class
                ["id"] = { query = "@comment.inner", desc = "[I]n [D]escription" },
            },

            selection_modes = {
                ["@function.outer"] = "V", -- linewise
                ["@function.inner"] = "V",
                ["@class.outer"] = "V",
                ["@class.inner"] = "V",
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
                ["ganf"] = { query = "@function.outer", desc = "[G]o [A]t [N]ext [F]unction" },
                ["ganc"] = { query = "@class.outer", desc = "[G]o [A]t [N]ext [C]lass" },
            },
            goto_next_end = {
                ["gafe"] = { query = "@function.outer", desc = "[G]o [A]t [F]unction [E]nd" },
                ["gace"] = { query = "@class.outer", desc = "[G]o [A]t [C]lass [E]nd" },
            },
            goto_previous_start = {
                ["gafs"] = { query = "@function.outer", desc = "[G]o [A]t [F]unction [S]tart" },
                ["gacs"] = { query = "@class.outer", desc = "[G]o [A]t [C]lass [S]tart" },
            },
        },
    },
}
return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup({ opts })
        end,
    },
}
