return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        init = function(_)
            local wk = require("which-key")
            wk.register({
                ["<leader>"] = {
                    t = {
                        name = "+tree",
                        t = {
                            function()
                                vim.cmd("Neotree focus")
                            end,
                            "Open Neotree",
                        },
                        w = {
                            function()
                                vim.cmd("Neotree close")
                            end,
                            "Close Neotree",
                        },
                        b = {
                            function()
                                vim.cmd("Neotree focus buffers")
                            end,
                            "Open current buffer tree",
                        },
                        c = {
                            function()
                                vim.cmd("Neotree ~/.config/nvim/init.lua reveal_force_cwd")
                            end,
                            "Open nvim configuration directory",
                        },
                        g = {
                            function()
                                vim.cmd("Neotree float git_status")
                            end,
                            "Open a git status window",
                        },
                    },
                },
            })
        end,
    },
}
