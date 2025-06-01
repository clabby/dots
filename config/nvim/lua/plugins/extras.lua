return {
  -- Handle comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
    config = function()
      require("Comment").setup {}
    end
  },
  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },
  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  },
  -- Fast buffer navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- Pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  }
}
