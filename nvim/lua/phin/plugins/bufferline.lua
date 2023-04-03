require('bufferline').setup({
	options = {
		indicator = {
			icon = ' ',
		},
		show_close_icon = false,
		tab_size = 0,
		max_name_length = 25,
		offsets = {
			{
				filetype = 'NvimTree',
				text = '  Files',
				highlight = 'StatusLine',
				text_align = 'left',
			},
		},
		separator_style = 'slant',
		modified_icon = '󰛄',
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
