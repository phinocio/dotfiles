require('nvim-treesitter.configs').setup({
	ensure_installed = { 'help', 'c', 'lua', 'php', 'javascript', 'typescript'},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	context_commentstring = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['if'] = '@function.inner',
				['af'] = '@function.outer',
				['ia'] = '@parameter.inner',
				['aa'] = '@parameter.outer',
			},
		}
	}
})
