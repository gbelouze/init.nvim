vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_general_viewer = "skim"
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_toc_config = {
	mode = 1,
	fold_enable = 0,
	hide_line_numbers = 1,
	resize = 0,
	refresh_always = 1,
	show_help = 0,
	show_numbers = 1,
	split_pos = "leftabove",
	split_width = 30,
	tocdeth = 3,
	indent_levels = 1,
	todo_sorted = 1,
}
vim.g.vimtex_compiler_latexmk = {
	build_dir = ".build",
}
vim.g.vimtex_quickfix_open_on_warning = false
-- vim.g.vimtex_latexmk_options = "-shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode"
-- vim.g.vimtex_compiler_latexmk = "lualatex"
-- vim.cmd([[ syntax enable ]])
-- vim.g.vimtex_compiler_latexmk_engines = {
-- 	_        = '-lualatex',
-- 	pdflatex = '-pdf',
-- 	dvipdfex = '-pdfdvi',
-- 	lualatex = '-lualatex',
-- 	xelatex  = '-xelatex'
-- }

local api = vim.api

local function FocusVim()
	vim.cmd([[silent execute "!open -a iTerm"]])
end

local function MovePdf() -- Move pdf
	local path = vim.b.vimtex.tex
	local base_start, base_end = string.find(path, "[^/]*[.]tex")
	base_end = base_end - 4 -- ignore the ".tex"
	local base = string.sub(path, base_start, base_end)
	local dir = string.sub(path, 1, base_start - 1)
	local pdf = dir .. ".build/" .. base .. ".pdf"
	local new_pdf = dir .. base .. ".pdf"
	local pdf_file = vim.fn.readfile(pdf, "b")
	vim.fn.writefile(pdf_file, new_pdf, "b")
	vim.cmd(string.format([[call vimtex#log#info('Moved %s out of .build')]], pdf))
end

local VimTexAugroup = api.nvim_create_augroup("VimTex", { clear = true })
api.nvim_create_autocmd("User", {
	pattern = "VimtexEventViewReverse",
	callback = function()
		vim.schedule(FocusVim)
	end,
	group = VimTexAugroup,
})
api.nvim_create_autocmd("User", {
	pattern = "VimtexEventCompileSuccess",
	callback = function()
		vim.schedule(MovePdf)
	end,
})
