return {
  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
    config = function(_, _)
      vim.g.skip_ts_context_commentstring_module = true
      require("Comment").setup({})
      require("ts_context_commentstring").setup({})
    end,
  },
}
