return {
  -- Disable colorscheme related plugins
  { "folke/tokyonight.nvim", enabled = false },

  -- Add new colorscheme plugins
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- Make it default in LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
