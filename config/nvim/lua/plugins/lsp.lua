return {
  -- Mason
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        automatic_enable = {
          exclude = {
            "rust_analyzer",
          }
        }
      }

      -- Set up diagnostic config
      local icons = require('config.icons')
      local diagnostic_styles = {
        ERROR = { text = icons.diagnostics.BoldError .. " ", hl = "Red" },
        WARN = { text = icons.diagnostics.BoldWarning .. " ", hl = "Yellow" },
        HINT = { text = icons.diagnostics.BoldHint .. " ", hl = "Green" },
        INFO = { text = icons.diagnostics.BoldInformation .. " ", hl = "Blue" }
      }
      local signs = {
        text = {},
        linehl = {},
        numhl = {},
      }
      local severity = vim.diagnostic.severity
      for level, sign in pairs(diagnostic_styles) do
        signs.text[severity[level]] = sign.text
        signs.linehl[severity[level]] = ""
        signs.numhl[severity[level]] = sign.hl
      end

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        signs = signs
      })
    end
  },
  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true
                }
              },
              files = {
                watcherExclude = {
                  ".git",
                  ".github",
                  "target",
                  "book",
                  "assets",
                  "docker",
                  "crates/protocol/registry/superchain-registry",
                  "data",
                  "monorepo"
                },
                excludeDirs = {
                  ".git",
                  ".github",
                  "target",
                  "book",
                  "assets",
                  "docker",
                  "crates/protocol/registry/superchain-registry",
                  "data",
                  "monorepo"
                }
              },
              check = {
                allTargets = true,
                command = "clippy",
              },
              cargo = {
                -- features = "all",
              },
              semanticHighlighting = {
                punctuation = {
                  enable = true,
                },
              }
            },
          },
        },
        tools = {
          test_executor = "termopen",
          enable_nextest = true,
          float_win_config = {
            border = "rounded",
          }
        },
      }
    end,
  },
  -- Rust crates
  {
    "saecki/crates.nvim",
    tag = "stable",
    lazy = true,
    ft = { "rust", "toml" },
    event = { "BufRead", "BufReadPre", "BufNewFile" },
    config = function()
      require("crates").setup {}
    end,
  },
  -- LuaLS
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },

      -- Snacks picker
      {
        "folke/snacks.nvim",
        opts = {
          terminal = {},
        }
      }
    },
    event = "LspAttach",
    opts = {
      picker = "snacks",
    },
  }
}
