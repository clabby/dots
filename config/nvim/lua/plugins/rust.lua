return {
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
    -- dependencies = {
    --   "nvim-lua/plenary.nvim",
    --   {
    --     "lvimuser/lsp-inlayhints.nvim",
    --     opts = {}
    --   },
    -- },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              cargo = {
                -- features = { "optimism" },
              },
            },
          },
        },
      }
    end,
  },
  -- crates
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    lazy = true,
    ft = { "rust", "toml" },
    event = { "BufRead", "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        -- null_ls = {
        --   enabled = true,
        --   name = "crates.nvim",
        -- },
        popup = {
          border = "rounded",
        },
      })
    end,
  },
}
