return {
  -- Oil file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons", "JezerM/oil-lsp-diagnostics.nvim" },
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

      require("oil-lsp-diagnostics").setup({
        count = true,
        parent_dirs = true,
        diagnostic_colors = {
          error = "DiagnosticError",
          warn  = "DiagnosticWarn",
          info  = "DiagnosticInfo",
          hint  = "DiagnosticHint",
        },
        diagnostic_symbols = {
          error = "",
          warn = "",
          info = "",
          hint = "󰌶",
        }
      })
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
  -- Fast buffer navigation
  {
    "tjgao/quickbuf.nvim"
  },
  -- Fast buffer navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfqwerzxcv", -- Limit labels to left side of the keyboard
    },
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
