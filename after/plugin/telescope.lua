local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc= "Toggle Telescope fuzzy file search"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc= "Toggle Telescope fuzzy git file search"})
vim.keymap.set('n', '<leader>ps', function()
	 builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
