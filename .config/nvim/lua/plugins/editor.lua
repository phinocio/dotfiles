return {
  -- Disable editor related plugins
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Change config of existing LazyVim editor plugins
  {
    "folke/which-key.nvim",
    opts = { delay = 750 },
  },

  -- Add new editor plugins
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      delete_to_trash = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", desc = "Open oil file explorer" },
    },
  },
}
