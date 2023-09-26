vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.maxmempattern = 5000

vim.opt.spelllang = "en_gb,fr"
vim.opt.spell = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.ftplugin_sql_omni_key = "<C-O>"

vim.opt.conceallevel = 2
vim.opt.foldlevel = 2

-- Sync clipboarch between OS and Nvim
vim.opt.clipboard = "unnamedplus"

-- package option that must be set before loading the package
vim.g.slime_no_mappings = 1

vim.g.sql_type_default = "pgsql"
