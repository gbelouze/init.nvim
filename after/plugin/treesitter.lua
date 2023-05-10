require 'nvim-treesitter.configs'.setup {
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
        disable = { "python" }
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = ",",
            node_incremental = ",",
            scope_incremental = "grc",
            node_decremental = ";",
        },
    }
}

require 'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,

            disable = { "latex" },

            lookahead = true,

            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Select around a function region" },
                ["if"] = { query = "@function.inner", desc = "Select in a function region" },
                ["ac"] = { query = "@class.outer", desc = "Select around a class region" },
                ["ic"] = { query = "@class.inner", desc = "Select in a class region" },
                ["aa"] = { query = "@parameter.outer", desc = "Select around a parameter region" }, -- 'a' is for 'argument' since 'p' is taken for paragraph
                ["ia"] = { query = "@parameter.inner", desc = "Select in a parameter region" },
                ["ad"] = { query = "@comment.outer", desc = "Select around a comment region" }, -- 'd' is for 'description' since 'c' is taken for class
                ["id"] = { query = "@comment.inner", desc = "Select in a comment region" },
            },

            selection_modes = {
                ['@function.outer'] = 'V', -- linewise
                ['@function.inner'] = 'V',
                ['@class.outer'] = 'V',
                ['@class.inner'] = 'V',
                ['@parameter.outer'] = 'v', -- charwise
                ['@parameter.inner'] = 'v',
                ['@comment.outer'] = 'v',
                ['@comment.inner'] = 'v',
            }
        },

        swap = {
            enable = true,
            swap_next = {
                ["<leader>pp"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>PP"] = "@parameter.inner"
            }
        },

        move = {
            enable = true,
            disable = { "latex" },
            set_jumps = true, -- wether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = { query = "@function.outer", desc = "Next function start" },
                ["]]"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_next_end = {
                ["]M"] = { query = "@function.outer", desc = "Next function end" },
                ["]["] = { query = "@class.outer", desc = "Next class end" },
            },
            goto_previous_start = {
                ["[m"] = { query = "@function.outer", desc = "Previous function start" },
                ["[]"] = { query = "@class.outer", desc = "Previous class start" },
            },
            goto_previous_end = {
                ["[M"] = { query = "@function.outer", desc = "Previous function end" },
                ["[["] = { query = "@class.outer", desc = "Previous class end" },
            },
        }
    },
}
