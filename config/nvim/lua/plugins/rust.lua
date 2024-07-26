return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              diagnostics = {
                enable = true,
              },
              cargo = {
                -- features = { "optimism" },
              },
            },
          },
        },
        tools = {
          test_executor = "termopen",
          enable_nextest = true,
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
        popup = {
          border = "rounded",
        },
      })
    end,
  },
}
