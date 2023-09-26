return {

    -- better nvim
    { "ggandor/leap.nvim", config = function() require("leap").add_default_mappings() end, }, -- movement
    { "kylechui/nvim-surround", event = "VeryLazy",                                           opts = {} }, -- delimiters
    { "numToStr/Comment.nvim",  lazy = false,                                                 opts = {} }, -- comment
    "folke/zen-mode.nvim",

    -- integration
    "lifepillar/pgsql.vim", -- postgresql
    "fladson/vim-kitty", -- kitty
    "folke/neodev.nvim", -- lua
    "milisims/nvim-luaref", -- lua
    "tpope/vim-fugitive", -- git
    { "lewis6991/gitsigns.nvim",                             enable = false }, -- git

    -- Typing exercises
    { dir = "~/Documents/Programmation/Nvim/stereotype.nvim" },
}
