vim.keymap.set("n", "<leader>/", vim.cmd.noh)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move lines down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move lines up"})

vim.keymap.set("n", "J", "mzJ`z", {desc = "Append next line to current"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Half page jump up"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Half page jump down"})
vim.keymap.set("n", "n", "nzzzv", {desc = "Next search hit"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous search hit"})

vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Paste without yanking"})

vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Yank to system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Yank to system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Yank current line to system clipboard"})

vim.keymap.set("n", "<leader>d", "\"_d", {desc = "Delete without yanking"})
vim.keymap.set("v", "<leader>d", "\"_d", {desc = "Delete without yanking"})

vim.keymap.set("n", "Q", "<nop>", {desc = "No op"})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {desc = "Quickfix navigation"})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {desc = "Quickfix navigation"})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "Quickfix navigation"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "Quickfix navigation"})

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc= "Edit all occurences of the current word"})
vim.keymap.set("n", "<leader>S", ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc= "Edit all occurences of the current word"})
