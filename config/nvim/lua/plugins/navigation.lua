return {
  -- Oil file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        float = {
          preview_split = 'right',
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        }
      }
    end,
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },
  -- Dart
  {
    'iofq/dart.nvim',
    dependencies = {
      'echasnovski/mini.nvim',        -- optional, icons provider
      'nvim-tree/nvim-web-devicons'   -- optional, icons provider
    },
    opts = {}                         -- see Configuration section
  }
}
