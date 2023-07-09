vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#555555 gui=nocombine]]


local status_ok, indent_bl = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_bl.setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
