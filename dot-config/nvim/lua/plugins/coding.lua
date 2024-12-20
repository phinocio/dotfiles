return {
	-- #########################################
	-- Disable coding related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim coding plugins
	-- #########################################

	-- #########################################
	-- Add new coding plugins
	-- #########################################
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>ar", ":Laravel routes<cr>" },
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
		enabled = false,
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
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		enabled = function()
			local user = os.getenv("USER")
			return user ~= "alice"
		end,
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			-- "zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
