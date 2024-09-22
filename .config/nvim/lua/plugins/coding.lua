return {
	-- #########################################
	-- Disable coding related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim coding plugins
	-- #########################################
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			})
		end,
	},

	-- #########################################
	-- Add new coding plugins
	-- #########################################
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>aa", ":Laravel artisan<cr>" },
			{ "<leader>ar", ":Laravel routes<cr>" },
			{ "<leader>am", ":Laravel related<cr>" },
		},
		event = { "VeryLazy" },
		opts = {
			features = {
				null_ls = {
					enable = false,
				},
				route_info = {
					enable = true, --- to enable the laravel.nvim virtual text
					position = "right", --- where to show the info (available options 'right', 'top')
					middlewares = true, --- wheather to show the middlewares section in the info
					method = true, --- wheather to show the method section in the info
					uri = true, --- wheather to show the uri section in the info
				},
			},
		},
		config = true,
	},
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<A-y>", neocodeium.accept)
			vim.keymap.set("i", "<A-w>", function()
				require("neocodeium").accept_word()
			end)
			vim.keymap.set("i", "<A-a>", function()
				require("neocodeium").accept_line()
			end)
			vim.keymap.set("i", "<A-p>", function()
				require("neocodeium").cycle_or_complete()
			end)
			vim.keymap.set("i", "<A-n>", function()
				require("neocodeium").cycle_or_complete(-1)
			end)
			vim.keymap.set("i", "<A-c>", function()
				require("neocodeium").clear()
			end)
		end,
	},
}
